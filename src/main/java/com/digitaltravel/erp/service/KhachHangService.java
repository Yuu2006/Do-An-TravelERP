package com.digitaltravel.erp.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.CapNhatHoChieuSoRequest;
import com.digitaltravel.erp.dto.responses.HoChieuSoResponse;
import com.digitaltravel.erp.dto.responses.LichSuTourResponse;
import com.digitaltravel.erp.entity.HoChieuSo;
import com.digitaltravel.erp.entity.LichSuTour;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.HoChieuSoRepository;
import com.digitaltravel.erp.repository.LichSuTourRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KhachHangService {

    private final HoChieuSoRepository hoChieuSoRepository;
    private final LichSuTourRepository lichSuTourRepository;

    // ── Xem hồ sơ của bản thân ──────────────────────────────────────────────
    public HoChieuSoResponse layHoSo(String maTaiKhoan) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));
        return toResponse(hcs);
    }

    // ── Cập nhật hồ sơ (chỉ DiUng và GhiChuYTe) ────────────────────────────
    @Transactional
    public HoChieuSoResponse capNhatHoSo(String maTaiKhoan, CapNhatHoChieuSoRequest request) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        if (request.getDiUng() != null) {
            hcs.setDiUng(request.getDiUng());
        }
        if (request.getGhiChuYTe() != null) {
            hcs.setGhiChuYTe(request.getGhiChuYTe());
        }
        hoChieuSoRepository.save(hcs);
        return toResponse(hcs);
    }

    // ── UC22: Lịch sử tour đã tham gia ──────────────────────────────────────
    public Page<LichSuTourResponse> lichSuTour(String maTaiKhoan, Pageable pageable) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));
        return lichSuTourRepository.findByMaKhachHang(hcs.getMaKhachHang(), pageable)
                .map(this::tolichSuTourResponse);
    }

    // ── Mapper ────────────────────────────────────────────────────────────────
    public HoChieuSoResponse toResponse(HoChieuSo hcs) {
        return HoChieuSoResponse.builder()
                .maKhachHang(hcs.getMaKhachHang())
                .maTaiKhoan(hcs.getTaiKhoan().getMaTaiKhoan())
                .tenDangNhap(hcs.getTaiKhoan().getTenDangNhap())
                .hoTen(hcs.getTaiKhoan().getHoTen())
                .email(hcs.getTaiKhoan().getEmail())
                .soDienThoai(hcs.getTaiKhoan().getSoDienThoai())
                .diUng(hcs.getDiUng())
                .ghiChuYTe(hcs.getGhiChuYTe())
                .hangThanhVien(hcs.getHangThanhVien())
                .diemXanh(hcs.getDiemXanh())
                .thoiDiemTao(hcs.getThoiDiemTao())
                .capNhatVao(hcs.getCapNhatVao())
                .build();
    }

    private LichSuTourResponse tolichSuTourResponse(LichSuTour ls) {
        return LichSuTourResponse.builder()
                .maLichSuTour(ls.getMaLichSuTour())
                .maTourThucTe(ls.getTourThucTe().getMaTourThucTe())
                .tieuDeTour(ls.getTourThucTe().getTourMau().getTieuDe())
                .ngayKhoiHanh(ls.getTourThucTe().getNgayKhoiHanh())
                .thoiLuong(ls.getTourThucTe().getTourMau().getThoiLuong())
                .ngayThamGia(ls.getNgayThamGia())
                .thoiDiemTao(ls.getThoiDiemTao())
                .build();
    }
}
