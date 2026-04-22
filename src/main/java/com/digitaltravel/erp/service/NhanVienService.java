package com.digitaltravel.erp.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    // ── UC69: Gán vai trò cho nhân viên ──────────────────────────────────────
    @Transactional
    public NhanVienResponse ganVaiTro(String maNhanVien, GanVaiTroRequest request, String nguoiThucHien) {
        NhanVien nv = nhanVienRepository.findById(maNhanVien)
                .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + maNhanVien));

        VaiTro vaiTro = vaiTroRepository.findById(request.getMaVaiTro())
                .orElseThrow(() -> AppException.notFound("Khong tim thay vai tro: " + request.getMaVaiTro()));

        TaiKhoan tk = nv.getTaiKhoan();
        tk.setVaiTro(vaiTro);
        taiKhoanRepository.save(tk);
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
                .thoiDiemTao(nv.getThoiDiemTao())
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
                .thoiDiemTao(hcs.getThoiDiemTao())
                .capNhatVao(hcs.getCapNhatVao())
                .build();
    }
}
