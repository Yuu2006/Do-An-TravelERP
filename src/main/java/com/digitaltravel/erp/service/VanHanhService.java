package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.text.Normalizer;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.BaoCaoSuCoRequest;
import com.digitaltravel.erp.dto.requests.DiemDanhRequest;
import com.digitaltravel.erp.dto.requests.GhiNhanHanhDongRequest;
import com.digitaltravel.erp.dto.requests.KhaiChiPhiRequest;
import com.digitaltravel.erp.dto.responses.CanhBaoChiPhiResponse;
import com.digitaltravel.erp.dto.responses.ChiPhiThucTeResponse;
import com.digitaltravel.erp.dto.responses.DiemDanhResponse;
import com.digitaltravel.erp.dto.responses.HanhDongResponse;
import com.digitaltravel.erp.dto.responses.NhatKySuCoResponse;
import com.digitaltravel.erp.entity.ChiPhiThucTe;
import com.digitaltravel.erp.entity.DiemDanh;
import com.digitaltravel.erp.entity.DsNguoiDongHanh;
import com.digitaltravel.erp.entity.HanhDong;
import com.digitaltravel.erp.entity.HanhDongXanh;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.NhatKySuCo;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.ChiPhiThucTeRepository;
import com.digitaltravel.erp.repository.DiemDanhRepository;
import com.digitaltravel.erp.repository.DsNguoiDongHanhRepository;
import com.digitaltravel.erp.repository.HanhDongRepository;
import com.digitaltravel.erp.repository.HanhDongXanhRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.NhatKySuCoRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VanHanhService {

    private final TourThucTeRepository tourThucTeRepository;
    private final NhanVienRepository nhanVienRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final DiemDanhRepository diemDanhRepository;
    private final DsNguoiDongHanhRepository dsNguoiDongHanhRepository;
    private final HanhDongRepository hanhDongRepository;
    private final HanhDongXanhRepository hanhDongXanhRepository;
    private final NhatKySuCoRepository nhatKySuCoRepository;
    private final ChiPhiThucTeRepository chiPhiThucTeRepository;

    // ── UC42: Xem danh sách đoàn ─────────────────────────────────────────
    public List<DiemDanhResponse> danhSachDoan(String maTour) {
        return diemDanhRepository.findByMaTour(maTour).stream()
                .map(this::toDiemDanhResponse)
                .toList();
    }

    // ── UC43: Điểm danh khách ─────────────────────────────────────────────
    @Transactional
    public DiemDanhResponse diemDanh(String maTour, DiemDanhRequest req, String maTaiKhoan) {
        TourThucTe tour = getActiveTour(maTour);
        HoChieuSo kh = null;
        DsNguoiDongHanh nguoiDongHanh = null;
        boolean coKhachHang = req.getMaKhachHang() != null && !req.getMaKhachHang().isBlank();
        boolean coNguoiDongHanh = req.getMaNguoiDongHanh() != null && !req.getMaNguoiDongHanh().isBlank();

        if (coKhachHang == coNguoiDongHanh) {
            throw AppException.badRequest("Chi duoc gui mot trong hai truong: maKhachHang hoac maNguoiDongHanh");
        }

        if (coKhachHang) {
            kh = hoChieuSoRepository.findById(req.getMaKhachHang())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay khach hang: " + req.getMaKhachHang()));
        } else {
            nguoiDongHanh = dsNguoiDongHanhRepository.findById(req.getMaNguoiDongHanh())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay nguoi dong hanh: " + req.getMaNguoiDongHanh()));
            if (!nguoiDongHanh.getDonDatTour().getTourThucTe().getMaTourThucTe().equals(maTour)) {
                throw AppException.badRequest("Nguoi dong hanh khong thuoc tour nay");
            }
        }
        NhanVien hdv = getHdv(maTaiKhoan);

        DiemDanh dd = new DiemDanh();
        dd.setMaDiemDanh("DD_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        dd.setTourThucTe(tour);
        dd.setKhachHang(kh);
        dd.setNguoiDongHanh(nguoiDongHanh);
        dd.setLoaiKhach(coKhachHang ? "NGUOI_DAT" : "NGUOI_DONG_HANH");
        dd.setNhanVien(hdv);
        dd.setThoiGian(LocalDateTime.now());
        dd.setDiaDiem(req.getDiaDiem());
        dd.setTrangThai(chuanHoaTrangThaiDiemDanh(req.getTrangThai()));
        diemDanhRepository.save(dd);

        return toDiemDanhResponse(dd);
    }

    // ── UC44: Ghi nhận hành động xanh ────────────────────────────────────
    @Transactional
    public HanhDongResponse ghiNhanHanhDong(String maTour, GhiNhanHanhDongRequest req, String maTaiKhoan) {
        TourThucTe tour = getActiveTour(maTour);
        HoChieuSo kh = hoChieuSoRepository.findById(req.getMaKhachHang())
                .orElseThrow(() -> AppException.notFound("Khong tim thay khach hang: " + req.getMaKhachHang()));
        HanhDongXanh hdx = hanhDongXanhRepository.findById(req.getMaHanhDongXanh())
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + req.getMaHanhDongXanh()));
        NhanVien hdv = getHdv(maTaiKhoan);

        HanhDong hd = new HanhDong();
        hd.setMaGhiNhanHanhDong("HD_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        hd.setTourThucTe(tour);
        hd.setKhachHang(kh);
        hd.setHanhDongXanh(hdx);
        hd.setNhanVienXacMinh(hdv);
        hd.setThoiGian(LocalDateTime.now());
        hd.setMinhChung(req.getMinhChung());
        hanhDongRepository.save(hd);

        // Cộng điểm xanh cho KH
        kh.setDiemXanh(kh.getDiemXanh() + hdx.getDiemCong());
        kiemTraNangHang(kh);
        hoChieuSoRepository.save(kh);

        return toHanhDongResponse(hd, hdx);
    }

    // ── UC45: Báo cáo sự cố ──────────────────────────────────────────────
    @Transactional
    public NhatKySuCoResponse baoCaoSuCo(String maTour, BaoCaoSuCoRequest req, String maTaiKhoan) {
        TourThucTe tour = tourThucTeRepository.findById(maTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTour));
        NhanVien hdv = getHdv(maTaiKhoan);

        NhatKySuCo sc = new NhatKySuCo();
        sc.setMaNhatKySuCo("SC_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        sc.setTourThucTe(tour);
        sc.setNhanVienBaoCao(hdv);
        sc.setMoTa(req.getMoTa());
        sc.setGiaiPhap(req.getGiaiPhap());
        sc.setThoiGianBaoCao(LocalDateTime.now());
        nhatKySuCoRepository.save(sc);

        return toSuCoResponse(sc);
    }

    // Cập nhật mô tả / giải pháp sự cố
    @Transactional
    public NhatKySuCoResponse capNhatSuCo(String maSuCo, BaoCaoSuCoRequest req) {
        NhatKySuCo sc = nhatKySuCoRepository.findById(maSuCo)
                .orElseThrow(() -> AppException.notFound("Khong tim thay su co: " + maSuCo));
        if (req.getGiaiPhap() != null) sc.setGiaiPhap(req.getGiaiPhap());
        if (req.getMoTa() != null) sc.setMoTa(req.getMoTa());
        nhatKySuCoRepository.save(sc);
        return toSuCoResponse(sc);
    }

    public List<NhatKySuCoResponse> danhSachSuCo(String maTour) {
        return nhatKySuCoRepository.findByMaTour(maTour).stream()
                .map(this::toSuCoResponse).toList();
    }

    // ── UC46: Khai báo chi phí phát sinh ─────────────────────────────────
    @Transactional
    public ChiPhiThucTeResponse khaiChiPhi(String maTour, KhaiChiPhiRequest req, String maTaiKhoan) {
        TourThucTe tour = tourThucTeRepository.findById(maTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTour));
        NhanVien hdv = getHdv(maTaiKhoan);

        ChiPhiThucTe cp = new ChiPhiThucTe();
        cp.setMaChiPhiThucTe("CP_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        cp.setTourThucTe(tour);
        cp.setNhanVien(hdv);
        cp.setDanhMuc(req.getDanhMuc());
        cp.setThanhTien(req.getThanhTien());
        cp.setHoaDonAnh(req.getHoaDonAnh());
        cp.setTrangThaiDuyet("CHO_DUYET");
        cp.setNgayKhai(LocalDateTime.now());
        chiPhiThucTeRepository.save(cp);

        return toChiPhiResponse(cp);
    }

    public List<ChiPhiThucTeResponse> chiPhiCuaTour(String maTour) {
        return chiPhiThucTeRepository.findByMaTour(maTour).stream()
                .map(this::toChiPhiResponse).toList();
    }

    @Transactional
    public ChiPhiThucTeResponse boSungChiPhi(String maChiPhi, KhaiChiPhiRequest req, String maTaiKhoan) {
        ChiPhiThucTe cp = chiPhiThucTeRepository.findById(maChiPhi)
                .orElseThrow(() -> AppException.notFound("Khong tim thay chi phi: " + maChiPhi));
        if (!"YEU_CAU_BO_SUNG".equals(cp.getTrangThaiDuyet())) {
            throw AppException.badRequest("Chi phi khong o trang thai YEU_CAU_BO_SUNG.");
        }
        if (!cp.getNhanVien().getTaiKhoan().getMaTaiKhoan().equals(maTaiKhoan)) {
            throw AppException.forbidden("Khong co quyen bo sung chi phi nay");
        }

        cp.setDanhMuc(req.getDanhMuc());
        cp.setThanhTien(req.getThanhTien());
        cp.setHoaDonAnh(req.getHoaDonAnh());
        cp.setTrangThaiDuyet("CHO_DUYET");
        chiPhiThucTeRepository.save(cp);
        return toChiPhiResponse(cp);
    }

    // ── Kế toán: DS chi phí chờ duyệt ────────────────────────────────────
    public Page<ChiPhiThucTeResponse> danhSachChiPhiChoXuLy(String trangThai, Pageable pageable) {
        return chiPhiThucTeRepository.findByTrangThai(trangThai, pageable)
                .map(this::toChiPhiResponse);
    }

    @Transactional
    public ChiPhiThucTeResponse duyetChiPhi(String maChiPhi) {
        return setTrangThaiChiPhi(maChiPhi, "DA_DUYET");
    }

    @Transactional
    public ChiPhiThucTeResponse tuChoiChiPhi(String maChiPhi) {
        return setTrangThaiChiPhi(maChiPhi, "TU_CHOI");
    }

    @Transactional
    public ChiPhiThucTeResponse yeuCauBoSungChiPhi(String maChiPhi) {
        return setTrangThaiChiPhi(maChiPhi, "YEU_CAU_BO_SUNG");
    }

    public Page<CanhBaoChiPhiResponse> danhSachCanhBaoChiPhi(String trangThai, String loaiCanhBao,
                                                             String mucDo, Pageable pageable) {
        List<CanhBaoChiPhiResponse> canhBao = chiPhiThucTeRepository.findAllWithRelations().stream()
                .flatMap(cp -> taoCanhBaoDong(cp).stream())
                .filter(cb -> trangThai == null || trangThai.equals(cb.getTrangThai()))
                .filter(cb -> loaiCanhBao == null || loaiCanhBao.equals(cb.getLoaiCanhBao()))
                .filter(cb -> mucDo == null || mucDo.equals(cb.getMucDo()))
                .toList();

        int start = Math.min((int) pageable.getOffset(), canhBao.size());
        int end = Math.min(start + pageable.getPageSize(), canhBao.size());
        return new PageImpl<>(canhBao.subList(start, end), pageable, canhBao.size());
    }

    public CanhBaoChiPhiResponse chiTietCanhBaoChiPhi(String maCanhBao) {
        return chiPhiThucTeRepository.findAllWithRelations().stream()
                .flatMap(cp -> taoCanhBaoDong(cp).stream())
                .filter(cb -> cb.getMaCanhBao().equals(maCanhBao))
                .findFirst()
                .orElseThrow(() -> AppException.notFound("Khong tim thay canh bao chi phi: " + maCanhBao));
    }

    private ChiPhiThucTeResponse setTrangThaiChiPhi(String maChiPhi, String trangThai) {
        ChiPhiThucTe cp = chiPhiThucTeRepository.findById(maChiPhi)
                .orElseThrow(() -> AppException.notFound("Khong tim thay chi phi: " + maChiPhi));
        if (!"CHO_DUYET".equals(cp.getTrangThaiDuyet())) {
            throw AppException.badRequest("Chi phi da duoc xu ly roi.");
        }
        cp.setTrangThaiDuyet(trangThai);
        chiPhiThucTeRepository.save(cp);
        return toChiPhiResponse(cp);
    }

    private List<CanhBaoChiPhiResponse> taoCanhBaoDong(ChiPhiThucTe cp) {
        List<CanhBaoChiPhiResponse> canhBao = new ArrayList<>();
        if (cp.getHoaDonAnh() == null || cp.getHoaDonAnh().isBlank()) {
            canhBao.add(toCanhBaoChiPhiResponse(cp, "THIEU_CHUNG_TU", "CAO",
                    "Chi phi chua co anh/chung tu hoa don dinh kem"));
        }

        BigDecimal dinhMuc = dinhMucTheoDanhMuc(cp.getDanhMuc());
        if (dinhMuc != null && cp.getThanhTien().compareTo(dinhMuc) > 0) {
            canhBao.add(toCanhBaoChiPhiResponse(cp, "VUOT_DINH_MUC", mucDoVuotNguong(cp.getThanhTien(), dinhMuc),
                    "Chi phi " + cp.getDanhMuc() + " vuot dinh muc " + dinhMuc));
        }

        BigDecimal giaThiTruong = giaThiTruongTheoDanhMuc(cp.getDanhMuc());
        if (giaThiTruong != null && cp.getThanhTien().compareTo(giaThiTruong.multiply(new BigDecimal("1.5"))) > 0) {
            canhBao.add(toCanhBaoChiPhiResponse(cp, "BAT_THUONG_THI_TRUONG", mucDoVuotNguong(cp.getThanhTien(), giaThiTruong),
                    "Chi phi " + cp.getDanhMuc() + " cao bat thuong so voi gia thi truong " + giaThiTruong));
        }
        return canhBao;
    }

    private BigDecimal dinhMucTheoDanhMuc(String danhMuc) {
        String key = chuanHoaDanhMuc(danhMuc);
        if (key.contains("khach san")) return new BigDecimal("4000000");
        if (key.contains("ve") || key.contains("tham quan")) return new BigDecimal("1500000");
        if (key.contains("xe") || key.contains("dua don")) return new BigDecimal("3000000");
        if (key.contains("an uong")) return new BigDecimal("2000000");
        return null;
    }

    private BigDecimal giaThiTruongTheoDanhMuc(String danhMuc) {
        String key = chuanHoaDanhMuc(danhMuc);
        if (key.contains("khach san")) return new BigDecimal("4200000");
        if (key.contains("ve") || key.contains("tham quan")) return new BigDecimal("1600000");
        if (key.contains("xe") || key.contains("dua don")) return new BigDecimal("2800000");
        if (key.contains("an uong")) return new BigDecimal("2200000");
        return null;
    }

    private String mucDoVuotNguong(BigDecimal thanhTien, BigDecimal nguong) {
        if (thanhTien.compareTo(nguong.multiply(new BigDecimal("1.5"))) > 0) return "NGHIEM_TRONG";
        if (thanhTien.compareTo(nguong.multiply(new BigDecimal("1.3"))) > 0) return "CAO";
        if (thanhTien.compareTo(nguong.multiply(new BigDecimal("1.1"))) > 0) return "TRUNG_BINH";
        return "THAP";
    }

    private String chuanHoaDanhMuc(String danhMuc) {
        if (danhMuc == null) return "";
        return Normalizer.normalize(danhMuc, Normalizer.Form.NFD)
                .replaceAll("\\p{M}", "")
                .replace('đ', 'd')
                .replace('Đ', 'D')
                .toLowerCase();
    }

    // ── Helpers ───────────────────────────────────────────────────────────
    private TourThucTe getActiveTour(String maTour) {
        return tourThucTeRepository.findById(maTour)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTour));
    }

    private NhanVien getHdv(String maTaiKhoan) {
        return nhanVienRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so nhan vien"));
    }

    // Nâng hạng thành viên tự động theo ngưỡng điểm xanh
    private void kiemTraNangHang(HoChieuSo hcs) {
        long diem = hcs.getDiemXanh();
        String hangHienTai = hcs.getHangThanhVien();
        String hangMoi = hangHienTai;
        if (diem >= 5000) {
            hangMoi = "KIM_CUONG";
        } else if (diem >= 2000) {
            hangMoi = "VANG";
        } else if (diem >= 1000) {
            hangMoi = "BAC";
        } else if (diem >= 500) {
            hangMoi = "DONG";
        } else {
            hangMoi = "THANH_VIEN";
        }
        if (thuTuHang(hangMoi) > thuTuHang(hangHienTai)) {
            hcs.setHangThanhVien(hangMoi);
        }
    }

    private int thuTuHang(String hangThanhVien) {
        return switch (hangThanhVien) {
            case "DONG" -> 1;
            case "BAC" -> 2;
            case "VANG" -> 3;
            case "KIM_CUONG" -> 4;
            default -> 0;
        };
    }

    private String chuanHoaTrangThaiDiemDanh(String trangThai) {
        if (trangThai == null || trangThai.isBlank()) {
            return "DA_DIEM_DANH";
        }
        if (!java.util.Set.of("DA_DIEM_DANH", "CHUA_DIEM_DANH", "VANG").contains(trangThai)) {
            throw AppException.badRequest("TrangThai diem danh khong hop le: " + trangThai);
        }
        return trangThai;
    }

    // ── Mappers ───────────────────────────────────────────────────────────
    private DiemDanhResponse toDiemDanhResponse(DiemDanh dd) {
        HoChieuSo kh = dd.getKhachHang();
        DsNguoiDongHanh nguoiDongHanh = dd.getNguoiDongHanh();
        String hoTen = kh != null && kh.getTaiKhoan() != null
                ? kh.getTaiKhoan().getHoTen()
                : nguoiDongHanh != null ? nguoiDongHanh.getHoTen() : "";
        return DiemDanhResponse.builder()
                .maDiemDanh(dd.getMaDiemDanh())
                .loaiKhach(dd.getLoaiKhach())
                .maKhachHang(kh != null ? kh.getMaKhachHang() : null)
                .maNguoiDongHanh(nguoiDongHanh != null ? nguoiDongHanh.getMaNguoiDongHanh() : null)
                .hoTenKhachHang(hoTen)
                .diaDiem(dd.getDiaDiem())
                .trangThai(dd.getTrangThai())
                .thoiGian(dd.getThoiGian())
                .build();
    }

    private HanhDongResponse toHanhDongResponse(HanhDong hd, HanhDongXanh hdx) {
        String hoTen = hd.getKhachHang().getTaiKhoan() != null
                ? hd.getKhachHang().getTaiKhoan().getHoTen() : "";
        return HanhDongResponse.builder()
                .maGhiNhan(hd.getMaGhiNhanHanhDong())
                .maKhachHang(hd.getKhachHang().getMaKhachHang())
                .hoTenKhachHang(hoTen)
                .maHanhDongXanh(hdx.getMaHanhDongXanh())
                .tenHanhDong(hdx.getTenHanhDong())
                .diemCong(hdx.getDiemCong())
                .minhChung(hd.getMinhChung())
                .thoiGian(hd.getThoiGian())
                .build();
    }

    private NhatKySuCoResponse toSuCoResponse(NhatKySuCo sc) {
        return NhatKySuCoResponse.builder()
                .maNhatKySuCo(sc.getMaNhatKySuCo())
                .moTa(sc.getMoTa())
                .giaiPhap(sc.getGiaiPhap())
                .thoiGianBaoCao(sc.getThoiGianBaoCao())
                .build();
    }

    private ChiPhiThucTeResponse toChiPhiResponse(ChiPhiThucTe cp) {
        NhanVien nv = cp.getNhanVien();
        String tenNv = nv.getTaiKhoan() != null ? nv.getTaiKhoan().getHoTen() : "";
        return ChiPhiThucTeResponse.builder()
                .maChiPhi(cp.getMaChiPhiThucTe())
                .maTour(cp.getTourThucTe().getMaTourThucTe())
                .maNhanVien(nv.getMaNhanVien())
                .tenNhanVien(tenNv)
                .danhMuc(cp.getDanhMuc())
                .thanhTien(cp.getThanhTien())
                .hoaDonAnh(cp.getHoaDonAnh())
                .trangThaiDuyet(cp.getTrangThaiDuyet())
                .ngayKhai(cp.getNgayKhai())
                .build();
    }

    private CanhBaoChiPhiResponse toCanhBaoChiPhiResponse(ChiPhiThucTe cp, String loaiCanhBao,
                                                          String mucDo, String noiDung) {
        NhanVien nv = cp.getNhanVien();
        String tenNv = nv.getTaiKhoan() != null ? nv.getTaiKhoan().getHoTen() : "";
        return CanhBaoChiPhiResponse.builder()
                .maCanhBao(cp.getMaChiPhiThucTe() + "_" + loaiCanhBao)
                .maChiPhi(cp.getMaChiPhiThucTe())
                .maTour(cp.getTourThucTe().getMaTourThucTe())
                .maNhanVien(nv.getMaNhanVien())
                .tenNhanVien(tenNv)
                .danhMuc(cp.getDanhMuc())
                .thanhTien(cp.getThanhTien())
                .loaiCanhBao(loaiCanhBao)
                .mucDo(mucDo)
                .noiDung(noiDung)
                .trangThai(trangThaiCanhBao(cp.getTrangThaiDuyet()))
                .ngayTao(cp.getNgayKhai())
                .build();
    }

    private String trangThaiCanhBao(String trangThaiDuyet) {
        return switch (trangThaiDuyet) {
            case "YEU_CAU_BO_SUNG" -> "DANG_XU_LY";
            case "DA_DUYET", "TU_CHOI" -> "DA_XU_LY";
            default -> "MOI";
        };
    }
}
