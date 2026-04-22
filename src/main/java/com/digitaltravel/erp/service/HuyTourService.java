package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.HuyTourRequest;
import com.digitaltravel.erp.dto.requests.XuLyYeuCauRequest;
import com.digitaltravel.erp.dto.responses.YeuCauHoTroResponse;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.GiaoDich;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.entity.YeuCauHoTro;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.GiaoDichRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;
import com.digitaltravel.erp.repository.YeuCauHoTroRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HuyTourService {

    private final DonDatTourRepository donDatTourRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final YeuCauHoTroRepository yeuCauHoTroRepository;
    private final GiaoDichRepository giaoDichRepository;
    private final TourThucTeRepository tourThucTeRepository;

    // ── UC32: Khách hàng gửi yêu cầu hủy tour ─────────────────────────────
    @Transactional
    public YeuCauHoTroResponse yeuCauHuyTour(String maTaiKhoan, String maDatTour, HuyTourRequest request) {
        HoChieuSo kh = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        DonDatTour don = donDatTourRepository.findByIdAndMaKhachHang(maDatTour, kh.getMaKhachHang())
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + maDatTour));

        // Chỉ cho hủy đơn đã xác nhận (đã thanh toán) — đơn CHO_XAC_NHAN tự hủy qua endpoint riêng
        if (!"DA_XAC_NHAN".equals(don.getTrangThai())) {
            throw AppException.badRequest(
                    "Chi co the yeu cau huy don o trang thai DA_XAC_NHAN. Hien tai: " + don.getTrangThai());
        }

        // Kiểm tra chưa có yêu cầu hủy đang chờ
        boolean daCoYeuCau = !yeuCauHoTroRepository
                .findByMaDatTourAndLoaiYeuCau(maDatTour, "HUY_TOUR").isEmpty();
        if (daCoYeuCau) {
            throw AppException.badRequest("Da co yeu cau huy tour dang cho xu ly cho don nay.");
        }

        // Tính tỉ lệ hoàn tiền
        LocalDate ngayKhoiHanh = don.getTourThucTe().getNgayKhoiHanh();
        long soNgayConLai = ChronoUnit.DAYS.between(LocalDate.now(), ngayKhoiHanh);
        int tiLeHoan = tinhTiLeHoan((int) soNgayConLai);
        BigDecimal soTienHoan = don.getTongTien()
                .multiply(BigDecimal.valueOf(tiLeHoan))
                .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);

        // Tạo yêu cầu hỗ trợ
        YeuCauHoTro yc = new YeuCauHoTro();
        yc.setMaYeuCauHoTro("YCHT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        yc.setDonDatTour(don);
        yc.setKhachHang(kh);
        yc.setLoaiYeuCau("HUY_TOUR");
        yc.setNoiDung(String.format(
                "Ly do: %s | Ngay con lai den khoi hanh: %d | Ti le hoan: %d%% | So tien hoan: %s",
                request.getLyDo(), soNgayConLai, tiLeHoan, soTienHoan.toPlainString()));
        yc.setTrangThai("MOI_TAO");
        yeuCauHoTroRepository.save(yc);

        // Đổi trạng thái đơn sang CHO_HUY
        don.setTrangThai("CHO_HUY");
        donDatTourRepository.save(don);

        return toResponse(yc, soTienHoan, tiLeHoan);
    }

    // ── UC33: SALES duyệt yêu cầu hủy ────────────────────────────────────
    @Transactional
    public YeuCauHoTroResponse duyetHuyTour(String maYeuCau, String maNhanVien, XuLyYeuCauRequest request) {
        YeuCauHoTro yc = yeuCauHoTroRepository.findById(maYeuCau)
                .orElseThrow(() -> AppException.notFound("Khong tim thay yeu cau: " + maYeuCau));

        if (!"MOI_TAO".equals(yc.getTrangThai()) && !"DANG_XU_LY".equals(yc.getTrangThai())) {
            throw AppException.badRequest("Yeu cau khong o trang thai co the duyet.");
        }

        DonDatTour don = yc.getDonDatTour();

        // Hoàn ChoConLai vì đơn đã được thanh toán (ChoConLai đã bị trừ)
        TourThucTe tour = don.getTourThucTe();
        tour.setChoConLai(tour.getChoConLai() + 1);
        tourThucTeRepository.save(tour);

        // Tạo giao dịch hoàn tiền (để kế toán theo dõi)
        BigDecimal soTienHoan = tinhSoTienHoanTuNoiDung(yc.getNoiDung(), don.getTongTien());
        GiaoDich gdHoan = new GiaoDich();
        gdHoan.setMaGiaoDich("GD_HOAN_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        gdHoan.setDonDatTour(don);
        gdHoan.setLoaiGiaoDich("HOAN_TIEN");
        gdHoan.setPhuongThuc("CHUYEN_KHOAN");
        gdHoan.setSoTien(soTienHoan);
        gdHoan.setTrangThai("DA_HOAN_TIEN");
        gdHoan.setNgayThanhToan(LocalDateTime.now());
        giaoDichRepository.save(gdHoan);

        // Cập nhật đơn và yêu cầu
        don.setTrangThai("DA_HUY");
        donDatTourRepository.save(don);

        yc.setTrangThai("DA_DONG");
        yeuCauHoTroRepository.save(yc);

        return toResponse(yc, soTienHoan, 0);
    }

    // ── UC33: SALES từ chối yêu cầu hủy ─────────────────────────────────
    @Transactional
    public YeuCauHoTroResponse tuChoiHuyTour(String maYeuCau, String maNhanVien, XuLyYeuCauRequest request) {
        YeuCauHoTro yc = yeuCauHoTroRepository.findById(maYeuCau)
                .orElseThrow(() -> AppException.notFound("Khong tim thay yeu cau: " + maYeuCau));

        if (!"MOI_TAO".equals(yc.getTrangThai()) && !"DANG_XU_LY".equals(yc.getTrangThai())) {
            throw AppException.badRequest("Yeu cau khong o trang thai co the tu choi.");
        }

        // Hoàn đơn về DA_XAC_NHAN
        DonDatTour don = yc.getDonDatTour();
        don.setTrangThai("DA_XAC_NHAN");
        donDatTourRepository.save(don);

        String noiDung = yc.getNoiDung() + " | TU_CHOI: " + (request.getGhiChu() != null ? request.getGhiChu() : "");
        yc.setNoiDung(noiDung);
        yc.setTrangThai("DA_DONG");
        yeuCauHoTroRepository.save(yc);

        return toResponse(yc, BigDecimal.ZERO, 0);
    }

    // ── Danh sách yêu cầu (cho SALES xem) ───────────────────────────────
    public Page<YeuCauHoTroResponse> danhSachYeuCau(String loaiYeuCau, String trangThai, Pageable pageable) {
        return yeuCauHoTroRepository.timKiem(loaiYeuCau, trangThai, pageable)
                .map(yc -> toResponse(yc, BigDecimal.ZERO, 0));
    }

    // ── Helper: tính tỉ lệ hoàn ──────────────────────────────────────────
    private int tinhTiLeHoan(int soNgayConLai) {
        if (soNgayConLai > 15) return 90;
        if (soNgayConLai >= 7) return 70;
        if (soNgayConLai >= 3) return 50;
        return 0;
    }

    private BigDecimal tinhSoTienHoanTuNoiDung(String noiDung, BigDecimal tongTien) {
        // Parse tỉ lệ từ NoiDung (pattern: "Ti le hoan: XX%")
        try {
            int idx = noiDung.indexOf("Ti le hoan: ");
            if (idx >= 0) {
                String sub = noiDung.substring(idx + "Ti le hoan: ".length());
                int pct = Integer.parseInt(sub.substring(0, sub.indexOf('%')).trim());
                return tongTien.multiply(BigDecimal.valueOf(pct))
                        .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
            }
        } catch (Exception ignored) { /* fallback */ }
        return BigDecimal.ZERO;
    }

    private YeuCauHoTroResponse toResponse(YeuCauHoTro yc, BigDecimal soTienHoan, int tiLeHoan) {
        return YeuCauHoTroResponse.builder()
                .maYeuCau(yc.getMaYeuCauHoTro())
                .maDatTour(yc.getDonDatTour() != null ? yc.getDonDatTour().getMaDatTour() : null)
                .loaiYeuCau(yc.getLoaiYeuCau())
                .noiDung(yc.getNoiDung())
                .trangThai(yc.getTrangThai())
                .maNhanVienXuLy(yc.getNhanVienXuLy() != null ? yc.getNhanVienXuLy().getMaNhanVien() : null)
                .soTienHoan(soTienHoan)
                .tiLeHoan(tiLeHoan)
                .thoiDiemTao(yc.getThoiDiemTao())
                .build();
    }
}
