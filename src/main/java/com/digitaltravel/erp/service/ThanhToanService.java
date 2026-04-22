package com.digitaltravel.erp.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.KhoiTaoThanhToanRequest;
import com.digitaltravel.erp.dto.responses.ThanhToanResponse;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.GiaoDich;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.LichSuTour;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.GiaoDichRepository;
import com.digitaltravel.erp.repository.LichSuTourRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThanhToanService {

    private static final Logger log = LoggerFactory.getLogger(ThanhToanService.class);

    private final DonDatTourRepository donDatTourRepository;
    private final GiaoDichRepository giaoDichRepository;
    private final LichSuTourRepository lichSuTourRepository;
    private final TourThucTeRepository tourThucTeRepository;

    // ── Khởi tạo thanh toán ────────────────────────────────────────────────
    @Transactional
    public ThanhToanResponse khoiTaoThanhToan(String maTaiKhoan, KhoiTaoThanhToanRequest request) {
        DonDatTour don = donDatTourRepository.findByIdWithDetails(request.getMaDonDatTour())
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + request.getMaDonDatTour()));

        // Kiểm tra chủ sở hữu đơn
        if (!don.getKhachHang().getTaiKhoan().getMaTaiKhoan().equals(maTaiKhoan)) {
            throw AppException.forbidden("Ban khong co quyen thanh toan don nay");
        }

        // Chỉ thanh toán đơn CHO_XAC_NHAN và chưa hết hạn
        if (!"CHO_XAC_NHAN".equals(don.getTrangThai())) {
            throw AppException.badRequest(
                    "Don chi co the thanh toan o trang thai CHO_XAC_NHAN. Hien tai: " + don.getTrangThai());
        }
        if (don.getThoiGianHetHan() != null && don.getThoiGianHetHan().isBefore(LocalDateTime.now())) {
            throw AppException.badRequest("Don dat tour da het han giu cho. Vui long dat lai.");
        }

        // Kiểm tra xem đã có giao dịch thành công chưa (idempotency)
        if (giaoDichRepository.findThanhCongByMaDatTour(request.getMaDonDatTour()).isPresent()) {
            throw AppException.badRequest("Don nay da duoc thanh toan thanh cong truoc do.");
        }

        String phuongThuc = (request.getPhuongThuc() == null || request.getPhuongThuc().isBlank())
                ? "MOMO_WALLET" : request.getPhuongThuc();

        if (request.isMock()) {
            return xuLyMock(don, phuongThuc);
        }

        // TODO: Tích hợp MoMo thực — xem README phần UC29
        // Hiện tại trả về lỗi hướng dẫn dùng mock
        throw AppException.badRequest(
                "Tich hop MoMo that chua san sang. Vui long su dung mock=true de kiem thu.");
    }

    // ── Mock: bypass MoMo, xác nhận thanh toán ngay ──────────────────────
    @Transactional
    protected ThanhToanResponse xuLyMock(DonDatTour don, String phuongThuc) {
        LocalDateTime now = LocalDateTime.now();
        String maGiaoDich = "GD_MOCK_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        // Tạo bản ghi giao dịch
        GiaoDich gd = new GiaoDich();
        gd.setMaGiaoDich(maGiaoDich);
        gd.setDonDatTour(don);
        gd.setLoaiGiaoDich("THANH_TOAN");
        gd.setPhuongThuc(phuongThuc);
        gd.setSoTien(don.getTongTien());
        gd.setMaGDNH("MOCK_" + UUID.randomUUID().toString().substring(0, 12).toUpperCase());
        gd.setTrangThai("THANH_CONG");
        gd.setNgayThanhToan(now);
        giaoDichRepository.save(gd);

        // Cập nhật đơn đặt tour
        don.setTrangThai("DA_XAC_NHAN");
        donDatTourRepository.save(don);

        // Trừ số chỗ còn lại
        TourThucTe tour = don.getTourThucTe();
        int choMoi = tour.getChoConLai() - 1;
        if (choMoi < 0) choMoi = 0;
        tour.setChoConLai(choMoi);
        tourThucTeRepository.save(tour);

        // Tạo LichSuTour (nếu chưa có — UNIQUE constraint)
        HoChieuSo kh = don.getKhachHang();
        boolean daCoLich = lichSuTourRepository
                .findByMaKhachHangAndMaTourThucTe(kh.getMaKhachHang(), tour.getMaTourThucTe())
                .isPresent();
        if (!daCoLich) {
            LichSuTour lst = new LichSuTour();
            lst.setMaLichSuTour("LST_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            lst.setKhachHang(kh);
            lst.setTourThucTe(tour);
            lst.setNgayThamGia(tour.getNgayKhoiHanh() != null ? tour.getNgayKhoiHanh() : LocalDate.now());
            lichSuTourRepository.save(lst);
        }

        log.info("[ThanhToan-Mock] Don {} thanh toan thanh cong. GD: {}", don.getMaDatTour(), maGiaoDich);

        return ThanhToanResponse.builder()
                .maGiaoDich(maGiaoDich)
                .maDatTour(don.getMaDatTour())
                .trangThai("THANH_CONG")
                .phuongThuc(phuongThuc)
                .soTien(don.getTongTien())
                .ngayThanhToan(now)
                .thongBao("[MOCK] Thanh toan thanh cong. Don da duoc xac nhan.")
                .build();
    }

    // ── Kiểm tra kết quả giao dịch ────────────────────────────────────────
    public ThanhToanResponse ketQua(String maTaiKhoan, String maDatTour) {
        DonDatTour don = donDatTourRepository.findByIdWithDetails(maDatTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + maDatTour));

        if (!don.getKhachHang().getTaiKhoan().getMaTaiKhoan().equals(maTaiKhoan)) {
            throw AppException.forbidden("Ban khong co quyen xem don nay");
        }

        GiaoDich gd = giaoDichRepository.findByMaDatTour(maDatTour).stream()
                .findFirst()
                .orElseThrow(() -> AppException.notFound("Chua co giao dich nao cho don: " + maDatTour));

        return ThanhToanResponse.builder()
                .maGiaoDich(gd.getMaGiaoDich())
                .maDatTour(maDatTour)
                .trangThai(gd.getTrangThai())
                .phuongThuc(gd.getPhuongThuc())
                .soTien(gd.getSoTien())
                .ngayThanhToan(gd.getNgayThanhToan())
                .thongBao("Trang thai giao dich: " + gd.getTrangThai())
                .build();
    }
}
