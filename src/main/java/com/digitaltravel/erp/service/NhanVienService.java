package com.digitaltravel.erp.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.TaiKhoanRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NhanVienService {

    private final NhanVienRepository nhanVienRepository;
    private final TaiKhoanRepository taiKhoanRepository;

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

        // Không cho tự khóa chính mình
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
    }

    // ── Mở khóa tài khoản (UC67) ──────────────────────────────────────────
    @Transactional
    public void moKhoaTaiKhoan(String maNhanVien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));

        TaiKhoan tk = nv.getTaiKhoan();
        if ("HOAT_DONG".equals(tk.getTrangThai())) {
            throw AppException.badRequest("Tai khoan da o trang thai HOAT_DONG.");
        }
        tk.setTrangThai("HOAT_DONG");
        taiKhoanRepository.save(tk);
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
                .thoiDiemTao(nv.getThoiDiemTao())
                .build();
    }
}
