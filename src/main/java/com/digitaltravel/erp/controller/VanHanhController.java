package com.digitaltravel.erp.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digitaltravel.erp.config.TaiKhoanDetails;
import com.digitaltravel.erp.dto.requests.BaoCaoSuCoRequest;
import com.digitaltravel.erp.dto.requests.DiemDanhRequest;
import com.digitaltravel.erp.dto.requests.GhiNhanHanhDongRequest;
import com.digitaltravel.erp.dto.requests.KhaiChiPhiRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.ChiPhiThucTeResponse;
import com.digitaltravel.erp.dto.responses.DiemDanhResponse;
import com.digitaltravel.erp.dto.responses.HanhDongResponse;
import com.digitaltravel.erp.dto.responses.NhatKySuCoResponse;
import com.digitaltravel.erp.service.VanHanhService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class VanHanhController {

    private final VanHanhService vanHanhService;

    // ── UC42: Xem danh sách đoàn ─────────────────────────────────────────
    @GetMapping("/api/hdv/tour/{maTour}/doan")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'HDV')")
    public ResponseEntity<ApiResponse<List<DiemDanhResponse>>> danhSachDoan(
            @PathVariable String maTour) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.danhSachDoan(maTour)));
    }

    // ── UC43: Điểm danh khách ─────────────────────────────────────────────
    @PostMapping("/api/hdv/tour/{maTour}/diem-danh")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<DiemDanhResponse>> diemDanh(
            @PathVariable String maTour,
            @Valid @RequestBody DiemDanhRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        DiemDanhResponse resp = vanHanhService.diemDanh(maTour, request, user.getUsername());
        return ResponseEntity.status(201).body(ApiResponse.created(resp));
    }

    // ── UC44: Ghi nhận hành động xanh ────────────────────────────────────
    @PostMapping("/api/hdv/tour/{maTour}/hanh-dong-xanh")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<HanhDongResponse>> ghiNhanHanhDong(
            @PathVariable String maTour,
            @Valid @RequestBody GhiNhanHanhDongRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        HanhDongResponse resp = vanHanhService.ghiNhanHanhDong(maTour, request, user.getUsername());
        return ResponseEntity.status(201).body(ApiResponse.created(resp));
    }

    // ── UC45: Sự cố ───────────────────────────────────────────────────────
    @GetMapping("/api/hdv/tour/{maTour}/su-co")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'HDV')")
    public ResponseEntity<ApiResponse<List<NhatKySuCoResponse>>> danhSachSuCo(
            @PathVariable String maTour) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.danhSachSuCo(maTour)));
    }

    @PostMapping("/api/hdv/tour/{maTour}/su-co")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<NhatKySuCoResponse>> baoCaoSuCo(
            @PathVariable String maTour,
            @Valid @RequestBody BaoCaoSuCoRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        NhatKySuCoResponse resp = vanHanhService.baoCaoSuCo(maTour, request, user.getUsername());
        return ResponseEntity.status(201).body(ApiResponse.created(resp));
    }

    @PutMapping("/api/hdv/su-co/{maSuCo}")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<NhatKySuCoResponse>> capNhatSuCo(
            @PathVariable String maSuCo,
            @Valid @RequestBody BaoCaoSuCoRequest request) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.capNhatSuCo(maSuCo, request)));
    }

    // ── UC46: Chi phí phát sinh ───────────────────────────────────────────
    @PostMapping("/api/hdv/tour/{maTour}/chi-phi")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<ChiPhiThucTeResponse>> khaiChiPhi(
            @PathVariable String maTour,
            @Valid @RequestBody KhaiChiPhiRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        ChiPhiThucTeResponse resp = vanHanhService.khaiChiPhi(maTour, request, user.getUsername());
        return ResponseEntity.status(201).body(ApiResponse.created(resp));
    }

    @GetMapping("/api/hdv/tour/{maTour}/chi-phi")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'HDV')")
    public ResponseEntity<ApiResponse<List<ChiPhiThucTeResponse>>> chiPhiCuaTour(
            @PathVariable String maTour) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.chiPhiCuaTour(maTour)));
    }

    // ── Kế toán: DS chi phí chờ duyệt / duyệt / từ chối ─────────────────
    @GetMapping("/api/ketoan/chi-phi")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<Page<ChiPhiThucTeResponse>>> danhSachChiPhi(
            @RequestParam(required = false) String trangThai,
            Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.danhSachChiPhiChoXuLy(trangThai, pageable)));
    }

    @PutMapping("/api/ketoan/chi-phi/{maChiPhi}/duyet")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<ChiPhiThucTeResponse>> duyetChiPhi(
            @PathVariable String maChiPhi) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.duyetChiPhi(maChiPhi)));
    }

    @PutMapping("/api/ketoan/chi-phi/{maChiPhi}/tu-choi")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'KETOAN')")
    public ResponseEntity<ApiResponse<ChiPhiThucTeResponse>> tuChoiChiPhi(
            @PathVariable String maChiPhi) {
        return ResponseEntity.ok(ApiResponse.ok(vanHanhService.tuChoiChiPhi(maChiPhi)));
    }
}