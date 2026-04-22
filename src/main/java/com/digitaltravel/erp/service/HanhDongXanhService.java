package com.digitaltravel.erp.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.HanhDongXanhRequest;
import com.digitaltravel.erp.dto.responses.HanhDongXanhResponse;
import com.digitaltravel.erp.entity.HanhDongXanh;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.HanhDongXanhRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HanhDongXanhService {

    private final HanhDongXanhRepository hanhDongXanhRepository;

    public List<HanhDongXanhResponse> danhSach() {
        return hanhDongXanhRepository.findAll().stream()
                .map(this::toResponse)
                .toList();
    }

    public HanhDongXanhResponse chiTiet(String id) {
        HanhDongXanh hdx = hanhDongXanhRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + id));
        return toResponse(hdx);
    }

    @Transactional
    public HanhDongXanhResponse taoMoi(HanhDongXanhRequest request) {
        HanhDongXanh hdx = new HanhDongXanh();
        hdx.setMaHanhDongXanh("HDX_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        hdx.setTenHanhDong(request.getTenHanhDong());
        hdx.setDiemCong(request.getDiemCong());
        hdx.setTrangThai(request.getTrangThai() != null ? request.getTrangThai() : "HOAT_DONG");
        hanhDongXanhRepository.save(hdx);
        return toResponse(hdx);
    }

    @Transactional
    public HanhDongXanhResponse capNhat(String id, HanhDongXanhRequest request) {
        HanhDongXanh hdx = hanhDongXanhRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + id));

        if (request.getTenHanhDong() != null) hdx.setTenHanhDong(request.getTenHanhDong());
        if (request.getDiemCong() != null) hdx.setDiemCong(request.getDiemCong());
        if (request.getTrangThai() != null) {
            if (!"HOAT_DONG".equals(request.getTrangThai()) && !"KHOA".equals(request.getTrangThai())) {
                throw AppException.badRequest("Trang thai khong hop le. Chi chap nhan: HOAT_DONG, KHOA");
            }
            hdx.setTrangThai(request.getTrangThai());
        }
        hanhDongXanhRepository.save(hdx);
        return toResponse(hdx);
    }

    @Transactional
    public void xoa(String id) {
        HanhDongXanh hdx = hanhDongXanhRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + id));
        hdx.setTrangThai("KHOA");
        hanhDongXanhRepository.save(hdx);
    }

    private HanhDongXanhResponse toResponse(HanhDongXanh hdx) {
        return HanhDongXanhResponse.builder()
                .maHanhDongXanh(hdx.getMaHanhDongXanh())
                .tenHanhDong(hdx.getTenHanhDong())
                .diemCong(hdx.getDiemCong())
                .trangThai(hdx.getTrangThai())
                .build();
    }
}
