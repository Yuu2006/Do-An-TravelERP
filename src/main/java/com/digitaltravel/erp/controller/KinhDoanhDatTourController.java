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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.DonDatTourResponse;
import com.digitaltravel.erp.service.DatTourService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/kinh-doanh")
@RequiredArgsConstructor
public class KinhDoanhDatTourController {

    private final DatTourService datTourService;

    @GetMapping("/dat-tour")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<Page<DonDatTourResponse>>> danhSachTatCa(
            @RequestParam(required = false) String trangThai,
            @RequestParam(required = false) String maTourThucTe,
            @PageableDefault(size = 10, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(datTourService.danhSachTatCa(trangThai, maTourThucTe, pageable)));
    }

    @PutMapping("/dat-tour/{maDatTour}/xac-nhan")
    @PreAuthorize("hasRole('KINHDOANH')")
    public ResponseEntity<ApiResponse<DonDatTourResponse>> xacNhanDon(
            @PathVariable String maDatTour,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Xac nhan don dat tour thanh cong",
                datTourService.xacNhanDon(maDatTour, user.getUsername())));
    }
}
