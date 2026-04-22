package com.digitaltravel.erp.controller;

import java.util.List;

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
import com.digitaltravel.erp.dto.requests.GanVaiTroRequest;
import com.digitaltravel.erp.dto.requests.NangLucRequest;
import com.digitaltravel.erp.dto.requests.XuLyHoTroRequest;
import com.digitaltravel.erp.dto.requests.XuLyYeuCauRequest;
import com.digitaltravel.erp.dto.responses.ApiResponse;
import com.digitaltravel.erp.dto.responses.DonDatTourResponse;
import com.digitaltravel.erp.dto.responses.HoChieuSoResponse;
import com.digitaltravel.erp.dto.responses.NangLucResponse;
import com.digitaltravel.erp.dto.responses.NhanVienResponse;
import com.digitaltravel.erp.dto.responses.PhanCongResponse;
import com.digitaltravel.erp.dto.responses.YeuCauHoTroResponse;
import com.digitaltravel.erp.service.DatTourService;
import com.digitaltravel.erp.service.HuyTourService;
import com.digitaltravel.erp.service.NangLucService;
import com.digitaltravel.erp.service.NhanVienService;
import com.digitaltravel.erp.service.PhanCongTourService;
import com.digitaltravel.erp.service.YeuCauHoTroService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NhanVienController {

    private final NhanVienService nhanVienService;
    private final HuyTourService huyTourService;
    private final PhanCongTourService phanCongTourService;
    private final DatTourService datTourService;
    private final YeuCauHoTroService yeuCauHoTroService;
    private final NangLucService nangLucService;

    // ──────────────── QUẢN LÝ NHÂN VIÊN (ADMIN/MANAGER) ──────────────────

    /**
     * UC68 — Danh sách nhân viên (filter + phân trang)
     */
    @GetMapping("/api/admin/nhan-vien")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<Page<NhanVienResponse>>> danhSachNhanVien(
            @RequestParam(required = false) String hoTen,
            @RequestParam(required = false) String maVaiTro,
            @RequestParam(required = false) String trangThai,
            @PageableDefault(size = 10, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                nhanVienService.timKiem(hoTen, maVaiTro, trangThai, pageable)));
    }

    /**
     * UC68 — Chi tiết nhân viên
     */
    @GetMapping("/api/admin/nhan-vien/{maNhanVien}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<NhanVienResponse>> chiTietNhanVien(
            @PathVariable String maNhanVien) {
        return ResponseEntity.ok(ApiResponse.ok(nhanVienService.chiTiet(maNhanVien)));
    }

    /**
     * UC66 — Khóa tài khoản nhân viên
     */
    @PutMapping("/api/admin/nhan-vien/{maNhanVien}/khoa")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> khoaTaiKhoan(
            @PathVariable String maNhanVien,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        nhanVienService.khoaTaiKhoan(maNhanVien, user.getTaiKhoan().getMaTaiKhoan());
        return ResponseEntity.ok(ApiResponse.noContent("Khoa tai khoan nhan vien thanh cong"));
    }

    /**
     * UC67 — Mở khóa tài khoản nhân viên
     */
    @PutMapping("/api/admin/nhan-vien/{maNhanVien}/mo-khoa")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> moKhoaTaiKhoan(
            @PathVariable String maNhanVien) {
        nhanVienService.moKhoaTaiKhoan(maNhanVien);
        return ResponseEntity.ok(ApiResponse.noContent("Mo khoa tai khoan nhan vien thanh cong"));
    }

    // ──────────────── XỬ LÝ YÊU CẦU HỦY TOUR (SALES/MANAGER) ───────────

    /**
     * UC33 — Danh sách yêu cầu hủy/hoàn tiền
     */
    @GetMapping("/api/sales/yeu-cau-huy")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<Page<YeuCauHoTroResponse>>> danhSachYeuCau(
            @RequestParam(required = false) String loaiYeuCau,
            @RequestParam(required = false) String trangThai,
            @PageableDefault(size = 10, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                huyTourService.danhSachYeuCau(loaiYeuCau, trangThai, pageable)));
    }

    /**
     * UC33 — SALES duyệt yêu cầu hủy tour
     */
    @PostMapping("/api/sales/yeu-cau-huy/{maYeuCau}/duyet")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<YeuCauHoTroResponse>> duyetHuyTour(
            @PathVariable String maYeuCau,
            @AuthenticationPrincipal TaiKhoanDetails user,
            @Valid @RequestBody(required = false) XuLyYeuCauRequest request) {
        String maNhanVien = user.getTaiKhoan().getMaTaiKhoan();
        YeuCauHoTroResponse result = huyTourService.duyetHuyTour(
                maYeuCau, maNhanVien, request != null ? request : new XuLyYeuCauRequest());
        return ResponseEntity.ok(ApiResponse.ok("Duyet huy tour thanh cong", result));
    }

    /**
     * UC33 — SALES từ chối yêu cầu hủy tour
     */
    @PostMapping("/api/sales/yeu-cau-huy/{maYeuCau}/tu-choi")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<YeuCauHoTroResponse>> tuChoiHuyTour(
            @PathVariable String maYeuCau,
            @AuthenticationPrincipal TaiKhoanDetails user,
            @Valid @RequestBody(required = false) XuLyYeuCauRequest request) {
        String maNhanVien = user.getTaiKhoan().getMaTaiKhoan();
        YeuCauHoTroResponse result = huyTourService.tuChoiHuyTour(
                maYeuCau, maNhanVien, request != null ? request : new XuLyYeuCauRequest());
        return ResponseEntity.ok(ApiResponse.ok("Tu choi yeu cau huy tour thanh cong", result));
    }

    // ──────────────── HDV: XEM TOUR ĐƯỢC GIAO ────────────────────────────

    /**
     * HDV xem danh sách tour được phân công
     */
    @GetMapping("/api/hdv/tour-cua-toi")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<List<PhanCongResponse>>> tourCuaToi(
            @AuthenticationPrincipal TaiKhoanDetails user) {
        String maTaiKhoan = user.getTaiKhoan().getMaTaiKhoan();
        return ResponseEntity.ok(ApiResponse.ok(phanCongTourService.tourCuaToi(maTaiKhoan)));
    }

    // ──────────────── UC39: HDV xem lịch công tác ─────────────────────────

    @GetMapping("/api/hdv/lich-cong-tac")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'HDV')")
    public ResponseEntity<ApiResponse<List<PhanCongResponse>>> lichCongTac(
            @AuthenticationPrincipal TaiKhoanDetails user) {
        String maTaiKhoan = user.getTaiKhoan().getMaTaiKhoan();
        return ResponseEntity.ok(ApiResponse.ok(phanCongTourService.tourCuaToi(maTaiKhoan)));
    }

    // ──────────────── UC24: Tìm kiếm khách hàng ──────────────────────────

    @GetMapping("/api/admin/khach-hang")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<Page<HoChieuSoResponse>>> timKiemKhachHang(
            @RequestParam(required = false) String hoTen,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String soDienThoai,
            @PageableDefault(size = 10) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                nhanVienService.timKiemKhachHang(hoTen, email, soDienThoai, pageable)));
    }

    @GetMapping("/api/admin/khach-hang/{maKhachHang}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<HoChieuSoResponse>> chiTietKhachHang(
            @PathVariable String maKhachHang) {
        return ResponseEntity.ok(ApiResponse.ok(nhanVienService.chiTietKhachHang(maKhachHang)));
    }

    // ──────────────── UC34: SALES xem đơn đặt tour ───────────────────────

    @GetMapping("/api/sales/don-dat-tour")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<Page<DonDatTourResponse>>> danhSachDonDatTour(
            @RequestParam(required = false) String trangThai,
            @RequestParam(required = false) String maTourThucTe,
            @PageableDefault(size = 10, sort = "ThoiDiemTao", direction = Sort.Direction.DESC) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(datTourService.danhSachTatCa(trangThai, maTourThucTe, pageable)));
    }

    // ──────────────── UC41: SALES xử lý yêu cầu hỗ trợ / khiếu nại ─────────

    @GetMapping("/api/sales/yeu-cau-ho-tro")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<Page<YeuCauHoTroResponse>>> danhSachYeuCauHoTro(
            @RequestParam(required = false) String loaiYeuCau,
            @RequestParam(required = false) String trangThai,
            @PageableDefault(size = 10) Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.ok(
                yeuCauHoTroService.danhSachTatCa(loaiYeuCau, trangThai, pageable)));
    }

    @PutMapping("/api/sales/yeu-cau-ho-tro/{maYeuCau}")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER', 'SALES')")
    public ResponseEntity<ApiResponse<YeuCauHoTroResponse>> xuLyYeuCauHoTro(
            @PathVariable String maYeuCau,
            @Valid @RequestBody XuLyHoTroRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Cap nhat yeu cau thanh cong",
                yeuCauHoTroService.xuLy(maYeuCau, request, user.getTaiKhoan().getMaTaiKhoan())));
    }

    // ──────────────── UC63: Năng lực HDV ─────────────────────────────────

    @GetMapping("/api/hdv/nang-luc")
    @PreAuthorize("hasAnyRole('ADMIN', 'HDV')")
    public ResponseEntity<ApiResponse<NangLucResponse>> nangLucCuaToi(
            @AuthenticationPrincipal TaiKhoanDetails user) {
        String maTaiKhoan = user.getTaiKhoan().getMaTaiKhoan();
        // Cần lấy maNhanVien từ taiKhoan
        com.digitaltravel.erp.entity.NhanVien nv = nhanVienService.findNhanVienByTaiKhoan(maTaiKhoan);
        return ResponseEntity.ok(ApiResponse.ok(nangLucService.layNangLuc(nv.getMaNhanVien())));
    }

    @GetMapping("/api/admin/nhan-vien/{maNhanVien}/nang-luc")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<NangLucResponse>> nangLucNhanVien(
            @PathVariable String maNhanVien) {
        return ResponseEntity.ok(ApiResponse.ok(nangLucService.layNangLuc(maNhanVien)));
    }

    @PutMapping("/api/admin/nhan-vien/{maNhanVien}/nang-luc")
    @PreAuthorize("hasAnyRole('ADMIN', 'MANAGER')")
    public ResponseEntity<ApiResponse<NangLucResponse>> capNhatNangLuc(
            @PathVariable String maNhanVien,
            @Valid @RequestBody NangLucRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Cap nhat nang luc thanh cong",
                nangLucService.capNhatNangLuc(maNhanVien, request, user.getUsername())));
    }

    // ──────────────── UC69: Gán vai trò ──────────────────────────────────

    @PutMapping("/api/admin/nhan-vien/{maNhanVien}/vai-tro")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<NhanVienResponse>> ganVaiTro(
            @PathVariable String maNhanVien,
            @Valid @RequestBody GanVaiTroRequest request,
            @AuthenticationPrincipal TaiKhoanDetails user) {
        return ResponseEntity.ok(ApiResponse.ok("Gan vai tro thanh cong",
                nhanVienService.ganVaiTro(maNhanVien, request, user.getUsername())));
    }
}
