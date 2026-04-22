package com.digitaltravel.erp.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.requests.KhoiTaoThanhToanRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.ThanhToanResponse;
import com.digitaltravel.erp.service.ThanhToanService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/thanh-toan")
@RequiredArgsConstructor
public class ThanhToanController {

    private final ThanhToanService thanhToanService;

    /**
     * UC29 — Khởi tạo giao dịch thanh toán.
     * Truyền mock=true để bypass MoMo trong dev/test.
     */
    @PostMapping("/khoi-tao")
    @PreAuthorize("hasRole('KHACHHANG')")
    public ResponseEntity<ApiResponse<ThanhToanResponse>> khoiTaoThanhToan(
            @AuthenticationPrincipal TaiKhoanDetails user,
            @Valid @RequestBody KhoiTaoThanhToanRequest request) {
        String maTaiKhoan = user.getTaiKhoan().getMaTaiKhoan();
        ThanhToanResponse result = thanhToanService.khoiTaoThanhToan(maTaiKhoan, request);
        return ResponseEntity.ok(ApiResponse.ok("Khoi tao thanh toan thanh cong", result));
    }

    /**
     * Kiểm tra kết quả giao dịch chủ động (polling).
     */
    @GetMapping("/{maDatTour}/ket-qua")
    @PreAuthorize("hasRole('KHACHHANG')")
    public ResponseEntity<ApiResponse<ThanhToanResponse>> ketQua(
            @AuthenticationPrincipal TaiKhoanDetails user,
            @PathVariable String maDatTour) {
        String maTaiKhoan = user.getTaiKhoan().getMaTaiKhoan();
        return ResponseEntity.ok(ApiResponse.ok(thanhToanService.ketQua(maTaiKhoan, maDatTour)));
    }
}
