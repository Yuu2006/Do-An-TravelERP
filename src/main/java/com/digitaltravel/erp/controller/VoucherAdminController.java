package com.digitaltravel.erp.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
import com.digitaltravel.erp.dto.requests.PhatHanhVoucherRequest;
import com.digitaltravel.erp.dto.requests.VoucherRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.KhuyenMaiKhResponse;
import com.digitaltravel.erp.dto.responses.VoucherResponse;
import com.digitaltravel.erp.service.VoucherService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

/**
 * UC54 — Tạo voucher mới
 * UC55 — Cập nhật voucher
 * UC56 — Phát hành voucher cho khách hàng
 */
@RestController
@RequestMapping("/api/kinh-doanh/voucher")
@RequiredArgsConstructor
public class VoucherAdminController {

    private final VoucherService voucherService;

    // ── Danh sách voucher ─────────────────────────────────────────────────────
    @GetMapping
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<Page<VoucherResponse>>> danhSach(
            @RequestParam(required = false) String trangThai,
            @PageableDefault(size = 10, sort = "NgayHieuLuc", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(voucherService.danhSach(trangThai, pageable)));
    }

    // ── Chi tiết voucher ──────────────────────────────────────────────────────
    @GetMapping("/{maVoucher}")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<VoucherResponse>> chiTiet(@PathVariable String maVoucher) {
        return ResponseEntity.ok(ApiResponse.ok(voucherService.chiTiet(maVoucher)));
    }

    // ── UC54: Tạo voucher mới ─────────────────────────────────────────────────
    @PostMapping
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<VoucherResponse>> taoVoucher(
            @Valid @RequestBody VoucherRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.status(201).body(ApiResponse.created(
                voucherService.taoVoucher(request, user.getUsername())));
    }

    // ── UC55: Cập nhật voucher ────────────────────────────────────────────────
    @PutMapping("/{maVoucher}")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<VoucherResponse>> capNhatVoucher(
            @PathVariable String maVoucher,
            @Valid @RequestBody VoucherRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Cap nhat voucher thanh cong",
                voucherService.capNhatVoucher(maVoucher, request, user.getUsername())));
    }

    // ── UC55: Vô hiệu hóa voucher ────────────────────────────────────────────
    @PutMapping("/{maVoucher}/vo-hieu")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<VoucherResponse>> voHieuVoucher(
            @PathVariable String maVoucher,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Vo hieu voucher thanh cong",
                voucherService.voHieu(maVoucher, user.getUsername())));
    }

    // ── UC56: Phát hành voucher cho khách hàng ────────────────────────────────
    @PostMapping("/{maVoucher}/phat-hanh")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<KhuyenMaiKhResponse>> phatHanh(
            @PathVariable String maVoucher,
            @Valid @RequestBody PhatHanhVoucherRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.status(201).body(ApiResponse.created(
                voucherService.phatHanhChoKhachHang(maVoucher, request, user.getUsername())));
    }
}
