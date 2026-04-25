package com.digitaltravel.erp.controller;

import java.time.LocalDateTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.digitaltravel.erp.dto.requests.ThamSoHeThongRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.NhatKyBaoMatResponse;
import com.digitaltravel.erp.dto.responses.ThamSoHeThongResponse;
import com.digitaltravel.erp.service.NhatKyBaoMatService;
import com.digitaltravel.erp.service.ThamSoHeThongService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/quan-tri")
@RequiredArgsConstructor
public class QuanTriController {

    private final ThamSoHeThongService thamSoHeThongService;
    private final NhatKyBaoMatService nhatKyBaoMatService;

    @GetMapping("/tham-so-he-thong")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Page<ThamSoHeThongResponse>>> danhSachThamSo(
            @RequestParam(required = false) String tuKhoa,
            @RequestParam(required = false) String trangThai,
            @PageableDefault(size = 10, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(thamSoHeThongService.timKiem(tuKhoa, trangThai, pageable)));
    }

    @GetMapping("/tham-so-he-thong/{maThamSo}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ThamSoHeThongResponse>> chiTietThamSo(@PathVariable String maThamSo) {
        return ResponseEntity.ok(ApiResponse.ok(thamSoHeThongService.chiTiet(maThamSo)));
    }

    @PostMapping("/tham-so-he-thong")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ThamSoHeThongResponse>> taoThamSo(
            @AuthenticationPrincipal TaiKhoanDetails user,
            @Valid @RequestBody ThamSoHeThongRequest request,
            HttpServletRequest httpRequest) {
        return ResponseEntity.status(201).body(ApiResponse.created(
                thamSoHeThongService.taoMoi(request, user.getTaiKhoan().getMaTaiKhoan(), httpRequest)));
    }

    @PutMapping("/tham-so-he-thong/{maThamSo}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ThamSoHeThongResponse>> capNhatThamSo(
            @PathVariable String maThamSo,
            @AuthenticationPrincipal TaiKhoanDetails user,
            @Valid @RequestBody ThamSoHeThongRequest request,
            HttpServletRequest httpRequest) {
        return ResponseEntity.ok(ApiResponse.ok("Cap nhat tham so thanh cong",
                thamSoHeThongService.capNhat(maThamSo, request, user.getTaiKhoan().getMaTaiKhoan(), httpRequest)));
    }

    @PutMapping("/tham-so-he-thong/{maThamSo}/khoa")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> khoaThamSo(
            @PathVariable String maThamSo,
            @AuthenticationPrincipal TaiKhoanDetails user,
            HttpServletRequest httpRequest) {
        thamSoHeThongService.khoa(maThamSo, user.getTaiKhoan().getMaTaiKhoan(), httpRequest);
        return ResponseEntity.ok(ApiResponse.noContent("Khoa tham so thanh cong"));
    }

    @PutMapping("/tham-so-he-thong/{maThamSo}/mo-khoa")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> moKhoaThamSo(
            @PathVariable String maThamSo,
            @AuthenticationPrincipal TaiKhoanDetails user,
            HttpServletRequest httpRequest) {
        thamSoHeThongService.moKhoa(maThamSo, user.getTaiKhoan().getMaTaiKhoan(), httpRequest);
        return ResponseEntity.ok(ApiResponse.noContent("Mo khoa tham so thanh cong"));
    }

    @GetMapping("/nhat-ky-bao-mat")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Page<NhatKyBaoMatResponse>>> nhatKyBaoMat(
            @RequestParam(required = false) String maTaiKhoan,
            @RequestParam(required = false) String hanhDong,
            @RequestParam(required = false) String ketQua,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime tuThoiDiem,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime denThoiDiem,
            @PageableDefault(size = 20, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                nhatKyBaoMatService.timKiem(maTaiKhoan, hanhDong, ketQua, tuThoiDiem, denThoiDiem, pageable)));
    }
}
