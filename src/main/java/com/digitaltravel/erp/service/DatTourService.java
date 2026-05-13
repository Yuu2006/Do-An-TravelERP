package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.DatTourRequest;
import com.digitaltravel.erp.dto.requests.DichVuThemDatRequest;
import com.digitaltravel.erp.dto.responses.ChiTietDatTourResponse;
import com.digitaltravel.erp.dto.responses.ChiTietDichVuResponse;
import com.digitaltravel.erp.dto.responses.DonDatTourResponse;
import com.digitaltravel.erp.entity.ChiTietDatTour;
import com.digitaltravel.erp.entity.ChiTietDichVu;
import com.digitaltravel.erp.entity.DichVuThem;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.LoaiPhong;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.ChiTietDatTourRepository;
import com.digitaltravel.erp.repository.ChiTietDichVuRepository;
import com.digitaltravel.erp.repository.DichVuThemRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.LoaiPhongRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DatTourService {

    private final DonDatTourRepository donDatTourRepository;
    private final ChiTietDatTourRepository chiTietDatTourRepository;
    private final ChiTietDichVuRepository chiTietDichVuRepository;
    private final TourThucTeRepository tourThucTeRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final LoaiPhongRepository loaiPhongRepository;
    private final DichVuThemRepository dichVuThemRepository;

    // ── Đặt tour ────────────────────────────────────────────────────────────
    @Transactional
    public DonDatTourResponse datTour(String maTaiKhoan, DatTourRequest request) {
        // 1. Tìm hồ sơ khách hàng
        HoChieuSo khachHang = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khach hang chua co ho so. Vui long lien he ho tro."));

        // 2. Kiểm tra tour thực tế
        TourThucTe tour = tourThucTeRepository.findById(request.getMaTourThucTe())
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + request.getMaTourThucTe()));

        if (!"MO_BAN".equals(tour.getTrangThai())) {
            throw AppException.badRequest("Tour khong o trang thai MO_BAN, khong the dat");
        }
        if (tour.getChoConLai() < 1) {
            throw AppException.badRequest("Tour da het cho");
        }

        // 3. Xử lý loại phòng (tuỳ chọn)
        LoaiPhong loaiPhong = null;
        BigDecimal phuThuPhong = BigDecimal.ZERO;
        if (request.getMaLoaiPhong() != null && !request.getMaLoaiPhong().isBlank()) {
            loaiPhong = loaiPhongRepository.findById(request.getMaLoaiPhong())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay loai phong: " + request.getMaLoaiPhong()));
            if (!"HOAT_DONG".equals(loaiPhong.getTrangThai())) {
                throw AppException.badRequest("Loai phong khong con hoat dong: " + request.getMaLoaiPhong());
            }
            phuThuPhong = loaiPhong.getMucPhuThu();
        }

        // 4. Tính tổng tiền dịch vụ bổ sung
        List<ChiTietDichVu> dsDichVu = new ArrayList<>();
        BigDecimal tongTienDichVu = BigDecimal.ZERO;
        if (request.getDanhSachDichVu() != null) {
            for (DichVuThemDatRequest dvReq : request.getDanhSachDichVu()) {
                DichVuThem dv = dichVuThemRepository.findById(dvReq.getMaDichVuThem())
                        .orElseThrow(() -> AppException.notFound("Khong tim thay dich vu: " + dvReq.getMaDichVuThem()));
                if (!"HOAT_DONG".equals(dv.getTrangThai())) {
                    throw AppException.badRequest("Dich vu khong con hoat dong: " + dvReq.getMaDichVuThem());
                }
                BigDecimal thanhTien = dv.getDonGia().multiply(BigDecimal.valueOf(dvReq.getSoLuong()));
                tongTienDichVu = tongTienDichVu.add(thanhTien);

                ChiTietDichVu ct = new ChiTietDichVu();
                ct.setMaChiTietDichVu("CTDV_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
                ct.setDichVuThem(dv);
                ct.setSoLuong(dvReq.getSoLuong());
                ct.setDonGia(dv.getDonGia());
                ct.setThanhTien(thanhTien);
                dsDichVu.add(ct);
            }
        }

        // 5. Tính tổng tiền đơn đặt
        BigDecimal giaPerPerson = tour.getGiaHienHanh().add(phuThuPhong);
        BigDecimal tongTien = giaPerPerson.add(tongTienDichVu);

        // 6. Tạo đơn đặt tour
        DonDatTour don = new DonDatTour();
        don.setMaDatTour("DDT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        don.setTourThucTe(tour);
        don.setKhachHang(khachHang);
        don.setNgayDat(LocalDateTime.now());
        don.setTongTien(tongTien);
        don.setTrangThai("CHO_XAC_NHAN");
        // Giữ chỗ 15 phút, Scheduler sẽ tự hủy nếu chưa thanh toán
        don.setThoiGianHetHan(LocalDateTime.now().plusMinutes(15));
        don.setGhiChu(request.getGhiChu());
        don.setTaoBoi(maTaiKhoan);
        donDatTourRepository.save(don);

        // 7. Tạo chi tiết đặt tour (1 dòng cho người đặt chính)
        BigDecimal giaTaiThoiDiemDat = giaPerPerson;
        ChiTietDatTour chiTiet = new ChiTietDatTour();
        chiTiet.setMaChiTietDat("CTDT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        chiTiet.setDonDatTour(don);
        chiTiet.setKhachHang(khachHang);
        chiTiet.setLoaiPhong(loaiPhong);
        chiTiet.setGiaTaiThoiDiemDat(giaTaiThoiDiemDat);
        chiTietDatTourRepository.save(chiTiet);

        // 8. Lưu các chi tiết dịch vụ
        for (ChiTietDichVu ctdv : dsDichVu) {
            ctdv.setDonDatTour(don);
            chiTietDichVuRepository.save(ctdv);
        }

        // 9. KHÔNG trừ ChoConLai ngay — chỉ trừ sau khi thanh toán thành công

        return toResponse(don, List.of(chiTiet), dsDichVu);
    }

    // ── Danh sách đơn đặt tour của tôi ─────────────────────────────────────
    public Page<DonDatTourResponse> danhSachCuaToi(String maTaiKhoan, Pageable pageable) {
        HoChieuSo khachHang = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        return donDatTourRepository.findByMaKhachHang(khachHang.getMaKhachHang(), pageable)
                .map(don -> {
                    List<ChiTietDatTour> dsChiTiet = chiTietDatTourRepository.findByMaDatTour(don.getMaDatTour());
                    List<ChiTietDichVu> dsDichVu = chiTietDichVuRepository.findByMaDatTour(don.getMaDatTour());
                    return toResponse(don, dsChiTiet, dsDichVu);
                });
    }

    // ── Chi tiết đơn đặt tour của tôi ──────────────────────────────────────
    public DonDatTourResponse chiTietCuaToi(String maTaiKhoan, String maDatTour) {
        HoChieuSo khachHang = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        DonDatTour don = donDatTourRepository.findByIdAndMaKhachHang(maDatTour, khachHang.getMaKhachHang())
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + maDatTour));

        List<ChiTietDatTour> dsChiTiet = chiTietDatTourRepository.findByMaDatTour(maDatTour);
        List<ChiTietDichVu> dsDichVu = chiTietDichVuRepository.findByMaDatTour(maDatTour);
        return toResponse(don, dsChiTiet, dsDichVu);
    }

    // ── Hủy đặt tour ────────────────────────────────────────────────────────
    @Transactional
    public void huyDatTour(String maTaiKhoan, String maDatTour) {
        HoChieuSo khachHang = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        DonDatTour don = donDatTourRepository.findByIdAndMaKhachHang(maDatTour, khachHang.getMaKhachHang())
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + maDatTour));

        String trangThai = don.getTrangThai();
        if (!"CHO_XAC_NHAN".equals(trangThai) && !"HET_HAN_GIU_CHO".equals(trangThai)) {
            throw AppException.badRequest(
                    "Chi co the huy don o trang thai CHO_XAC_NHAN. Trang thai hien tai: " + trangThai);
        }

        don.setTrangThai("DA_HUY");
        don.setCapNhatBoi(maTaiKhoan);
        donDatTourRepository.save(don);
        // Không cần hoàn ChoConLai vì chưa trừ (chưa thanh toán)
    }

    // ── Nhân viên Sales: xem tất cả đơn ────────────────────────────────────
    public Page<DonDatTourResponse> danhSachTatCa(String trangThai, String maTourThucTe, Pageable pageable) {
        return donDatTourRepository.timKiem(trangThai, maTourThucTe, pageable)
                .map(don -> {
                    List<ChiTietDatTour> dsChiTiet = chiTietDatTourRepository.findByMaDatTour(don.getMaDatTour());
                    List<ChiTietDichVu> dsDichVu = chiTietDichVuRepository.findByMaDatTour(don.getMaDatTour());
                    return toResponse(don, dsChiTiet, dsDichVu);
                });
    }

    // ── Nhân viên Sales: xác nhận đơn ──────────────────────────────────────
    @Transactional
    public DonDatTourResponse xacNhanDon(String maDatTour, String nguoiXacNhan) {
        DonDatTour don = donDatTourRepository.findById(maDatTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + maDatTour));

        if (!"CHO_XAC_NHAN".equals(don.getTrangThai())) {
            throw AppException.badRequest(
                    "Chi co the xac nhan don o trang thai CHO_XAC_NHAN. Trang thai hien tai: " + don.getTrangThai());
        }

        don.setTrangThai("DA_XAC_NHAN");
        don.setCapNhatBoi(nguoiXacNhan);
        donDatTourRepository.save(don);

        List<ChiTietDatTour> dsChiTiet = chiTietDatTourRepository.findByMaDatTour(maDatTour);
        List<ChiTietDichVu> dsDichVu = chiTietDichVuRepository.findByMaDatTour(maDatTour);
        return toResponse(don, dsChiTiet, dsDichVu);
    }

    // ── Mapper ────────────────────────────────────────────────────────────────
    private DonDatTourResponse toResponse(DonDatTour don,
                                          List<ChiTietDatTour> dsChiTiet,
                                          List<ChiTietDichVu> dsDichVu) {
        TourThucTe ttt = don.getTourThucTe();
        return DonDatTourResponse.builder()
                .maDatTour(don.getMaDatTour())
                .maTourThucTe(ttt.getMaTourThucTe())
                .tieuDeTour(ttt.getTourMau().getTieuDe())
                .ngayKhoiHanh(ttt.getNgayKhoiHanh())
                .giaHienHanh(ttt.getGiaHienHanh())
                .thoiLuong(ttt.getTourMau().getThoiLuong())
                .maKhachHang(don.getKhachHang().getMaKhachHang())
                .tenKhachHang(don.getKhachHang().getTaiKhoan().getHoTen())
                .ngayDat(don.getNgayDat())
                .tongTien(don.getTongTien())
                .trangThai(don.getTrangThai())
                .thoiGianHetHan(don.getThoiGianHetHan())
                .ghiChu(don.getGhiChu())
                .chiTietKhach(dsChiTiet.stream().map(this::toChiTietResponse).toList())
                .chiTietDichVu(dsDichVu.stream().map(this::toDichVuResponse).toList())
                .build();
    }

    private ChiTietDatTourResponse toChiTietResponse(ChiTietDatTour ct) {
        return ChiTietDatTourResponse.builder()
                .maChiTietDat(ct.getMaChiTietDat())
                .maKhachHang(ct.getKhachHang().getMaKhachHang())
                .hoTen(ct.getKhachHang().getTaiKhoan().getHoTen())
                .maLoaiPhong(ct.getLoaiPhong() != null ? ct.getLoaiPhong().getMaLoaiPhong() : null)
                .tenLoaiPhong(ct.getLoaiPhong() != null ? ct.getLoaiPhong().getTenLoai() : null)
                .mucPhuThu(ct.getLoaiPhong() != null ? ct.getLoaiPhong().getMucPhuThu() : BigDecimal.ZERO)
                .giaTaiThoiDiemDat(ct.getGiaTaiThoiDiemDat())
                .build();
    }

    private ChiTietDichVuResponse toDichVuResponse(ChiTietDichVu cv) {
        return ChiTietDichVuResponse.builder()
                .maChiTietDichVu(cv.getMaChiTietDichVu())
                .maDichVuThem(cv.getDichVuThem().getMaDichVuThem())
                .tenDichVu(cv.getDichVuThem().getTen())
                .donViTinh(cv.getDichVuThem().getDonViTinh())
                .soLuong(cv.getSoLuong())
                .donGia(cv.getDonGia())
                .thanhTien(cv.getThanhTien())
                .build();
    }
}
