package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.ApVoucherRequest;
import com.digitaltravel.erp.dto.requests.DoiDiemVoucherRequest;
import com.digitaltravel.erp.dto.requests.PhatHanhVoucherRequest;
import com.digitaltravel.erp.dto.requests.VoucherRequest;
import com.digitaltravel.erp.dto.responses.KhuyenMaiKhResponse;
import com.digitaltravel.erp.dto.responses.VoucherResponse;
import com.digitaltravel.erp.entity.DatTourUuDai;
import com.digitaltravel.erp.entity.DatTourUuDaiId;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.KhuyenMaiKh;
import com.digitaltravel.erp.entity.KhuyenMaiKhId;
import com.digitaltravel.erp.entity.NhatKyDoiDiem;
import com.digitaltravel.erp.entity.Voucher;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DatTourUuDaiRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.KhuyenMaiKhRepository;
import com.digitaltravel.erp.repository.NhatKyDoiDiemRepository;
import com.digitaltravel.erp.repository.VoucherRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VoucherService {

    private final VoucherRepository voucherRepository;
    private final KhuyenMaiKhRepository khuyenMaiKhRepository;
    private final DatTourUuDaiRepository datTourUuDaiRepository;
    private final DonDatTourRepository donDatTourRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final NhatKyDoiDiemRepository nhatKyDoiDiemRepository;

    // ── UC31: Xem ví voucher của khách hàng ─────────────────────────────────
    @Transactional
    public Page<KhuyenMaiKhResponse> viVoucher(String maTaiKhoan, Pageable pageable) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));
        return khuyenMaiKhRepository.findByMaKhachHang(hcs.getMaKhachHang(), pageable)
                .map(this::capNhatHetHanNeuCan)
                .map(this::toKhuyenMaiKhResponse);
    }

    // ── UC28: Áp dụng voucher vào đơn đặt tour ──────────────────────────────
    @Transactional(noRollbackFor = AppException.class)
    public VoucherResponse apVoucher(String maTaiKhoan, ApVoucherRequest request) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        DonDatTour don = donDatTourRepository.findByIdWithDetails(request.getMaDatTour())
                .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + request.getMaDatTour()));

        // Chỉ cho phép KH áp voucher của chính mình
        if (!don.getKhachHang().getMaKhachHang().equals(hcs.getMaKhachHang())) {
            throw AppException.forbidden("Ban khong co quyen ap voucher cho don nay");
        }

        // Voucher chi ap dung truoc khi thanh toan/xac nhan don.
        if (!"CHO_XAC_NHAN".equals(don.getTrangThai())) {
            throw AppException.badRequest("Chi co the ap voucher cho don o trang thai CHO_XAC_NHAN");
        }

        // Lấy voucher từ ví của KH
        KhuyenMaiKh kmkh = khuyenMaiKhRepository.findHieuLucByKhachHangAndVoucher(hcs.getMaKhachHang(), request.getMaVoucher())
                .orElseThrow(() -> AppException.notFound("Voucher khong ton tai hoac khong con hieu luc trong vi cua ban"));

        Voucher voucher = kmkh.getVoucher();

        // Kiểm tra hạn của voucher
        LocalDate today = LocalDate.now();
        if (!"SAN_SANG".equals(voucher.getTrangThai())) {
            throw AppException.badRequest("Voucher da bi vo hieu hoa");
        }
        if (voucher.getNgayHieuLuc().isAfter(today)) {
            throw AppException.badRequest("Voucher chua den ngay hieu luc");
        }
        if (voucher.getNgayHetHan().isBefore(today) || (kmkh.getNgayHetHan() != null && kmkh.getNgayHetHan().isBefore(today))) {
            kmkh.setTrangThai("HET_HAN");
            khuyenMaiKhRepository.save(kmkh);
            throw AppException.badRequest("Voucher da het han");
        }

        // Kiểm tra đơn chưa áp voucher này rồi
        if (datTourUuDaiRepository.existsByDatTourAndVoucher(request.getMaDatTour(), request.getMaVoucher())) {
            throw AppException.badRequest("Voucher nay da duoc ap dung cho don nay");
        }

        // Tính số tiền giảm
        BigDecimal soTienGiam = tinhSoTienGiam(voucher, don.getTongTien());

        // Cập nhật TongTien của đơn
        don.setTongTien(don.getTongTien().subtract(soTienGiam).max(BigDecimal.ZERO));
        donDatTourRepository.save(don);

        // Ghi nhận áp dụng voucher
        DatTourUuDai dtud = new DatTourUuDai();
        dtud.setId(new DatTourUuDaiId(request.getMaDatTour(), request.getMaVoucher()));
        dtud.setDonDatTour(don);
        dtud.setVoucher(voucher);
        dtud.setSoTienUuDai(soTienGiam);
        dtud.setNgayApDung(LocalDateTime.now());
        datTourUuDaiRepository.save(dtud);

        // Giữ lịch sử voucher trong ví và đánh dấu đã sử dụng.
        kmkh.setTrangThai("DA_SU_DUNG");
        khuyenMaiKhRepository.save(kmkh);

        // Tăng đếm lượt đã dùng trên master voucher
        voucher.setSoLuotDaDung(voucher.getSoLuotDaDung() + 1);
        voucherRepository.save(voucher);

        return toVoucherResponse(voucher);
    }

    // ── UC30: Đổi điểm xanh lấy voucher ────────────────────────────────────
    @Transactional
    public KhuyenMaiKhResponse doiDiem(String maTaiKhoan, DoiDiemVoucherRequest request) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        Voucher voucher = voucherRepository.findById(request.getMaVoucher())
                .orElseThrow(() -> AppException.notFound("Khong tim thay voucher: " + request.getMaVoucher()));

        kiemTraVoucherCoTheDoi(hcs, voucher);
        long diemCanDung = tinhDiemCanDung(voucher);
        kiemTraDuDiemDoiVoucher(hcs, diemCanDung);

        capNhatDiemXanhSauKhiDoi(hcs, diemCanDung);
        KhuyenMaiKh kmkh = themVoucherVaoViKhachHang(hcs, voucher);
        ghiNhatKyDoiDiem(hcs, voucher, diemCanDung);

        return toKhuyenMaiKhResponse(kmkh);
    }

    // ── UC53: Admin tạo voucher mới ─────────────────────────────────────────
    @Transactional
    public VoucherResponse taoVoucher(VoucherRequest request, String nguoiTao) {
        // Kiểm tra mã code trùng
        if (voucherRepository.findByMaCode(request.getMaCode()).isPresent()) {
            throw AppException.badRequest("MaCode da ton tai: " + request.getMaCode());
        }

        if (!laLoaiUuDaiHopLe(request.getLoaiUuDai())) {
            throw AppException.badRequest("LoaiUuDai chi chap nhan PHAN_TRAM hoac SO_TIEN");
        }

        // Validate PHAN_TRAM không vượt 100
        if ("PHAN_TRAM".equals(request.getLoaiUuDai())
                && request.getGiaTriGiam().compareTo(BigDecimal.valueOf(100)) > 0) {
            throw AppException.badRequest("Giam PHAN_TRAM khong duoc vuot qua 100%");
        }

        if (request.getNgayHieuLuc().isAfter(request.getNgayHetHan())) {
            throw AppException.badRequest("NgayHieuLuc phai truoc NgayHetHan");
        }

        Voucher v = new Voucher();
        v.setMaVoucher("V_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        v.setMaCode(request.getMaCode());
        v.setLoaiUuDai(request.getLoaiUuDai());
        v.setGiaTriGiam(request.getGiaTriGiam());
        v.setDieuKienApDung(request.getDieuKienApDung());
        v.setSoLuotPhatHanh(request.getSoLuotPhatHanh());
        v.setSoLuotDaDung(0);
        v.setNgayHieuLuc(request.getNgayHieuLuc());
        v.setNgayHetHan(request.getNgayHetHan());
        v.setTrangThai("SAN_SANG");
        voucherRepository.save(v);

        return toVoucherResponse(v);
    }

    // ── UC52: Admin cập nhật voucher ────────────────────────────────────────
    @Transactional
    public VoucherResponse capNhatVoucher(String maVoucher, VoucherRequest request, String nguoiCapNhat) {
        Voucher v = voucherRepository.findById(maVoucher)
                .orElseThrow(() -> AppException.notFound("Khong tim thay voucher: " + maVoucher));

        if (request.getLoaiUuDai() != null && !laLoaiUuDaiHopLe(request.getLoaiUuDai())) {
            throw AppException.badRequest("LoaiUuDai chi chap nhan PHAN_TRAM hoac SO_TIEN");
        }

        String loaiUuDaiSauCapNhat = request.getLoaiUuDai() != null ? request.getLoaiUuDai() : v.getLoaiUuDai();
        BigDecimal giaTriGiamSauCapNhat = request.getGiaTriGiam() != null ? request.getGiaTriGiam() : v.getGiaTriGiam();
        if ("PHAN_TRAM".equals(loaiUuDaiSauCapNhat)
                && giaTriGiamSauCapNhat.compareTo(BigDecimal.valueOf(100)) > 0) {
            throw AppException.badRequest("Giam PHAN_TRAM khong duoc vuot qua 100%");
        }

        LocalDate ngayHieuLucSauCapNhat = request.getNgayHieuLuc() != null ? request.getNgayHieuLuc() : v.getNgayHieuLuc();
        LocalDate ngayHetHanSauCapNhat = request.getNgayHetHan() != null ? request.getNgayHetHan() : v.getNgayHetHan();
        if (ngayHieuLucSauCapNhat.isAfter(ngayHetHanSauCapNhat)) {
            throw AppException.badRequest("NgayHieuLuc phai truoc NgayHetHan");
        }

        if (request.getMaCode() != null && !request.getMaCode().equals(v.getMaCode())) {
            if (voucherRepository.findByMaCode(request.getMaCode()).isPresent()) {
                throw AppException.badRequest("MaCode da ton tai: " + request.getMaCode());
            }
            v.setMaCode(request.getMaCode());
        }
        if (request.getLoaiUuDai() != null) v.setLoaiUuDai(request.getLoaiUuDai());
        if (request.getGiaTriGiam() != null) v.setGiaTriGiam(request.getGiaTriGiam());
        if (request.getDieuKienApDung() != null) v.setDieuKienApDung(request.getDieuKienApDung());
        if (request.getSoLuotPhatHanh() != null) v.setSoLuotPhatHanh(request.getSoLuotPhatHanh());
        if (request.getNgayHieuLuc() != null) v.setNgayHieuLuc(request.getNgayHieuLuc());
        if (request.getNgayHetHan() != null) v.setNgayHetHan(request.getNgayHetHan());
        voucherRepository.save(v);

        return toVoucherResponse(v);
    }

    // ── UC54: Admin phát hành voucher cho khách hàng ────────────────────────
    @Transactional
    public KhuyenMaiKhResponse phatHanhChoKhachHang(String maVoucher, PhatHanhVoucherRequest request, String nguoiTao) {
        Voucher voucher = voucherRepository.findById(maVoucher)
                .orElseThrow(() -> AppException.notFound("Khong tim thay voucher: " + maVoucher));

        if (!"SAN_SANG".equals(voucher.getTrangThai())) {
            throw AppException.badRequest("Voucher da bi vo hieu hoa");
        }

        LocalDate today = LocalDate.now();
        if (voucher.getNgayHetHan().isBefore(today) || voucher.getNgayHieuLuc().isAfter(today)) {
            throw AppException.badRequest("Voucher chua den ngay hieu luc hoac da het han");
        }

        HoChieuSo hcs = hoChieuSoRepository.findById(request.getMaKhachHang())
                .orElseThrow(() -> AppException.notFound("Khong tim thay khach hang: " + request.getMaKhachHang()));

        if (khuyenMaiKhRepository.findByKhachHangAndVoucher(hcs.getMaKhachHang(), maVoucher).isPresent()) {
            throw AppException.badRequest("Khach hang nay da co voucher nay roi");
        }

        if (voucher.getSoLuotDaDung() >= voucher.getSoLuotPhatHanh()) {
            throw AppException.badRequest("Voucher da het luot phat hanh");
        }

        KhuyenMaiKh kmkh = new KhuyenMaiKh();
        kmkh.setId(new KhuyenMaiKhId(hcs.getMaKhachHang(), maVoucher));
        kmkh.setKhachHang(hcs);
        kmkh.setVoucher(voucher);
        kmkh.setNgayHetHan(voucher.getNgayHetHan());
        kmkh.setNgayNhan(LocalDateTime.now());
        kmkh.setTrangThai("CO_HIEU_LUC");
        khuyenMaiKhRepository.save(kmkh);

        return toKhuyenMaiKhResponse(kmkh);
    }

    @Transactional
    public VoucherResponse voHieuHoaVoucher(String maVoucher, String nguoiCapNhat) {
        Voucher voucher = voucherRepository.findById(maVoucher)
                .orElseThrow(() -> AppException.notFound("Khong tim thay voucher: " + maVoucher));
        voucher.setTrangThai("VO_HIEU_HOA");
        voucherRepository.save(voucher);
        return toVoucherResponse(voucher);
    }

    @Transactional
    public KhuyenMaiKhResponse thuHoiVoucher(String maVoucher, String maKhachHang, String nguoiCapNhat) {
        KhuyenMaiKh kmkh = khuyenMaiKhRepository.findByKhachHangAndVoucher(maKhachHang, maVoucher)
                .orElseThrow(() -> AppException.notFound("Khach hang khong co voucher nay trong vi"));
        capNhatHetHanNeuCan(kmkh);
        if (!"CO_HIEU_LUC".equals(kmkh.getTrangThai())) {
            throw AppException.badRequest("Chi co the thu hoi voucher dang CO_HIEU_LUC");
        }
        kmkh.setTrangThai("DA_THU_HOI");
        khuyenMaiKhRepository.save(kmkh);
        return toKhuyenMaiKhResponse(kmkh);
    }

    // ── Danh sách voucher (Admin) ────────────────────────────────────────────
    public Page<VoucherResponse> danhSach(Pageable pageable) {
        return voucherRepository.timKiem(pageable).map(this::toVoucherResponse);
    }

    public Page<VoucherResponse> danhSachCoTheDoi(Pageable pageable) {
        return voucherRepository.findAllActive(LocalDate.now(), pageable).map(this::toVoucherResponse);
    }

    // ── Chi tiết voucher ────────────────────────────────────────────────────
    public VoucherResponse chiTiet(String maVoucher) {
        Voucher v = voucherRepository.findById(maVoucher)
                .orElseThrow(() -> AppException.notFound("Khong tim thay voucher: " + maVoucher));
        return toVoucherResponse(v);
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private BigDecimal tinhSoTienGiam(Voucher voucher, BigDecimal tongTien) {
        if ("PHAN_TRAM".equals(voucher.getLoaiUuDai())) {
            return tongTien.multiply(voucher.getGiaTriGiam())
                    .divide(BigDecimal.valueOf(100), 2, java.math.RoundingMode.HALF_UP);
        }
        // SO_TIEN: không vượt quá tổng tiền
        return voucher.getGiaTriGiam().min(tongTien);
    }

    private long tinhDiemCanDung(Voucher voucher) {
        if ("SO_TIEN".equals(voucher.getLoaiUuDai())) {
            // 100 VND = 1 điểm → n điểm = giaTriGiam / 100
            return voucher.getGiaTriGiam().divide(BigDecimal.valueOf(100), 0, java.math.RoundingMode.CEILING).longValue();
        }
        // PHAN_TRAM: 50 điểm / 1%
        return voucher.getGiaTriGiam().multiply(BigDecimal.valueOf(50)).longValue();
    }

    private boolean laLoaiUuDaiHopLe(String loaiUuDai) {
        return "PHAN_TRAM".equals(loaiUuDai) || "SO_TIEN".equals(loaiUuDai);
    }

    private void kiemTraVoucherCoTheDoi(HoChieuSo hcs, Voucher voucher) {
        LocalDate today = LocalDate.now();
        if (!"SAN_SANG".equals(voucher.getTrangThai())) {
            throw AppException.badRequest("Voucher da bi vo hieu hoa");
        }
        if (voucher.getNgayHetHan().isBefore(today) || voucher.getNgayHieuLuc().isAfter(today)) {
            throw AppException.badRequest("Voucher chua den ngay hieu luc hoac da het han");
        }
        if (voucher.getSoLuotDaDung() >= voucher.getSoLuotPhatHanh()) {
            throw AppException.badRequest("Voucher da het luot doi");
        }
        if (khuyenMaiKhRepository.findByKhachHangAndVoucher(hcs.getMaKhachHang(), voucher.getMaVoucher()).isPresent()) {
            throw AppException.badRequest("Ban da co voucher nay trong vi roi");
        }
    }

    private void kiemTraDuDiemDoiVoucher(HoChieuSo hcs, long diemCanDung) {
        if (hcs.getDiemXanh() < diemCanDung) {
            throw AppException.badRequest(
                    "Khong du diem xanh. Can: " + diemCanDung + ", Hien co: " + hcs.getDiemXanh());
        }
    }

    private void capNhatDiemXanhSauKhiDoi(HoChieuSo hcs, long diemCanDung) {
        hcs.setDiemXanh(hcs.getDiemXanh() - diemCanDung);
        hoChieuSoRepository.save(hcs);
    }

    private KhuyenMaiKh themVoucherVaoViKhachHang(HoChieuSo hcs, Voucher voucher) {
        KhuyenMaiKh kmkh = new KhuyenMaiKh();
        kmkh.setId(new KhuyenMaiKhId(hcs.getMaKhachHang(), voucher.getMaVoucher()));
        kmkh.setKhachHang(hcs);
        kmkh.setVoucher(voucher);
        kmkh.setNgayHetHan(voucher.getNgayHetHan());
        kmkh.setNgayNhan(LocalDateTime.now());
        kmkh.setTrangThai("CO_HIEU_LUC");
        return khuyenMaiKhRepository.save(kmkh);
    }

    private void ghiNhatKyDoiDiem(HoChieuSo hcs, Voucher voucher, long diemCanDung) {
        NhatKyDoiDiem nkdd = new NhatKyDoiDiem();
        nkdd.setMaNhatKyDoiDiem("NKDD_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        nkdd.setKhachHang(hcs);
        nkdd.setVoucher(voucher);
        nkdd.setDiemQuyDoi(diemCanDung);
        nkdd.setNgayQuyDoi(LocalDateTime.now());
        nhatKyDoiDiemRepository.save(nkdd);
    }

    private VoucherResponse toVoucherResponse(Voucher v) {
        return VoucherResponse.builder()
                .maVoucher(v.getMaVoucher())
                .maCode(v.getMaCode())
                .loaiUuDai(v.getLoaiUuDai())
                .giaTriGiam(v.getGiaTriGiam())
                .dieuKienApDung(v.getDieuKienApDung())
                .soLuotPhatHanh(v.getSoLuotPhatHanh())
                .soLuotDaDung(v.getSoLuotDaDung())
                .ngayHieuLuc(v.getNgayHieuLuc())
                .ngayHetHan(v.getNgayHetHan())
                .trangThai(v.getTrangThai())
                .build();
    }

    private KhuyenMaiKhResponse toKhuyenMaiKhResponse(KhuyenMaiKh k) {
        Voucher v = k.getVoucher();
        return KhuyenMaiKhResponse.builder()
                .maVoucher(v.getMaVoucher())
                .maCode(v.getMaCode())
                .loaiUuDai(v.getLoaiUuDai())
                .giaTriGiam(v.getGiaTriGiam())
                .dieuKienApDung(v.getDieuKienApDung())
                .ngayHetHan(k.getNgayHetHan())
                .ngayNhan(k.getNgayNhan())
                .trangThai(k.getTrangThai())
                .trangThaiVoucher(v.getTrangThai())
                .build();
    }

    private KhuyenMaiKh capNhatHetHanNeuCan(KhuyenMaiKh kmkh) {
        if ("CO_HIEU_LUC".equals(kmkh.getTrangThai())
                && kmkh.getNgayHetHan() != null
                && kmkh.getNgayHetHan().isBefore(LocalDate.now())) {
            kmkh.setTrangThai("HET_HAN");
            return khuyenMaiKhRepository.save(kmkh);
        }
        return kmkh;
    }
}
