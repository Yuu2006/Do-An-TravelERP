package com.digitaltravel.erp.service;

import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.CapNhatTourThucTeRequest;
import com.digitaltravel.erp.dto.requests.TaoTourThucTeRequest;
import com.digitaltravel.erp.dto.responses.LichTrinhResponse;
import com.digitaltravel.erp.dto.responses.TourCongKhaiResponse;
import com.digitaltravel.erp.dto.responses.TourThucTeResponse;
import com.digitaltravel.erp.entity.LichTrinhTour;
import com.digitaltravel.erp.entity.TourMau;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.LichTrinhTourRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.TourMauRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TourThucTeService {

    private final TourThucTeRepository tourThucTeRepository;
    private final TourMauRepository tourMauRepository;
    private final LichTrinhTourRepository lichTrinhTourRepository;
    private final DonDatTourRepository donDatTourRepository;

    // ── UC14: Danh sách tour thực tế (nội bộ - có filter) ───────────────────
    public Page<TourThucTeResponse> danhSach(String trangThai, String maTourMau,
                                              java.math.BigDecimal giaTu, java.math.BigDecimal giaDen,
                                              Pageable pageable) {
        return tourThucTeRepository.timKiem(trangThai, maTourMau, giaTu, giaDen, pageable)
                .map(this::toResponse);
    }

    // ── UC14: Danh sách tour thực tế (công khai cho KH) ─────────────────────
    public Page<TourThucTeResponse> danhSachCongKhai(java.math.BigDecimal giaTu, java.math.BigDecimal giaDen,
                                                      Integer thoiLuongMin, Integer thoiLuongMax,
                                                      Pageable pageable) {
        return tourThucTeRepository.timKiemCongKhai(giaTu, giaDen, thoiLuongMin, thoiLuongMax, pageable)
                .map(this::toResponse);
    }

    // ── UC14: Chi tiết tour thực tế ─────────────────────────────────────────
    public TourThucTeResponse chiTiet(String id) {
        TourThucTe ttt = tourThucTeRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + id));
        return toResponse(ttt);
    }

    // ── UC26: Chi tiết tour công khai kèm lịch trình ────────────────────────
    public TourCongKhaiResponse chiTietCongKhai(String id) {
        TourThucTe ttt = tourThucTeRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + id));
        TourMau tm = ttt.getTourMau();

        java.util.List<LichTrinhTour> lichTrinh = lichTrinhTourRepository.findByMaTourMau(tm.getMaTourMau());
        java.util.List<LichTrinhResponse> lichTrinhResponses = lichTrinh.stream()
                .map(lt -> LichTrinhResponse.builder()
                        .maLichTrinhTour(lt.getMaLichTrinhTour())
                        .ngayThu(lt.getNgayThu())
                        .hoatDong(lt.getHoatDong())
                        .moTa(lt.getMoTa())
                        .thucDon(lt.getThucDon())
                        .build())
                .toList();

        return TourCongKhaiResponse.builder()
                .maTourThucTe(ttt.getMaTourThucTe())
                .maTourMau(tm.getMaTourMau())
                .tieuDeTour(tm.getTieuDe())
                .moTa(tm.getMoTa())
                .ngayKhoiHanh(ttt.getNgayKhoiHanh())
                .thoiLuong(tm.getThoiLuong())
                .giaHienHanh(ttt.getGiaHienHanh())
                .soKhachToiDa(ttt.getSoKhachToiDa())
                .choConLai(ttt.getChoConLai())
                .trangThai(ttt.getTrangThai())
                .diemDanhGia(tm.getDanhGia())
                .soDanhGia(tm.getSoDanhGia())
                .lichTrinh(lichTrinhResponses)
                .build();
    }

    // ── UC11: Khởi tạo tour thực tế từ tour mẫu ────────────────────────────
    @Transactional
    public TourThucTeResponse taoMoi(TaoTourThucTeRequest request, String nguoiTao) {
        TourMau tourMau = tourMauRepository.findById(request.getMaTourMau())
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour mau: " + request.getMaTourMau()));

        if (!"HOAT_DONG".equals(tourMau.getTrangThai())) {
            throw AppException.badRequest("Tour mau khong o trang thai HOAT_DONG");
        }

        Integer soKhachToiThieu = request.getSoKhachToiThieu() != null
                ? request.getSoKhachToiThieu() : 1;

        if (soKhachToiThieu > request.getSoKhachToiDa()) {
            throw AppException.badRequest("So khach toi thieu khong duoc lon hon so khach toi da");
        }

        if (request.getGiaHienHanh().compareTo(tourMau.getGiaSan()) < 0) {
            throw AppException.badRequest("Gia hien hanh khong duoc thap hon gia san cua tour mau ("
                    + tourMau.getGiaSan() + ")");
        }

        TourThucTe ttt = new TourThucTe();
        ttt.setMaTourThucTe("TTT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        ttt.setTourMau(tourMau);
        ttt.setNgayKhoiHanh(request.getNgayKhoiHanh());
        ttt.setGiaHienHanh(request.getGiaHienHanh());
        ttt.setSoKhachToiDa(request.getSoKhachToiDa());
        ttt.setSoKhachToiThieu(soKhachToiThieu);
        ttt.setChoConLai(request.getSoKhachToiDa());
        ttt.setTrangThai("MO_BAN");
        ttt.setTaoBoi(nguoiTao);
        tourThucTeRepository.save(ttt);

        return toResponse(ttt);
    }

    // ── UC13: Sửa tour thực tế ──────────────────────────────────────────────
    @Transactional
    public TourThucTeResponse capNhat(String id, CapNhatTourThucTeRequest request, String nguoiCapNhat) {
        TourThucTe ttt = tourThucTeRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + id));

        if (request.getGiaHienHanh() != null) {
            ttt.setGiaHienHanh(request.getGiaHienHanh());
        }
        if (request.getSoKhachToiDa() != null) {
            if (request.getSoKhachToiDa() < ttt.getSoKhachToiThieu()) {
                throw AppException.badRequest("So khach toi da khong duoc nho hon so khach toi thieu");
            }
            ttt.setSoKhachToiDa(request.getSoKhachToiDa());
        }
        if (request.getSoKhachToiThieu() != null) {
            if (request.getSoKhachToiThieu() > ttt.getSoKhachToiDa()) {
                throw AppException.badRequest("So khach toi thieu khong duoc lon hon so khach toi da");
            }
            ttt.setSoKhachToiThieu(request.getSoKhachToiThieu());
        }
        if (request.getTrangThai() != null) {
            validateTrangThaiTourThucTe(request.getTrangThai());
            ttt.setTrangThai(request.getTrangThai());
        }
        ttt.setCapNhatBoi(nguoiCapNhat);
        tourThucTeRepository.save(ttt);

        return toResponse(ttt);
    }

    // ── UC12: Xóa tour thực tế ──────────────────────────────────────────────
    @Transactional
    public void xoa(String id) {
        TourThucTe ttt = tourThucTeRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + id));

        // Chỉ cho xóa khi ở trạng thái CHO_KICH_HOAT hoặc MO_BAN (chưa có đơn xác nhận)
        if (!"CHO_KICH_HOAT".equals(ttt.getTrangThai()) && !"MO_BAN".equals(ttt.getTrangThai())) {
            throw AppException.badRequest("Chi co the xoa tour thuc te o trang thai CHO_KICH_HOAT hoac MO_BAN");
        }
        if (donDatTourRepository.countBlockingBookingsByTourThucTe(id) > 0) {
            throw AppException.badRequest("Khong the xoa tour thuc te da phat sinh don dat tour");
        }

        ttt.setTrangThai("HUY");
        tourThucTeRepository.save(ttt);
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private void validateTrangThaiTourThucTe(String trangThai) {
        if (!java.util.Set.of("CHO_KICH_HOAT", "MO_BAN", "SAP_DIEN_RA",
                "DANG_DIEN_RA", "KET_THUC", "HUY", "DA_QUYET_TOAN").contains(trangThai)) {
            throw AppException.badRequest("Trang thai khong hop le: " + trangThai);
        }
    }

    private TourThucTeResponse toResponse(TourThucTe ttt) {
        TourMau tm = ttt.getTourMau();
        java.time.LocalDate ngayKetThuc = ttt.getNgayKhoiHanh().plusDays(tm.getThoiLuong() - 1);

        return TourThucTeResponse.builder()
                .maTourThucTe(ttt.getMaTourThucTe())
                .maTourMau(tm.getMaTourMau())
                .tieuDeTour(tm.getTieuDe())
                .ngayKhoiHanh(ttt.getNgayKhoiHanh())
                .ngayKetThuc(ngayKetThuc)
                .giaHienHanh(ttt.getGiaHienHanh())
                .soKhachToiDa(ttt.getSoKhachToiDa())
                .soKhachToiThieu(ttt.getSoKhachToiThieu())
                .choConLai(ttt.getChoConLai())
                .trangThai(ttt.getTrangThai())
                .taoBoi(ttt.getTaoBoi())
                .build();
    }
}
