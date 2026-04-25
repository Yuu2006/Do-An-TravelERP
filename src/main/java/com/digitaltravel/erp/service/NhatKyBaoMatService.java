package com.digitaltravel.erp.service;

import java.time.LocalDateTime;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.responses.NhatKyBaoMatResponse;
import com.digitaltravel.erp.entity.NhatKyBaoMat;
import com.digitaltravel.erp.entity.TaiKhoan;
import com.digitaltravel.erp.repository.NhatKyBaoMatRepository;
import com.digitaltravel.erp.repository.TaiKhoanRepository;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NhatKyBaoMatService {

    public static final String THANH_CONG = "THANH_CONG";
    public static final String THAT_BAI = "THAT_BAI";

    private final NhatKyBaoMatRepository nhatKyBaoMatRepository;
    private final TaiKhoanRepository taiKhoanRepository;

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ghiNhan(String maTaiKhoan, String hanhDong, String ketQua, String noiDung, HttpServletRequest request) {
        TaiKhoan taiKhoan = maTaiKhoan != null
                ? taiKhoanRepository.findById(maTaiKhoan).orElse(null)
                : null;
        NhatKyBaoMat log = new NhatKyBaoMat();
        log.setMaNhatKyBaoMat("NKBM_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        log.setTaiKhoan(taiKhoan);
        log.setHanhDong(hanhDong);
        log.setKetQua(ketQua);
        log.setNoiDung(noiDung);
        log.setDiaChiIp(layDiaChiIp(request));
        log.setUserAgent(request != null ? request.getHeader("User-Agent") : null);
        nhatKyBaoMatRepository.save(log);
    }

    public Page<NhatKyBaoMatResponse> timKiem(
            String maTaiKhoan,
            String hanhDong,
            String ketQua,
            LocalDateTime tuThoiDiem,
            LocalDateTime denThoiDiem,
            Pageable pageable) {
        return nhatKyBaoMatRepository
                .timKiem(maTaiKhoan, hanhDong, ketQua, tuThoiDiem, denThoiDiem, pageable)
                .map(this::toResponse);
    }

    private String layDiaChiIp(HttpServletRequest request) {
        if (request == null) {
            return null;
        }
        String forwardedFor = request.getHeader("X-Forwarded-For");
        if (forwardedFor != null && !forwardedFor.isBlank()) {
            return forwardedFor.split(",")[0].trim();
        }
        return request.getRemoteAddr();
    }

    private NhatKyBaoMatResponse toResponse(NhatKyBaoMat log) {
        TaiKhoan tk = log.getTaiKhoan();
        return NhatKyBaoMatResponse.builder()
                .maNhatKyBaoMat(log.getMaNhatKyBaoMat())
                .maTaiKhoan(tk != null ? tk.getMaTaiKhoan() : null)
                .tenDangNhap(tk != null ? tk.getTenDangNhap() : null)
                .hanhDong(log.getHanhDong())
                .diaChiIp(log.getDiaChiIp())
                .userAgent(log.getUserAgent())
                .ketQua(log.getKetQua())
                .noiDung(log.getNoiDung())
                .thoiDiemTao(log.getThoiDiemTao())
                .build();
    }
}
