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
import com.digitaltravel.erp.repository.TaiKhoanRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KhachHangService {

    private final HoChieuSoRepository hoChieuSoRepository;
    private final LichSuTourRepository lichSuTourRepository;
    private final TaiKhoanRepository taiKhoanRepository;

    // ── Xem hồ sơ của bản thân ──────────────────────────────────────────────
    public HoChieuSoResponse layHoSo(String maTaiKhoan) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));
        return toResponse(hcs);
    }

    // ── Cập nhật hồ sơ khách hàng ───────────────────────────────────────────
    @Transactional
    public HoChieuSoResponse capNhatHoSo(String maTaiKhoan, CapNhatHoChieuSoRequest request) {
        HoChieuSo hcs = hoChieuSoRepository.findByMaTaiKhoan(maTaiKhoan)
                .orElseThrow(() -> AppException.notFound("Khong tim thay ho so khach hang"));

        if (request.getCccd() != null) {
            if (!request.getCccd().isBlank()
                    && taiKhoanRepository.existsByCccdAndMaTaiKhoanNot(request.getCccd(), hcs.getTaiKhoan().getMaTaiKhoan())) {
                throw AppException.badRequest("CCCD da duoc su dung");
            }
            hcs.getTaiKhoan().setCccd(request.getCccd());
        }
        if (request.getNgaySinh() != null) {
            hcs.getTaiKhoan().setNgaySinh(request.getNgaySinh());
        }
        if (request.getSoDienThoai() != null) {
            hcs.getTaiKhoan().setSoDienThoai(request.getSoDienThoai());
        }
        if (request.getDiUng() != null) {
            hcs.setDiUng(request.getDiUng());
        }
        if (request.getGhiChuYTe() != null) {
            hcs.setGhiChuYTe(request.getGhiChuYTe());
        }
        if (request.getTenDangNhap() != null) {
            hcs.getTaiKhoan().setTenDangNhap(request.getTenDangNhap());
        }
        if (request.getEmail() != null) {
            hcs.getTaiKhoan().setEmail(request.getEmail());
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
                .cccd(hcs.getTaiKhoan().getCccd())
                .ngaySinh(hcs.getTaiKhoan().getNgaySinh())
                .soDienThoai(hcs.getTaiKhoan().getSoDienThoai())
                .diUng(hcs.getDiUng())
                .ghiChuYTe(hcs.getGhiChuYTe())
                .hangThanhVien(hcs.getHangThanhVien())
                .diemXanh(hcs.getDiemXanh())
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
                .build();
    }
}
