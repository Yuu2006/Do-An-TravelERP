package com.digitaltravel.erp.service;

import java.util.Locale;
import java.util.Set;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.ThamSoHeThongRequest;
import com.digitaltravel.erp.dto.responses.ThamSoHeThongResponse;
import com.digitaltravel.erp.entity.ThamSoHeThong;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.ThamSoHeThongRepository;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ThamSoHeThongService {

    private static final Set<String> KIEU_DU_LIEU_HOP_LE = Set.of("STRING", "NUMBER", "BOOLEAN", "JSON");

    private final ThamSoHeThongRepository thamSoHeThongRepository;
    private final NhatKyBaoMatService nhatKyBaoMatService;

    public Page<ThamSoHeThongResponse> timKiem(String tuKhoa, String trangThai, Pageable pageable) {
        return thamSoHeThongRepository.timKiem(tuKhoa, trangThai, pageable)
                .map(this::toResponse);
    }

    public ThamSoHeThongResponse chiTiet(String maThamSo) {
        return toResponse(timTheoId(maThamSo));
    }

    @Transactional
    public ThamSoHeThongResponse taoMoi(
            ThamSoHeThongRequest request,
            String nguoiThucHien,
            HttpServletRequest httpRequest) {
        String tenThamSo = request.getTenThamSo().trim().toUpperCase(Locale.ROOT);
        if (thamSoHeThongRepository.existsByTenThamSo(tenThamSo)) {
            throw AppException.badRequest("Ten tham so da ton tai");
        }
        ThamSoHeThong ts = new ThamSoHeThong();
        ts.setMaThamSo("TS_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        ts.setTenThamSo(tenThamSo);
        ganDuLieu(ts, request);
        ts.setTrangThai("HOAT_DONG");
        ts.setTaoBoi(nguoiThucHien);
        thamSoHeThongRepository.save(ts);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "TAO_THAM_SO", NhatKyBaoMatService.THANH_CONG,
                "Tao tham so " + ts.getTenThamSo(), httpRequest);
        return toResponse(ts);
    }

    @Transactional
    public ThamSoHeThongResponse capNhat(
            String maThamSo,
            ThamSoHeThongRequest request,
            String nguoiThucHien,
            HttpServletRequest httpRequest) {
        ThamSoHeThong ts = timTheoId(maThamSo);
        String tenThamSo = request.getTenThamSo().trim().toUpperCase(Locale.ROOT);
        thamSoHeThongRepository.findByTenThamSo(tenThamSo)
                .filter(existing -> !existing.getMaThamSo().equals(maThamSo))
                .ifPresent(existing -> {
                    throw AppException.badRequest("Ten tham so da ton tai");
                });
        ts.setTenThamSo(tenThamSo);
        ganDuLieu(ts, request);
        ts.setCapNhatBoi(nguoiThucHien);
        thamSoHeThongRepository.save(ts);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "SUA_THAM_SO", NhatKyBaoMatService.THANH_CONG,
                "Sua tham so " + ts.getTenThamSo(), httpRequest);
        return toResponse(ts);
    }

    @Transactional
    public void khoa(String maThamSo, String nguoiThucHien, HttpServletRequest httpRequest) {
        ThamSoHeThong ts = timTheoId(maThamSo);
        ts.setTrangThai("KHOA");
        ts.setCapNhatBoi(nguoiThucHien);
        thamSoHeThongRepository.save(ts);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "KHOA_THAM_SO", NhatKyBaoMatService.THANH_CONG,
                "Khoa tham so " + ts.getTenThamSo(), httpRequest);
    }

    @Transactional
    public void moKhoa(String maThamSo, String nguoiThucHien, HttpServletRequest httpRequest) {
        ThamSoHeThong ts = timTheoId(maThamSo);
        ts.setTrangThai("HOAT_DONG");
        ts.setCapNhatBoi(nguoiThucHien);
        thamSoHeThongRepository.save(ts);
        nhatKyBaoMatService.ghiNhan(nguoiThucHien, "MO_KHOA_THAM_SO", NhatKyBaoMatService.THANH_CONG,
                "Mo khoa tham so " + ts.getTenThamSo(), httpRequest);
    }

    private ThamSoHeThong timTheoId(String maThamSo) {
        return thamSoHeThongRepository.findById(maThamSo)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tham so: " + maThamSo));
    }

    private void ganDuLieu(ThamSoHeThong ts, ThamSoHeThongRequest request) {
        String kieuDuLieu = request.getKieuDuLieu().trim().toUpperCase(Locale.ROOT);
        if (!KIEU_DU_LIEU_HOP_LE.contains(kieuDuLieu)) {
            throw AppException.badRequest("Kieu du lieu khong hop le. Chi chap nhan: STRING, NUMBER, BOOLEAN, JSON");
        }
        ts.setGiaTri(request.getGiaTri());
        ts.setKieuDuLieu(kieuDuLieu);
        ts.setMoTa(request.getMoTa());
    }

    private ThamSoHeThongResponse toResponse(ThamSoHeThong ts) {
        return ThamSoHeThongResponse.builder()
                .maThamSo(ts.getMaThamSo())
                .tenThamSo(ts.getTenThamSo())
                .giaTri(ts.getGiaTri())
                .kieuDuLieu(ts.getKieuDuLieu())
                .moTa(ts.getMoTa())
                .trangThai(ts.getTrangThai())
                .thoiDiemTao(ts.getThoiDiemTao())
                .capNhatVao(ts.getCapNhatVao())
                .build();
    }
}
