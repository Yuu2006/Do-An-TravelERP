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
        ghiNhan(maTaiKhoan, hanhDong, null, null, ketQua, request);
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void ghiNhan(String maTaiKhoan, String hanhDong, String doiTuong, String maDoiTuong,
            String ketQua, HttpServletRequest request) {
        TaiKhoan taiKhoan = maTaiKhoan != null
                ? taiKhoanRepository.findById(maTaiKhoan).orElse(null)
                : null;
        NhatKyBaoMat log = new NhatKyBaoMat();
        log.setMaNhatKyBaoMat("NKBM_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        log.setTaiKhoan(taiKhoan);
        log.setHanhDong(hanhDong);
        log.setDoiTuong(doiTuong);
        log.setMaDoiTuong(maDoiTuong);
        log.setKetQua(ketQua);
        nhatKyBaoMatRepository.save(log);
    }

    public Page<NhatKyBaoMatResponse> timKiem(
            String maTaiKhoan,
            String hanhDong,
            String doiTuong,
            String maDoiTuong,
            String ketQua,
            LocalDateTime tuThoiGian,
            LocalDateTime denThoiGian,
            Pageable pageable) {
        return nhatKyBaoMatRepository
                .timKiem(maTaiKhoan, hanhDong, doiTuong, maDoiTuong, ketQua, tuThoiGian, denThoiGian, pageable)
                .map(this::toResponse);
    }

    private NhatKyBaoMatResponse toResponse(NhatKyBaoMat log) {
        TaiKhoan tk = log.getTaiKhoan();
        return NhatKyBaoMatResponse.builder()
                .maNhatKyBaoMat(log.getMaNhatKyBaoMat())
                .maTaiKhoan(tk != null ? tk.getMaTaiKhoan() : null)
                .tenDangNhap(tk != null ? tk.getTenDangNhap() : null)
                .hanhDong(log.getHanhDong())
                .doiTuong(log.getDoiTuong())
                .maDoiTuong(log.getMaDoiTuong())
                .ketQua(log.getKetQua())
                .thoiGian(log.getThoiGian())
                .build();
    }
}
