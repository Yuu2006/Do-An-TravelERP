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
import com.digitaltravel.erp.dto.requests.NguoiDongHanhRequest;
import com.digitaltravel.erp.dto.responses.ChiTietDatTourResponse;
import com.digitaltravel.erp.dto.responses.ChiTietDichVuResponse;
import com.digitaltravel.erp.dto.responses.DonDatTourResponse;
import com.digitaltravel.erp.entity.ChiTietDatTour;
import com.digitaltravel.erp.entity.ChiTietDichVu;
import com.digitaltravel.erp.entity.DichVuThem;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.DsNguoiDongHanh;
import com.digitaltravel.erp.entity.HanhDongXanh;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.ChiTietDatTourRepository;
import com.digitaltravel.erp.repository.ChiTietDichVuRepository;
import com.digitaltravel.erp.repository.DichVuThemRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.DsNguoiDongHanhRepository;
import com.digitaltravel.erp.repository.HanhDongXanhRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
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
    private final DichVuThemRepository dichVuThemRepository;
    private final DsNguoiDongHanhRepository dsNguoiDongHanhRepository;
    private final HanhDongXanhRepository hanhDongXanhRepository;

    // ── Đặt tour ────────────────────────────────────────────────────────────
    @Transactional
    public DonDatTourResponse datTour(String maTaiKhoan, DatTourRequest request) {
        HoChieuSo khachHang = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khach hang chua co ho so. Vui long lien he ho tro."));
        List<NguoiDongHanhRequest> dsNguoiDongHanh = request.getDanhSachNguoiDongHanh() != null
                ? request.getDanhSachNguoiDongHanh()
                : List.of();
        int soKhach = 1 + dsNguoiDongHanh.size();

        TourThucTe tour = kiemTraDieuKienDatTour(request.getMaTourThucTe(), soKhach);
        List<String> dsHanhDongXanh = kiemTraHanhDongXanh(tour, request.getDanhSachHanhDongXanh());
        List<ChiTietDichVu> dsDichVu = taoChiTietDichVuTam(request);
        BigDecimal tongTien = tinhTongTienDonHang(tour, soKhach, dsDichVu);
        DonDatTour don = taoDonDatTour(khachHang, tour, tongTien, request.getGhiChu(), dsHanhDongXanh);
        List<ChiTietDatTour> dsChiTiet = new ArrayList<>();

        ChiTietDatTour chiTietNguoiDat = new ChiTietDatTour();
        chiTietNguoiDat.setMaChiTietDat("CTDT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        chiTietNguoiDat.setDonDatTour(don);
        chiTietNguoiDat.setKhachHang(khachHang);
        chiTietNguoiDat.setLoaiKhach("NGUOI_DAT");
        chiTietNguoiDat.setGiaTaiThoiDiemDat(tour.getGiaHienHanh());
        chiTietDatTourRepository.save(chiTietNguoiDat);
        dsChiTiet.add(chiTietNguoiDat);

        for (NguoiDongHanhRequest nguoiReq : dsNguoiDongHanh) {
            DsNguoiDongHanh nguoiDongHanh = new DsNguoiDongHanh();
            nguoiDongHanh.setMaNguoiDongHanh("NDH_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            nguoiDongHanh.setDonDatTour(don);
            nguoiDongHanh.setHoTen(nguoiReq.getHoTen());
            nguoiDongHanh.setCccd(nguoiReq.getCccd());
            nguoiDongHanh.setSoDienThoai(nguoiReq.getSoDienThoai());
            nguoiDongHanh.setNgaySinh(nguoiReq.getNgaySinh());
            nguoiDongHanh.setGioiTinh(nguoiReq.getGioiTinh());
            nguoiDongHanh.setGhiChu(nguoiReq.getGhiChu());
            dsNguoiDongHanhRepository.save(nguoiDongHanh);

            ChiTietDatTour chiTietNguoiDongHanh = new ChiTietDatTour();
            chiTietNguoiDongHanh.setMaChiTietDat("CTDT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            chiTietNguoiDongHanh.setDonDatTour(don);
            chiTietNguoiDongHanh.setNguoiDongHanh(nguoiDongHanh);
            chiTietNguoiDongHanh.setLoaiKhach("NGUOI_DONG_HANH");
            chiTietNguoiDongHanh.setGiaTaiThoiDiemDat(tour.getGiaHienHanh());
            chiTietDatTourRepository.save(chiTietNguoiDongHanh);
            dsChiTiet.add(chiTietNguoiDongHanh);
        }

        luuChiTietDichVu(don, dsDichVu);

        return toResponse(don, dsChiTiet, dsDichVu);
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
        donDatTourRepository.save(don);
        // Không cần hoàn ChoConLai vì chưa trừ (chưa thanh toán)
    }

    // ── Nhân viên Sales: xem tất cả đơn ────────────────────────────────────
    @Transactional(readOnly = true)
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
        donDatTourRepository.save(don);

        List<ChiTietDatTour> dsChiTiet = chiTietDatTourRepository.findByMaDatTour(maDatTour);
        List<ChiTietDichVu> dsDichVu = chiTietDichVuRepository.findByMaDatTour(maDatTour);
        return toResponse(don, dsChiTiet, dsDichVu);
    }

    private TourThucTe kiemTraDieuKienDatTour(String maTourThucTe, int soKhach) {
        TourThucTe tour = tourThucTeRepository.findById(maTourThucTe)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + maTourThucTe));
        if (!"MO_BAN".equals(tour.getTrangThai())) {
            throw AppException.badRequest("Tour khong o trang thai MO_BAN, khong the dat");
        }
        if (tour.getChoConLai() < soKhach) {
            throw AppException.badRequest("Tour da het cho");
        }
        return tour;
    }

    private List<String> kiemTraHanhDongXanh(TourThucTe tour, List<String> dsMaHanhDongXanh) {
        if (dsMaHanhDongXanh == null || dsMaHanhDongXanh.isEmpty()) {
            return List.of();
        }
        List<String> dsMaHopLe = dsMaHanhDongXanh.stream()
                .filter(ma -> ma != null && !ma.isBlank())
                .distinct()
                .toList();
        for (String maHanhDongXanh : dsMaHopLe) {
            HanhDongXanh hdx = hanhDongXanhRepository.findById(maHanhDongXanh)
                    .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + maHanhDongXanh));
            TourThucTe tourGanVoiHanhDong = hdx.getTourThucTe();
            if (tourGanVoiHanhDong != null
                    && !tour.getMaTourThucTe().equals(tourGanVoiHanhDong.getMaTourThucTe())) {
                throw AppException.badRequest("Hanh dong xanh khong thuoc tour thuc te: " + maHanhDongXanh);
            }
        }
        return dsMaHopLe;
    }

    private List<ChiTietDichVu> taoChiTietDichVuTam(DatTourRequest request) {
        List<ChiTietDichVu> dsDichVu = new ArrayList<>();
        if (request.getDanhSachDichVu() == null) {
            return dsDichVu;
        }
        for (DichVuThemDatRequest dvReq : request.getDanhSachDichVu()) {
            DichVuThem dv = dichVuThemRepository.findById(dvReq.getMaDichVuThem())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay dich vu: " + dvReq.getMaDichVuThem()));
            BigDecimal thanhTien = dv.getDonGia().multiply(BigDecimal.valueOf(dvReq.getSoLuong()));

            ChiTietDichVu ct = new ChiTietDichVu();
            ct.setMaChiTietDichVu("CTDV_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            ct.setDichVuThem(dv);
            ct.setSoLuong(dvReq.getSoLuong());
            ct.setDonGia(dv.getDonGia());
            ct.setThanhTien(thanhTien);
            dsDichVu.add(ct);
        }
        return dsDichVu;
    }

    private BigDecimal tinhTongTienDonHang(TourThucTe tour, int soKhach, List<ChiTietDichVu> dsDichVu) {
        BigDecimal tongTienTour = tour.getGiaHienHanh().multiply(BigDecimal.valueOf(soKhach));
        BigDecimal tongTienDichVu = dsDichVu.stream()
                .map(ChiTietDichVu::getThanhTien)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        return tongTienTour.add(tongTienDichVu);
    }

    private DonDatTour taoDonDatTour(HoChieuSo khachHang,
                                     TourThucTe tour,
                                     BigDecimal tongTien,
                                     String ghiChu,
                                     List<String> dsHanhDongXanh) {
        DonDatTour don = new DonDatTour();
        don.setMaDatTour("DDT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        don.setTourThucTe(tour);
        don.setKhachHang(khachHang);
        don.setNgayDat(LocalDateTime.now());
        don.setTongTien(tongTien);
        don.setTrangThai("CHO_XAC_NHAN");
        don.setThoiGianHetHan(LocalDateTime.now().plusDays(2));
        don.setGhiChu(ghiChu);
        don.setHanhDongXanh(String.join(",", dsHanhDongXanh));
        return donDatTourRepository.save(don);
    }

    private void luuChiTietDichVu(DonDatTour don, List<ChiTietDichVu> dsDichVu) {
        for (ChiTietDichVu ctdv : dsDichVu) {
            ctdv.setDonDatTour(don);
            chiTietDichVuRepository.save(ctdv);
        }
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
                .danhSachHanhDongXanh(parseHanhDongXanh(don.getHanhDongXanh()))
                .chiTietKhach(dsChiTiet.stream().map(this::toChiTietResponse).toList())
                .chiTietDichVu(dsDichVu.stream().map(this::toDichVuResponse).toList())
                .build();
    }

    private List<String> parseHanhDongXanh(String value) {
        if (value == null || value.isBlank()) {
            return List.of();
        }
        return List.of(value.split(","));
    }

    private ChiTietDatTourResponse toChiTietResponse(ChiTietDatTour ct) {
        HoChieuSo khachHang = ct.getKhachHang();
        DsNguoiDongHanh nguoiDongHanh = ct.getNguoiDongHanh();

        return ChiTietDatTourResponse.builder()
                .maChiTietDat(ct.getMaChiTietDat())
                .loaiKhach(ct.getLoaiKhach())
                .maKhachHang(khachHang != null ? khachHang.getMaKhachHang() : null)
                .maNguoiDongHanh(nguoiDongHanh != null ? nguoiDongHanh.getMaNguoiDongHanh() : null)
                .hoTen(khachHang != null ? khachHang.getTaiKhoan().getHoTen() : nguoiDongHanh.getHoTen())
                .cccd(khachHang != null ? khachHang.getCccd() : nguoiDongHanh.getCccd())
                .soDienThoai(khachHang != null ? khachHang.getSoDienThoai() : nguoiDongHanh.getSoDienThoai())
                .ngaySinh(nguoiDongHanh != null ? nguoiDongHanh.getNgaySinh() : null)
                .gioiTinh(nguoiDongHanh != null ? nguoiDongHanh.getGioiTinh() : null)
                .ghiChu(nguoiDongHanh != null ? nguoiDongHanh.getGhiChu() : null)
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
