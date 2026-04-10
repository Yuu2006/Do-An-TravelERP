package com.digitaltravel.erp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.JwtUtil;
import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.DangNhapRequest;
import com.digitaltravel.erp.dto.DangNhapResponse;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    @PostMapping("/dang-nhap")
    public ResponseEntity<?> dangNhap(@Valid @RequestBody DangNhapRequest request) {
        try {
            Authentication auth = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getTenDangNhap(), request.getMatKhau())
            );

            TaiKhoanDetails details = (TaiKhoanDetails) auth.getPrincipal();
            String token = jwtUtil.generateToken(details);

            return ResponseEntity.ok(DangNhapResponse.builder()
                    .accessToken(token)
                    .tokenType("Bearer")
                    .maVaiTro(details.getTaiKhoan().getVaiTro().getMaVaiTro())
                    .tenHienThi(details.getTaiKhoan().getVaiTro().getTenHienThi())
                    .hoTen(details.getTaiKhoan().getHoTen())
                    .build());
        } catch (DisabledException e) {
            return ResponseEntity.status(403).body(Map.of(
                    "error", "ACCOUNT_DISABLED",
                    "message", "Tai khoan khong o trang thai HOAT_DONG"
            ));
        } catch (LockedException e) {
            return ResponseEntity.status(423).body(Map.of(
                    "error", "ACCOUNT_LOCKED",
                    "message", "Tai khoan dang bi khoa"
            ));
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(401).body(Map.of(
                    "error", "BAD_CREDENTIALS",
                    "message", "Sai ten dang nhap hoac mat khau"
            ));
        } catch (AuthenticationException e) {
            return ResponseEntity.status(401).body(Map.of(
                    "error", "AUTHENTICATION_FAILED",
                    "message", e.getClass().getSimpleName()
            ));
        }
    }
}
