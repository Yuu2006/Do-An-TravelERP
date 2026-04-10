package com.digitaltravel.erp.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;

@RestController
@RequestMapping("/api")
public class TestPhanQuyenController {

    // Ai cũng vào được (chỉ cần đăng nhập)
    @GetMapping("/me")
    public ResponseEntity<Map<String, Object>> thongTinCaNhan(
            @AuthenticationPrincipal TaiKhoanDetails details) {
        return ResponseEntity.ok(Map.of(
                "tenDangNhap", details.getUsername(),
                "hoTen", details.getTaiKhoan().getHoTen(),
                "vaiTro", details.getTaiKhoan().getVaiTro().getMaVaiTro(),
                "tenVaiTro", details.getTaiKhoan().getVaiTro().getTenHienThi(),
                "roles", details.getAuthorities().stream()
                        .map(a -> a.getAuthority()).toList()
        ));
    }

    // Chỉ ADMIN
    @GetMapping("/admin/dashboard")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Map<String, String>> adminDashboard(
            @AuthenticationPrincipal TaiKhoanDetails details) {
        return ResponseEntity.ok(Map.of(
                "message", "Chào mừng Admin: " + details.getTaiKhoan().getHoTen(),
                "vaiTro", details.getTaiKhoan().getVaiTro().getMaVaiTro()
        ));
    }

    // Không cần vai trò cụ thể, chỉ cần đăng nhập — dùng để test 403
    @GetMapping("/nhan-vien/dashboard")
    @PreAuthorize("hasRole('NHAN_VIEN')")
    public ResponseEntity<Map<String, String>> nhanVienDashboard(
            @AuthenticationPrincipal TaiKhoanDetails details) {
        return ResponseEntity.ok(Map.of(
                "message", "Chào nhân viên: " + details.getTaiKhoan().getHoTen()
        ));
    }
}
