package com.digitaltravel.erp.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.config.VaiTroConst;
import com.digitaltravel.erp.dto.requests.PhanCongHdvRequest;
import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.dto.responses.PhanCongResponse;
import com.digitaltravel.erp.dto.responses.ThanhVienDoanResponse;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.DsNguoiDongHanh;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.PhanCongTour;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DiemDanhRepository;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.DsNguoiDongHanhRepository;
import com.digitaltravel.erp.repository.HanhDongRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.PhanCongTourRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PhanCongTourService {

    private final PhanCongTourRepository phanCongTourRepository;
    private final NhanVienRepository nhanVienRepository;
    private final TourThucTeRepository tourThucTeRepository;
    private final DiemDanhRepository diemDanhRepository;
    private final HanhDongRepository hanhDongRepository;
    private final DonDatTourRepository donDatTourRepository;
    private final DsNguoiDongHanhRepository dsNguoiDongHanhRepository;

    // ── UC38: Tìm HDV khả dụng ────────────────────────────────────────────
    @Transactional(readOnly = true)
    public List<NhanVienResponse> timHdvKhaDung(String maTourThucTe) {
        TourThucTe tour = tourThucTeRepository.findById(maTourThucTe)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + maTourThucTe));
        if (!"CHO_KICH_HOAT".equals(tour.getTrangThai())) {
            throw AppException.badRequest("Chỉ tìm HDV khả dụng cho tour ở trạng thái CHO_KICH_HOAT");
        }

        LocalDate ngayKhoiHanh = tour.getNgayKhoiHanh();
        // Dùng ngayKhoiHanh làm cả start + end nếu không có NgayKetThuc
        List<String> maNhanViens = phanCongTourRepository.findMaNhanVienKhaDung(ngayKhoiHanh, ngayKhoiHanh);

        return maNhanViens.stream()
                .map(ma -> nhanVienRepository.findById(ma).orElse(null))
                .filter(nv -> nv != null)
                .map(this::toNhanVienResponse)
                .toList();
    }

    // ── UC37: Phân công HDV ────────────────────────────────────────────────
    @Transactional
    public PhanCongResponse phanCong(PhanCongHdvRequest request) {
        TourThucTe tour = tourThucTeRepository.findById(request.getMaTourThucTe())
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour: " + request.getMaTourThucTe()));
        if (!"CHO_KICH_HOAT".equals(tour.getTrangThai())) {
            throw AppException.badRequest("Chỉ được điều phối HDV khi tour ở trạng thái CHO_KICH_HOAT");
        }

        NhanVien hdv = nhanVienRepository.findById(request.getMaNhanVien())
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + request.getMaNhanVien()));

        // Validate HDV role
        String maVaiTro = hdv.getTaiKhoan().getVaiTro().getMaVaiTro();
        if (!VaiTroConst.HDV.equals(maVaiTro)) {
            throw AppException.badRequest("Nhan vien " + request.getMaNhanVien() + " khong phai HDV.");
        }

        // Kiểm tra trùng lịch
        LocalDate ngayKhoiHanh = tour.getNgayKhoiHanh();
        boolean trungLich = !phanCongTourRepository
                .findMaNhanVienKhaDung(ngayKhoiHanh, ngayKhoiHanh)
                .contains(request.getMaNhanVien());
        if (trungLich) {
            throw AppException.badRequest("HDV đã bị phân công cho tour khác trong cùng thời gian.");
        }

        PhanCongTour pc = new PhanCongTour();
        pc.setMaPhanCongTour("PC_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        pc.setTourThucTe(tour);
        pc.setNhanVien(hdv);
        pc.setNgayPhanCong(LocalDateTime.now());
        pc.setTrangThaiChapNhan("CHO_PHAN_HOI");
        phanCongTourRepository.save(pc);

        return toResponse(pc);
    }

    @Transactional
    public PhanCongResponse dongYPhanCong(String maPhanCong, String maTaiKhoan) {
        PhanCongTour pc = phanCongTourRepository.findById(maPhanCong)
                .orElseThrow(() -> AppException.notFound("Khong tim thay phan cong: " + maPhanCong));
        kiemTraChuPhanCong(pc, maTaiKhoan);
        if (!"CHO_PHAN_HOI".equals(pc.getTrangThaiChapNhan())) {
            throw AppException.badRequest("Phân công này đã được phản hồi");
        }

        pc.setTrangThaiChapNhan("DA_DONG_Y");
        phanCongTourRepository.save(pc);

        NhanVien hdv = pc.getNhanVien();
        hdv.setTrangThaiLamViec("BAN");
        nhanVienRepository.save(hdv);

        return toResponse(pc);
    }

    @Transactional
    public PhanCongResponse tuChoiPhanCong(String maPhanCong, String maTaiKhoan) {
        PhanCongTour pc = phanCongTourRepository.findById(maPhanCong)
                .orElseThrow(() -> AppException.notFound("Khong tim thay phan cong: " + maPhanCong));
        kiemTraChuPhanCong(pc, maTaiKhoan);
        if (!"CHO_PHAN_HOI".equals(pc.getTrangThaiChapNhan())) {
            throw AppException.badRequest("Phân công này đã được phản hồi");
        }

        pc.setTrangThaiChapNhan("TU_CHOI");
        phanCongTourRepository.save(pc);
        return toResponse(pc);
    }

    // ── Hủy phân công ─────────────────────────────────────────────────────
    @Transactional
    public void huyPhanCong(String maPhanCong) {
        PhanCongTour pc = phanCongTourRepository.findById(maPhanCong)
                .orElseThrow(() -> AppException.notFound("Khong tim thay phan cong: " + maPhanCong));

        String maTour = pc.getTourThucTe().getMaTourThucTe();
        String maNhanVien = pc.getNhanVien().getMaNhanVien();
        if (diemDanhRepository.existsByMaTourAndMaNhanVien(maTour, maNhanVien)
                || hanhDongRepository.existsByMaTourAndMaNhanVien(maTour, maNhanVien)) {
            throw AppException.badRequest("Không thể hủy phân công đã có dữ liệu vận hành.");
        }

        phanCongTourRepository.delete(pc);

        // Nếu HDV không còn phân công hiệu lực nào thì về HOAT_DONG
        NhanVien hdv = pc.getNhanVien();
        boolean conTourKhac = phanCongTourRepository.findByMaNhanVien(hdv.getMaNhanVien()).stream()
                .anyMatch(other -> !other.getMaPhanCongTour().equals(maPhanCong));
        if (!conTourKhac) {
            hdv.setTrangThaiLamViec("HOAT_DONG");
            nhanVienRepository.save(hdv);
        }
    }

    // ── HDV xem tour của mình ─────────────────────────────────────────────
    @Transactional(readOnly = true)
    public List<PhanCongResponse> tourCuaToi(String maTaiKhoan) {
        NhanVien hdv = nhanVienRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Không tìm thấy hồ sơ nhân viên"));
        return phanCongTourRepository.findByMaNhanVien(hdv.getMaNhanVien()).stream()
                .map(this::toResponse)
                .toList();
    }

    // ── Mappers ───────────────────────────────────────────────────────────
    private PhanCongResponse toResponse(PhanCongTour pc) {
        NhanVien nv = pc.getNhanVien();
        TourThucTe tt = pc.getTourThucTe();
        return PhanCongResponse.builder()
                .maPhanCong(pc.getMaPhanCongTour())
                .maTourThucTe(tt.getMaTourThucTe())
                .tenTour(tt.getTourMau() != null ? tt.getTourMau().getTieuDe() : "")
                .maNhanVien(nv.getMaNhanVien())
                .tenNhanVien(nv.getTaiKhoan().getHoTen())
                .trangThaiChapNhan(pc.getTrangThaiChapNhan())
                .ngayPhanCong(pc.getNgayPhanCong())
                .ngayKhoiHanh(tt.getNgayKhoiHanh())
                .ngayKetThuc(tt.getTourMau() != null ? tt.getNgayKhoiHanh().plusDays(tt.getTourMau().getThoiLuong()) : tt.getNgayKhoiHanh())
                .trangThaiTour(tt.getTrangThai())
                .soKhachToiDa(tt.getSoKhachToiDa())
                .choConLai(tt.getChoConLai())
                .danhSachHanhKhach(layHanhKhachDaXacNhan(tt.getMaTourThucTe()))
                .build();
    }

    private void kiemTraChuPhanCong(PhanCongTour pc, String maTaiKhoan) {
        TaiKhoan taiKhoan = pc.getNhanVien().getTaiKhoan();
        if (taiKhoan == null || !maTaiKhoan.equals(taiKhoan.getMaTaiKhoan())) {
            throw AppException.forbidden("Bạn không có quyền phản hồi phân công này");
        }
    }

    private List<ThanhVienDoanResponse> layHanhKhachDaXacNhan(String maTourThucTe) {
        List<ThanhVienDoanResponse> result = new java.util.ArrayList<>();
        for (DonDatTour don : donDatTourRepository.findConfirmedByMaTourThucTe(maTourThucTe)) {
            HoChieuSo kh = don.getKhachHang();
            TaiKhoan tk = kh.getTaiKhoan();
            result.add(ThanhVienDoanResponse.builder()
                    .maDatTour(don.getMaDatTour())
                    .loaiKhach("NGUOI_DAT")
                    .maKhachHang(kh.getMaKhachHang())
                    .hoTenKhachHang(tk != null ? tk.getHoTen() : "")
                    .soDienThoai(tk != null ? tk.getSoDienThoai() : null)
                    .hangThanhVien(kh.getHangThanhVien())
                    .ghiChuYTe(gopGhiChuYTeVaDiUng(kh.getGhiChuYTe(), kh.getDiUng()))
                    .ghiChuDatTour(don.getGhiChu())
                    .hanhDongXanh(don.getHanhDongXanh())
                    .diemXanh(kh.getDiemXanh())
                    .trangThai("CHUA_DIEM_DANH")
                    .build());

            for (DsNguoiDongHanh ndh : dsNguoiDongHanhRepository.findByDonDatTour_MaDatTour(don.getMaDatTour())) {
                result.add(ThanhVienDoanResponse.builder()
                        .maDatTour(don.getMaDatTour())
                        .loaiKhach("NGUOI_DONG_HANH")
                        .maNguoiDongHanh(ndh.getMaNguoiDongHanh())
                        .hoTenKhachHang(ndh.getHoTen())
                        .soDienThoai(ndh.getSoDienThoai())
                        .hangThanhVien("THANH_VIEN")
                        .ghiChuYTe(ndh.getGhiChu())
                        .ghiChuDatTour(don.getGhiChu())
                        .hanhDongXanh(don.getHanhDongXanh())
                        .diemXanh(0L)
                        .trangThai("CHUA_DIEM_DANH")
                        .build());
            }
        }
        return result;
    }

    private String gopGhiChuYTeVaDiUng(String ghiChuYTe, String diUng) {
        List<String> parts = new java.util.ArrayList<>();
        if (ghiChuYTe != null && !ghiChuYTe.isBlank()) {
            parts.add(ghiChuYTe);
        }
        if (diUng != null && !diUng.isBlank()) {
            parts.add("Dị ứng: " + diUng);
        }
        return String.join(" | ", parts);
    }

    private NhanVienResponse toNhanVienResponse(NhanVien nv) {
        TaiKhoan tk = nv.getTaiKhoan();
        if (tk == null) {
            return NhanVienResponse.builder()
                    .maNhanVien(nv.getMaNhanVien())
                    .trangThaiLamViec(nv.getTrangThaiLamViec())
                    .loaiNhanVien(nv.getLoaiNhanVien())
                    .ngayVaoLam(nv.getNgayVaoLam())
                    .build();
        }
        return NhanVienResponse.builder()
                .maNhanVien(nv.getMaNhanVien())
                .maTaiKhoan(tk.getMaTaiKhoan())
                .tenDangNhap(tk.getTenDangNhap())
                .hoTen(tk.getHoTen())
                .email(tk.getEmail())
                .soDienThoai(tk.getSoDienThoai())
                .maVaiTro(tk.getVaiTro() != null ? tk.getVaiTro().getMaVaiTro() : null)
                .trangThaiTaiKhoan(tk.getTrangThai())
                .trangThaiLamViec(nv.getTrangThaiLamViec())
                .loaiNhanVien(nv.getLoaiNhanVien())
                .ngayVaoLam(nv.getNgayVaoLam())
                .cccd(tk.getCccd())
                .ngaySinh(tk.getNgaySinh())
                .build();
    }
}
