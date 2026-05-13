package com.digitaltravel.erp.controller;

import java.time.LocalDateTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.NhatKyBaoMatResponse;
import com.digitaltravel.erp.service.NhatKyBaoMatService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/quan-tri")
@RequiredArgsConstructor
public class QuanTriController {

    private final NhatKyBaoMatService nhatKyBaoMatService;

    @GetMapping("/nhat-ky-bao-mat")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Page<NhatKyBaoMatResponse>>> nhatKyBaoMat(
            @RequestParam(required = false) String maTaiKhoan,
            @RequestParam(required = false) String hanhDong,
            @RequestParam(required = false) String doiTuong,
            @RequestParam(required = false) String maDoiTuong,
            @RequestParam(required = false) String ketQua,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime tuThoiGian,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime denThoiGian,
            @PageableDefault(size = 20, sort = "ThoiGian", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                nhatKyBaoMatService.timKiem(maTaiKhoan, hanhDong, doiTuong, maDoiTuong, ketQua,
                        tuThoiGian, denThoiGian, pageable)));
    }
}
