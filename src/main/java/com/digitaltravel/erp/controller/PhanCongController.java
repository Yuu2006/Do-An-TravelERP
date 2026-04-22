package com.digitaltravel.erp.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.requests.PhanCongHdvRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.dto.responses.PhanCongResponse;
import com.digitaltravel.erp.service.PhanCongTourService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/manager")
@RequiredArgsConstructor
public class PhanCongController {

    private final PhanCongTourService phanCongTourService;

    /**
     * UC38 — Danh sách HDV khả dụng cho 1 tour (không trùng lịch)
     */
    @GetMapping("/hdv-kha-dung")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<List<NhanVienResponse>>> hdvKhaDung(
            @RequestParam String maTourThucTe) {
        return ResponseEntity.ok(ApiResponse.ok(phanCongTourService.timHdvKhaDung(maTourThucTe)));
    }

    /**
     * UC37 — Phân công HDV vào tour
     */
    @PostMapping("/phan-cong")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<PhanCongResponse>> phanCong(
            @Valid @RequestBody PhanCongHdvRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        String taoBoi = user.getUsername();
        PhanCongResponse result = phanCongTourService.phanCong(request, taoBoi);
        return ResponseEntity.status(201).body(ApiResponse.created(result));
    }

    /**
     * UC37 — Hủy phân công
     */
    @DeleteMapping("/phan-cong/{maPhanCong}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<Void>> huyPhanCong(
            @PathVariable String maPhanCong) {
        phanCongTourService.huyPhanCong(maPhanCong);
        return ResponseEntity.ok(ApiResponse.noContent("Huy phan cong thanh cong"));
    }
}
