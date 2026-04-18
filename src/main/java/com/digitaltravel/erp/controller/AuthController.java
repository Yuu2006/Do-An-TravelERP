package com.digitaltravel.erp.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.JwtUtil;
import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.config.VaiTroConst;
import com.digitaltravel.erp.dto.requests.DangKyRequest;
import com.digitaltravel.erp.dto.requests.DangNhapRequest;
import com.digitaltravel.erp.dto.requests.DatLaiMatKhauRequest;
import com.digitaltravel.erp.dto.requests.DoiMatKhauRequest;
import com.digitaltravel.erp.dto.requests.QuenMatKhauRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.DangNhapResponse;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.entity.VaiTro;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.TaiKhoanRepository;
import com.digitaltravel.erp.repository.VaiTroRepository;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;
    private final PasswordEncoder passwordEncoder;
    private final TaiKhoanRepository taiKhoanRepository;
    private final VaiTroRepository vaiTroRepository;

    @PostMapping("/dang-ky")
    public ResponseEntity<ApiResponse<DangNhapResponse>> dangKy(@Valid @RequestBody DangKyRequest request) {
        if (!request.getMatKhau().equals(request.getXacNhanMatKhau())) {
            throw AppException.badRequest("Mat khau va xac nhan mat khau khong khop");
        }
        if (taiKhoanRepository.existsByTenDangNhap(request.getTenDangNhap())) {
            throw AppException.badRequest("Ten dang nhap da ton tai");
        }
        if (request.getEmail() != null && !request.getEmail().isBlank()
                && taiKhoanRepository.existsByEmail(request.getEmail())) {
            throw AppException.badRequest("Email da duoc su dung");
        }

        VaiTro vaiTroKhach = vaiTroRepository.findById(VaiTroConst.KHACHHANG)
                .orElseThrow(() -> AppException.notFound("Khong tim thay vai tro KHACHHANG"));

        TaiKhoan taiKhoan = new TaiKhoan();
        taiKhoan.setMaTaiKhoan(UUID.randomUUID().toString());
        taiKhoan.setTenDangNhap(request.getTenDangNhap());
        taiKhoan.setMatKhau(passwordEncoder.encode(request.getMatKhau()));
        taiKhoan.setHoTen(request.getHoTen());
        taiKhoan.setEmail(request.getEmail());
        taiKhoan.setSoDienThoai(request.getSoDienThoai());
        taiKhoan.setVaiTro(vaiTroKhach);
        taiKhoan.setTrangThai("HOAT_DONG");
        taiKhoanRepository.save(taiKhoan);

        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getTenDangNhap(), request.getMatKhau())
        );
        TaiKhoanDetails details = (TaiKhoanDetails) auth.getPrincipal();
        String token = jwtUtil.generateToken(details);
        DangNhapResponse body = DangNhapResponse.builder()
                .accessToken(token)
                .tokenType("Bearer")
                .maVaiTro(details.getTaiKhoan().getVaiTro().getMaVaiTro())
                .tenHienThi(details.getTaiKhoan().getVaiTro().getTenHienThi())
                .hoTen(details.getTaiKhoan().getHoTen())
                .build();
        return ResponseEntity.status(201).body(ApiResponse.created(body));
    }

    @PostMapping("/dang-nhap")
    public ResponseEntity<ApiResponse<DangNhapResponse>> dangNhap(@Valid @RequestBody DangNhapRequest request) {
        Authentication auth = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.getTenDangNhap(), request.getMatKhau())
        );
        TaiKhoanDetails details = (TaiKhoanDetails) auth.getPrincipal();
        String token = jwtUtil.generateToken(details);
        DangNhapResponse body = DangNhapResponse.builder()
                .accessToken(token)
                .tokenType("Bearer")
                .maVaiTro(details.getTaiKhoan().getVaiTro().getMaVaiTro())
                .tenHienThi(details.getTaiKhoan().getVaiTro().getTenHienThi())
                .hoTen(details.getTaiKhoan().getHoTen())
                .build();
        return ResponseEntity.ok(ApiResponse.ok("Dang nhap thanh cong", body));
    }

    @PostMapping("/doi-mat-khau")
    public ResponseEntity<ApiResponse<Void>> doiMatKhau(
            @AuthenticationPrincipal TaiKhoanDetails details,
            @Valid @RequestBody DoiMatKhauRequest request) {
        if (!request.getMatKhauMoi().equals(request.getXacNhanMatKhau())) {
            throw AppException.badRequest("Mat khau moi va xac nhan khong khop");
        }
        if (!passwordEncoder.matches(request.getMatKhauCu(), details.getPassword())) {
            throw AppException.unauthorized("Mat khau cu khong dung");
        }
        TaiKhoan taiKhoan = details.getTaiKhoan();
        taiKhoan.setMatKhau(passwordEncoder.encode(request.getMatKhauMoi()));
        taiKhoanRepository.save(taiKhoan);
        return ResponseEntity.ok(ApiResponse.noContent("Doi mat khau thanh cong"));
    }

    @PostMapping("/quen-mat-khau")
    public ResponseEntity<ApiResponse<String>> quenMatKhau(@Valid @RequestBody QuenMatKhauRequest request) {
        taiKhoanRepository.findByTenDangNhapWithVaiTro(request.getTenDangNhap())
                .orElseThrow(() -> AppException.notFound("Khong tim thay tai khoan"));
        String resetToken = jwtUtil.generateResetToken(request.getTenDangNhap());
        // TODO: Thay viec tra ve token bang gui email trong production
        return ResponseEntity.ok(ApiResponse.ok("Da tao token dat lai mat khau (hieu luc 15 phut)", resetToken));
    }

    @PostMapping("/dat-lai-mat-khau")
    public ResponseEntity<ApiResponse<Void>> datLaiMatKhau(@Valid @RequestBody DatLaiMatKhauRequest request) {
        if (!request.getMatKhauMoi().equals(request.getXacNhanMatKhau())) {
            throw AppException.badRequest("Mat khau moi va xac nhan khong khop");
        }
        String tenDangNhap = jwtUtil.extractResetSubject(request.getResetToken());
        TaiKhoan taiKhoan = taiKhoanRepository.findByTenDangNhapWithVaiTro(tenDangNhap)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tai khoan"));
        taiKhoan.setMatKhau(passwordEncoder.encode(request.getMatKhauMoi()));
        taiKhoanRepository.save(taiKhoan);
        return ResponseEntity.ok(ApiResponse.noContent("Dat lai mat khau thanh cong"));
    }

    @PostMapping("/dang-xuat")
    public ResponseEntity<ApiResponse<Void>> dangXuat() {
        return ResponseEntity.ok(ApiResponse.noContent("Dang xuat thanh cong"));
    }
}
