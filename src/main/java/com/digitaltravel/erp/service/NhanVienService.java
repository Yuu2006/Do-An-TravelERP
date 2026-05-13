package com.digitaltravel.erp.service;

import java.util.Locale;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.config.VaiTroConst;
import com.digitaltravel.erp.dto.requests.GanVaiTroRequest;
import com.digitaltravel.erp.dto.responses.HoChieuSoResponse;
import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.entity.VaiTro;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.TaiKhoanRepository;
import com.digitaltravel.erp.repository.VaiTroRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NhanVienService {



    private final NhanVienRepository nhanVienRepository;
    private final TaiKhoanRepository taiKhoanRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final VaiTroRepository vaiTroRepository;
    private final NhatKyBaoMatService nhatKyBaoMatService;

    // ── Tìm kiếm nhân viên (UC68) ─────────────────────────────────────────
    public Page<NhanVienResponse> timKiem(String hoTen, String maVaiTro, String trangThai, Pageable pageable) {
        return nhanVienRepository.timKiem(hoTen, maVaiTro, trangThai, pageable)
                .map(this::toResponse);
    }

    // ── Chi tiết nhân viên (UC68) ─────────────────────────────────────────
    public NhanVienResponse chiTiet(String maNhanVien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));
        return toResponse(nv);
    }

    // ── Khóa tài khoản (UC66) ─────────────────────────────────────────────
    @Transactional
    public void khoaTaiKhoan(String maNhanVien, String nguoiThucHien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));

        TaiKhoan tkNguoiThucHien = taiKhoanRepository.findById(nguoiThucHien).orElse(null);
        if (tkNguoiThucHien != null && nv.getTaiKhoan().getMaTaiKhoan().equals(nguoiThucHien)) {
            throw AppException.badRequest("Khong the tu khoa chinh tai khoan cua ban.");
        }

        TaiKhoan tk = nv.getTaiKhoan();
        if ("KHOA".equals(tk.getTrangThai())) {
            throw AppException.badRequest("Tai khoan da o trang thai KHOA.");
        }
        tk.setTrangThai("KHOA");
        taiKhoanRepository.save(tk);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "KHOA_TAI_KHOAN", NhatKyBaoMatService.THANH_CONG,
                "Khoa tai khoan " + tk.getMaTaiKhoan(), null);
    }

    // ── Mở khóa tài khoản (UC67) ──────────────────────────────────────────
    @Transactional
    public void moKhoaTaiKhoan(String maNhanVien, String nguoiThucHien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));

        TaiKhoan tk = nv.getTaiKhoan();
        if ("HOAT_DONG".equals(tk.getTrangThai())) {
            throw AppException.badRequest("Tai khoan da o trang thai HOAT_DONG.");
        }
        tk.setTrangThai("HOAT_DONG");
        taiKhoanRepository.save(tk);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "MO_KHOA_TAI_KHOAN", NhatKyBaoMatService.THANH_CONG,
                "Mo khoa tai khoan " + tk.getMaTaiKhoan(), null);
    }

    // ── UC69: Gán vai trò cho nhân viên ──────────────────────────────────────
    @Transactional
    public NhanVienResponse ganVaiTro(String maNhanVien, GanVaiTroRequest request, String nguoiThucHien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));

        TaiKhoan tk = nv.getTaiKhoan();
        String maVaiTro = request.getMaVaiTro().trim().toUpperCase(Locale.ROOT);
        if (!VaiTroConst.VAI_TRO_NHAN_VIEN.contains(maVaiTro)) {
            throw AppException.badRequest(VaiTroConst.VAI_TRO_NHAN_VIEN_MSG);
        }
        VaiTro vaiTroHopLe = vaiTroRepository.findById(maVaiTro)
                .orElseThrow(() -> AppException.notFound("Khong tim thay vai tro: " + maVaiTro));
        if (!"HOAT_DONG".equals(vaiTroHopLe.getTrangThai())) {
            throw AppException.badRequest("Vai tro dang o trang thai " + vaiTroHopLe.getTrangThai() + ", khong the gan");
        }

        tk.setVaiTro(vaiTroHopLe);
        nv.setLoaiNhanVien(maVaiTro);
        taiKhoanRepository.save(tk);
        nhanVienRepository.save(nv);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "GAN_VAI_TRO", NhatKyBaoMatService.THANH_CONG,
                "Gan vai tro " + maVaiTro + " cho tai khoan " + tk.getMaTaiKhoan(), null);
        return toResponse(nv);
    }

    // ── UC24: Tìm kiếm thông tin khách hàng ──────────────────────────────────
    public Page<HoChieuSoResponse> timKiemKhachHang(String hoTen, String email, String soDienThoai, Pageable pageable) {
        return hoChieuSoRepository.timKiemKhachHang(hoTen, email, soDienThoai, pageable)
                .map(this::toHoChieuSoResponse);
    }

    public HoChieuSoResponse chiTietKhachHang(String maKhachHang) {
        return hoChieuSoRepository.findById(maKhachHang)
                .map(this::toHoChieuSoResponse)
                .orElseThrow(() -> AppException.notFound("Khong tim thay khach hang: " + maKhachHang));
    }

    // ── Lấy NhanVien theo maTaiKhoan (dùng cho controller) ───────────────────
    public NhanVien findNhanVienByTaiKhoan(String maTaiKhoan) {
        return nhanVienRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so nhan vien"));
    }

    // ── Mapper ────────────────────────────────────────────────────────────
    private NhanVienResponse toResponse(NhanVien nv) {
        TaiKhoan tk = nv.getTaiKhoan();
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
                .build();
    }

    private HoChieuSoResponse toHoChieuSoResponse(com.digitaltravel.erp.entity.HoChieuSo hcs) {
        TaiKhoan tk = hcs.getTaiKhoan();
        return HoChieuSoResponse.builder()
                .maKhachHang(hcs.getMaKhachHang())
                .maTaiKhoan(tk.getMaTaiKhoan())
                .tenDangNhap(tk.getTenDangNhap())
                .hoTen(tk.getHoTen())
                .email(tk.getEmail())
                .soDienThoai(tk.getSoDienThoai())
                .diUng(hcs.getDiUng())
                .ghiChuYTe(hcs.getGhiChuYTe())
                .hangThanhVien(hcs.getHangThanhVien())
                .diemXanh(hcs.getDiemXanh())
                .build();
    }
}
