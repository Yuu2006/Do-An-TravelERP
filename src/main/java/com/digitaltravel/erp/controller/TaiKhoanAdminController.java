package com.digitaltravel.erp.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.VaiTroConst;
import com.digitaltravel.erp.dto.requests.DangKyNhanVienRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.entity.VaiTro;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.TaiKhoanRepository;
import com.digitaltravel.erp.repository.VaiTroRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/quan-tri")
@RequiredArgsConstructor
public class TaiKhoanAdminController {

    private final PasswordEncoder passwordEncoder;
    private final TaiKhoanRepository taiKhoanRepository;
    private final VaiTroRepository vaiTroRepository;
    private final NhanVienRepository nhanVienRepository;



    @PostMapping("/dang-ky-nhan-vien")
    public ResponseEntity<ApiResponse<Void>> dangKyNhanVien(@Valid @RequestBody DangKyNhanVienRequest request) {
        String maVaiTro = request.getMaVaiTro().toUpperCase();

        if (!VaiTroConst.VAI_TRO_NHAN_VIEN.contains(maVaiTro)) {
            throw AppException.badRequest(VaiTroConst.VAI_TRO_NHAN_VIEN_MSG);
        }
        if (taiKhoanRepository.existsByTenDangNhap(request.getTenDangNhap())) {
            throw AppException.badRequest("Ten dang nhap da ton tai");
        }
        if (request.getEmail() != null && !request.getEmail().isBlank()
                && taiKhoanRepository.existsByEmail(request.getEmail())) {
            throw AppException.badRequest("Email da duoc su dung");
        }

        VaiTro vaiTro = vaiTroRepository.findById(maVaiTro)
                .orElseThrow(() -> AppException.notFound("Khong tim thay vai tro: " + maVaiTro));

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setMaTaiKhoan(UUID.randomUUID().toString());
        taiKhoan.setTenDangNhap(request.getTenDangNhap());
        taiKhoan.setMatKhau(passwordEncoder.encode(request.getMatKhau()));
        taiKhoan.setHoTen(request.getHoTen());
        taiKhoan.setEmail(request.getEmail());
        taiKhoan.setSoDienThoai(request.getSoDienThoai());
        taiKhoan.setVaiTro(vaiTro);
        taiKhoan.setTrangThai("HOAT_DONG");
        taiKhoanRepository.save(taiKhoan);

        NhanVien nhanVien = new NhanVien();
        nhanVien.setMaNhanVien("NV_" + UUID.randomUUID().toString().replace("-", "").substring(0, 8).toUpperCase());
        nhanVien.setTaiKhoan(taiKhoan);
        nhanVien.setLoaiNhanVien(maVaiTro);
        nhanVien.setTrangThaiLamViec("SAN_SANG");
        nhanVienRepository.save(nhanVien);

        return ResponseEntity.status(201).body(ApiResponse.noContent("Tao tai khoan nhan vien thanh cong"));
    }
}
