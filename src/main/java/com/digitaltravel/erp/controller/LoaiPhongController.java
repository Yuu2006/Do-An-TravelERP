package com.digitaltravel.erp.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.dto.requests.LoaiPhongRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.LoaiPhongResponse;
import com.digitaltravel.erp.service.LoaiPhongService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/san-pham/loai-phong")
@RequiredArgsConstructor
public class LoaiPhongController {

    private final LoaiPhongService loaiPhongService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<LoaiPhongResponse>>> danhSach() {
        return ResponseEntity.ok(ApiResponse.ok(loaiPhongService.danhSach()));
    }

    @PostMapping
    @PreAuthorize("hasRole('SANPHAM')")
    public ResponseEntity<ApiResponse<LoaiPhongResponse>> taoMoi(@Valid @RequestBody LoaiPhongRequest request) {
        LoaiPhongResponse result = loaiPhongService.taoMoi(request);
        return ResponseEntity.status(201).body(ApiResponse.created(result));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('SANPHAM')")
    public ResponseEntity<ApiResponse<LoaiPhongResponse>> capNhat(
            @PathVariable String id,
            @Valid @RequestBody LoaiPhongRequest request
    ) {
        return ResponseEntity.ok(ApiResponse.ok("Cap nhat loai phong thanh cong", loaiPhongService.capNhat(id, request)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('SANPHAM')")
    public ResponseEntity<ApiResponse<Void>> xoa(@PathVariable String id) {
        loaiPhongService.xoa(id);
        return ResponseEntity.ok(ApiResponse.noContent("Xoa loai phong thanh cong"));
    }
}
