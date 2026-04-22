package com.digitaltravel.erp.service;

import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.XuLyHoTroRequest;
import com.digitaltravel.erp.dto.requests.YeuCauHoTroRequest;
import com.digitaltravel.erp.dto.responses.YeuCauHoTroResponse;
import com.digitaltravel.erp.entity.DonDatTour;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.NhanVien;
import com.digitaltravel.erp.entity.YeuCauHoTro;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DonDatTourRepository;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.NhanVienRepository;
import com.digitaltravel.erp.repository.YeuCauHoTroRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class YeuCauHoTroService {

    private final YeuCauHoTroRepository yeuCauHoTroRepository;
    private final HoChieuSoRepository hoChieuSoRepository;
    private final DonDatTourRepository donDatTourRepository;
    private final NhanVienRepository nhanVienRepository;

    // ── UC36: KH tạo yêu cầu hỗ trợ / khiếu nại ────────────────────────────
    @Transactional
    public YeuCauHoTroResponse taoYeuCau(String maTaiKhoan, YeuCauHoTroRequest request) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        YeuCauHoTro yc = new YeuCauHoTro();
        yc.setMaYeuCauHoTro("YCHTR_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        yc.setKhachHang(hcs);
        yc.setLoaiYeuCau(request.getLoaiYeuCau());
        yc.setNoiDung(request.getNoiDung());
        yc.setTrangThai("MOI_TAO");

        // Gắn với đơn đặt tour nếu có
        if (request.getMaDatTour() != null && !request.getMaDatTour().isBlank()) {
            DonDatTour don = donDatTourRepository.findByIdAndMaKhachHang(request.getMaDatTour(), hcs.getMaKhachHang())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay don dat tour: " + request.getMaDatTour()));
            yc.setDonDatTour(don);
        }

        yeuCauHoTroRepository.save(yc);
        return toResponse(yc);
    }

    // ── UC36: KH xem danh sách yêu cầu của mình ─────────────────────────────
    public Page<YeuCauHoTroResponse> danhSachCuaKhachHang(String maTaiKhoan, String loaiYeuCau, Pageable pageable) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));
        // Dùng lại query có sẵn, filter thêm theo khách hàng
        return yeuCauHoTroRepository.timKiemTheoKhachHang(hcs.getMaKhachHang(), loaiYeuCau, pageable)
                .map(this::toResponse);
    }

    // ── UC41: SALES xem tất cả yêu cầu ──────────────────────────────────────
    public Page<YeuCauHoTroResponse> danhSachTatCa(String loaiYeuCau, String trangThai, Pageable pageable) {
        return yeuCauHoTroRepository.timKiem(loaiYeuCau, trangThai, pageable)
                .map(this::toResponse);
    }

    // ── UC41: SALES tiếp nhận xử lý ──────────────────────────────────────────
    @Transactional
    public YeuCauHoTroResponse xuLy(String maYeuCau, XuLyHoTroRequest request, String maTaiKhoanXuLy) {
        YeuCauHoTro yc = yeuCauHoTroRepository.findById(maYeuCau)
                .orElseThrow(() -> AppException.notFound("Khong tim thay yeu cau: " + maYeuCau));

        if ("DA_DONG".equals(yc.getTrangThai())) {
            throw AppException.badRequest("Yeu cau nay da dong, khong the cap nhat");
        }

        String trangThaiMoi = request.getTrangThai();
        if (!"DANG_XU_LY".equals(trangThaiMoi) && !"DA_DONG".equals(trangThaiMoi)) {
            throw AppException.badRequest("TrangThai khong hop le. Chi chap nhan: DANG_XU_LY, DA_DONG");
        }
        yc.setTrangThai(trangThaiMoi);

        // Gán nhân viên xử lý nếu có
        if (request.getMaNhanVienXuLy() != null && !request.getMaNhanVienXuLy().isBlank()) {
            NhanVien nv = nhanVienRepository.findById(request.getMaNhanVienXuLy())
                    .orElseThrow(() -> AppException.notFound("Khong tim thay nhan vien: " + request.getMaNhanVienXuLy()));
            yc.setNhanVienXuLy(nv);
        }

        yeuCauHoTroRepository.save(yc);
        return toResponse(yc);
    }

    // ── Chi tiết yêu cầu ─────────────────────────────────────────────────────
    public YeuCauHoTroResponse chiTiet(String maYeuCau) {
        YeuCauHoTro yc = yeuCauHoTroRepository.findById(maYeuCau)
                .orElseThrow(() -> AppException.notFound("Khong tim thay yeu cau: " + maYeuCau));
        return toResponse(yc);
    }

    // ── Mapper ───────────────────────────────────────────────────────────────
    public YeuCauHoTroResponse toResponse(YeuCauHoTro yc) {
        return YeuCauHoTroResponse.builder()
                .maYeuCauHoTro(yc.getMaYeuCauHoTro())
                .maDatTour(yc.getDonDatTour() != null ? yc.getDonDatTour().getMaDatTour() : null)
                .maKhachHang(yc.getKhachHang().getMaKhachHang())
                .hoTenKhachHang(yc.getKhachHang().getTaiKhoan().getHoTen())
                .loaiYeuCau(yc.getLoaiYeuCau())
                .noiDung(yc.getNoiDung())
                .trangThai(yc.getTrangThai())
                .maNhanVienXuLy(yc.getNhanVienXuLy() != null ? yc.getNhanVienXuLy().getMaNhanVien() : null)
                .thoiDiemTao(yc.getThoiDiemTao())
                .capNhatVao(yc.getCapNhatVao())
                .build();
    }
}
