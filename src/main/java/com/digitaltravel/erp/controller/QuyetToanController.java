package com.digitaltravel.erp.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.requests.QuyetToanRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.QuyetToanResponse;
import com.digitaltravel.erp.service.QuyetToanService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/ketoan")
@RequiredArgsConstructor
public class QuyetToanController {

    private final QuyetToanService quyetToanService;

    /**
     * UC47 — Danh sách tour cần quyết toán (KET_THUC, chưa có QT)
     */
    @GetMapping("/tour-can-quyet-toan")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<Page<QuyetToanResponse>>> tourCanQuyetToan(Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(quyetToanService.tourCanQuyetToan(pageable)));
    }

    /**
     * UC48 — Tính toán sơ bộ (preview, không lưu DB)
     */
    @GetMapping("/tinh-toan/{maTour}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<QuyetToanResponse>> tinhToan(@PathVariable String maTour) {
        return ResponseEntity.ok(ApiResponse.ok(quyetToanService.tinhToan(maTour)));
    }

    /**
     * UC49 — Tạo/cập nhật bản nháp quyết toán
     */
    @PostMapping("/quyet-toan/{maTour}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<QuyetToanResponse>> taoQuyetToan(
            @PathVariable String maTour,
            @Valid @RequestBody(required = false) QuyetToanRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        QuyetToanResponse result = quyetToanService.taoQuyetToan(maTour, request, user.getUsername());
        return ResponseEntity.status(201).body(ApiResponse.created(result));
    }

    /**
     * UC50 — Chốt quyết toán (DRAFT → LOCKED)
     */
    @PutMapping("/quyet-toan/{maQuyetToan}/chot")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<QuyetToanResponse>> chotQuyetToan(@PathVariable String maQuyetToan) {
        return ResponseEntity.ok(ApiResponse.ok(quyetToanService.chotQuyetToan(maQuyetToan)));
    }

    /**
     * UC51-53 — Danh sách quyết toán
     */
    @GetMapping("/quyet-toan")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<Page<QuyetToanResponse>>> danhSach(
            @RequestParam(required = false) String trangThai,
            Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(quyetToanService.danhSach(trangThai, pageable)));
    }

    /**
     * Chi tiết 1 quyết toán
     */
    @GetMapping("/quyet-toan/{maQuyetToan}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<QuyetToanResponse>> chiTiet(@PathVariable String maQuyetToan) {
        return ResponseEntity.ok(ApiResponse.ok(quyetToanService.chiTiet(maQuyetToan)));
    }
}
