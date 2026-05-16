package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.QuyetToanRequest;
import com.digitaltravel.erp.dto.responses.QuyetToanResponse;
import com.digitaltravel.erp.dto.responses.ThanhToanResponse;
import com.digitaltravel.erp.entity.ChiPhiThucTe;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.GiaoDich;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.QuyetToan;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.ChiPhiThucTeRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.GiaoDichRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.QuyetToanRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuyetToanService {

    private final QuyetToanRepository quyetToanRepository;
    private final TourThucTeRepository tourThucTeRepository;
    private final NhanVienRepository nhanVienRepository;
    private final DonDatTourRepository donDatTourRepository;
    private final ChiPhiThucTeRepository chiPhiThucTeRepository;
    private final GiaoDichRepository giaoDichRepository;

    // ── UC47: Danh sách tour cần quyết toán (đã kết thúc, chưa quyết toán)
    public Page<QuyetToanResponse> tourCanQuyetToan(Pageable pageable) {
        // Tour trạng thái KET_THUC chưa có QuyetToan
        return tourThucTeRepository.timKiem("KET_THUC", null, null, null, pageable)
                .map(tt -> {
                    boolean daqt = quyetToanRepository.existsByTourThucTe_MaTourThucTe(tt.getMaTourThucTe());
                    if (daqt) return null;
                    return toQuyetToanXemTruoc(tt);
                })
                .map(r -> r); // filter nulls handled by client or via separate query
    }

    // ── UC48: Tính toán sơ bộ (xem trước, không lưu DB) ──────────────────
    public QuyetToanResponse tinhToan(String maTour) {
        TourThucTe tour = getKetThucTour(maTour);
        BigDecimal doanhThu = tinhDoanhThu(maTour);
        BigDecimal chiPhi = tinhChiPhi(maTour);
        BigDecimal loiNhuan = doanhThu.subtract(chiPhi);

        return QuyetToanResponse.builder()
                .maTour(maTour)
                .tenTour(tour.getTourMau() != null ? tour.getTourMau().getTieuDe() : "")
                .tongDoanhThu(doanhThu)
                .tongChiPhi(chiPhi)
                .loiNhuan(loiNhuan)
                .trangThai("XEM_TRUOC")
                .build();
    }

    // ── UC49: Tạo bản nháp quyết toán ────────────────────────────────────
    @Transactional
    public QuyetToanResponse taoQuyetToan(String maTour, QuyetToanRequest req, String maTaiKhoan) {
        getKetThucTour(maTour);

        if (quyetToanRepository.existsByTourThucTe_MaTourThucTe(maTour)) {
            // Nếu đã có BAN_NHAP thì cập nhật
            QuyetToan existing = quyetToanRepository.findByTourThucTe_MaTourThucTe(maTour).get();
            if ("DA_CHOT".equals(existing.getTrangThai())) {
                throw AppException.badRequest("Quyet toan da bi chot, khong the sua.");
            }
            return capNhatQT(existing, maTour, req, maTaiKhoan);
        }

        NhanVien nv = nhanVienRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so nhan vien"));

        BigDecimal doanhThu = tinhDoanhThu(maTour);
        BigDecimal chiPhi = tinhChiPhi(maTour);

        QuyetToan qt = new QuyetToan();
        qt.setMaQuyetToan("QT_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        qt.setTourThucTe(tourThucTeRepository.findById(maTour).get());
        qt.setNhanVien(nv);
        qt.setTongDoanhThu(doanhThu);
        qt.setTongChiPhi(chiPhi);
        qt.setLoiNhuan(doanhThu.subtract(chiPhi));
        qt.setNgayQuyetToan(LocalDateTime.now());
        qt.setTrangThai("BAN_NHAP");
        qt.setGhiChu(req != null ? req.getGhiChu() : null);
        quyetToanRepository.save(qt);

        return toResponse(qt);
    }

    // ── UC50: Chốt quyết toán ─────────────────────────────────────────────
    @Transactional
    public QuyetToanResponse chotQuyetToan(String maQuyetToan) {
        QuyetToan qt = quyetToanRepository.findById(maQuyetToan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay quyet toan: " + maQuyetToan));
        if (!"BAN_NHAP".equals(qt.getTrangThai())) {
            throw AppException.badRequest("Chi co the chot quyet toan o trang thai BAN_NHAP.");
        }
        qt.setTrangThai("DA_CHOT");

        // Cập nhật tour sang DA_QUYET_TOAN
        TourThucTe tour = qt.getTourThucTe();
        tour.setTrangThai("DA_QUYET_TOAN");
        tourThucTeRepository.save(tour);
        quyetToanRepository.save(qt);

        return toResponse(qt);
    }

    // ── UC51-53: Xem danh sách / chi tiết ────────────────────────────────
    public Page<QuyetToanResponse> danhSach(String trangThai, Pageable pageable) {
        return quyetToanRepository.findByTrangThai(trangThai, pageable)
                .map(this::toResponse);
    }

    public QuyetToanResponse chiTiet(String maQuyetToan) {
        QuyetToan qt = quyetToanRepository.findById(maQuyetToan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay quyet toan: " + maQuyetToan));
        return toResponse(qt);
    }

    // ── UC52: KeToan xác nhận đã hoàn tiền cho KH ────────────────────────
    @Transactional
    public ThanhToanResponse xacNhanHoanTien(String maGiaoDich, String nguoiXacNhan) {
        GiaoDich gd = giaoDichRepository.findById(maGiaoDich)
                .orElseThrow(() -> AppException.notFound("Khong tim thay giao dich: " + maGiaoDich));

        if (!"HOAN_TIEN".equals(gd.getLoaiGiaoDich())) {
            throw AppException.badRequest("Giao dich nay khong phai hoan tien");
        }
        if ("DA_HOAN_TIEN".equals(gd.getTrangThai())) {
            throw AppException.badRequest("Giao dich nay da duoc xac nhan hoan tien roi");
        }
        if (!"CHO_THANH_TOAN".equals(gd.getTrangThai())) {
            throw AppException.badRequest("Chi co the xac nhan giao dich o trang thai CHO_THANH_TOAN");
        }

        gd.setTrangThai("DA_HOAN_TIEN");
        gd.setNgayThanhToan(LocalDateTime.now());
        giaoDichRepository.save(gd);

        return ThanhToanResponse.builder()
                .maGiaoDich(gd.getMaGiaoDich())
                .maDatTour(gd.getDonDatTour().getMaDatTour())
                .soTien(gd.getSoTien())
                .phuongThuc(gd.getPhuongThuc())
                .trangThai(gd.getTrangThai())
                .ngayThanhToan(gd.getNgayThanhToan())
                .thongBao("Xac nhan hoan tien thanh cong")
                .build();
    }

    // ── UC52: Danh sách giao dịch chờ hoàn tiền ──────────────────────────
    public Page<ThanhToanResponse> danhSachChoHoanTien(Pageable pageable) {
        return giaoDichRepository.findChoHoanTien(pageable)
                .map(gd -> ThanhToanResponse.builder()
                        .maGiaoDich(gd.getMaGiaoDich())
                        .maDatTour(gd.getDonDatTour().getMaDatTour())
                        .soTien(gd.getSoTien())
                        .phuongThuc(gd.getPhuongThuc())
                        .trangThai(gd.getTrangThai())
                        .ngayThanhToan(gd.getNgayThanhToan())
                        .build());
    }

    // ── Helpers ───────────────────────────────────────────────────────────
    private TourThucTe getKetThucTour(String maTour) {
        TourThucTe tour = tourThucTeRepository.findById(maTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTour));
        if (!"KET_THUC".equals(tour.getTrangThai()) && !"DA_QUYET_TOAN".equals(tour.getTrangThai())) {
            throw AppException.badRequest("Tour chua ket thuc, khong the quyet toan.");
        }
        return tour;
    }

    private BigDecimal tinhDoanhThu(String maTour) {
        // Tổng TongTien của các đơn DA_XAC_NHAN của tour
        return donDatTourRepository.findAll().stream()
                .filter(d -> d.getTourThucTe().getMaTourThucTe().equals(maTour))
                .filter(d -> "DA_XAC_NHAN".equals(d.getTrangThai()))
                .map(DonDatTour::getTongTien)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private BigDecimal tinhChiPhi(String maTour) {
        List<ChiPhiThucTe> list = chiPhiThucTeRepository.findDaDuyetByMaTour(maTour);
        return list.stream()
                .map(ChiPhiThucTe::getThanhTien)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    private QuyetToanResponse capNhatQT(QuyetToan qt, String maTour, QuyetToanRequest req, String maTaiKhoan) {
        BigDecimal doanhThu = tinhDoanhThu(maTour);
        BigDecimal chiPhi = tinhChiPhi(maTour);
        qt.setTongDoanhThu(doanhThu);
        qt.setTongChiPhi(chiPhi);
        qt.setLoiNhuan(doanhThu.subtract(chiPhi));
        qt.setNgayQuyetToan(LocalDateTime.now());
        if (req != null && req.getGhiChu() != null) qt.setGhiChu(req.getGhiChu());
        quyetToanRepository.save(qt);
        return toResponse(qt);
    }

    private QuyetToanResponse toQuyetToanXemTruoc(TourThucTe tt) {
        return QuyetToanResponse.builder()
                .maTour(tt.getMaTourThucTe())
                .tenTour(tt.getTourMau() != null ? tt.getTourMau().getTieuDe() : "")
                .trangThai("CHUA_QUYET_TOAN")
                .build();
    }

    private QuyetToanResponse toResponse(QuyetToan qt) {
        TourThucTe tt = qt.getTourThucTe();
        NhanVien nv = qt.getNhanVien();
        return QuyetToanResponse.builder()
                .maQuyetToan(qt.getMaQuyetToan())
                .maTour(tt.getMaTourThucTe())
                .tenTour(tt.getTourMau() != null ? tt.getTourMau().getTieuDe() : "")
                .tongDoanhThu(qt.getTongDoanhThu())
                .tongChiPhi(qt.getTongChiPhi())
                .loiNhuan(qt.getLoiNhuan())
                .trangThai(qt.getTrangThai())
                .ghiChu(qt.getGhiChu())
                .ngayQuyetToan(qt.getNgayQuyetToan())
                .maNhanVien(nv.getMaNhanVien())
                .tenNhanVien(nv.getTaiKhoan() != null ? nv.getTaiKhoan().getHoTen() : "")
                .build();
    }
}
