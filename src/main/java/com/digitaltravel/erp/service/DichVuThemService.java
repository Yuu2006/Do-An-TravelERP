package com.digitaltravel.erp.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.DichVuThemRequest;
import com.digitaltravel.erp.dto.responses.DichVuThemResponse;
import com.digitaltravel.erp.entity.DichVuThem;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.DichVuThemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DichVuThemService {

    private final DichVuThemRepository dichVuThemRepository;

    public List<DichVuThemResponse> danhSach() {
        return dichVuThemRepository.findAll().stream()
                .map(this::toResponse)
                .toList();
    }

    public DichVuThemResponse chiTiet(String id) {
        DichVuThem dv = dichVuThemRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay dich vu: " + id));
        return toResponse(dv);
    }

    @Transactional
    public DichVuThemResponse taoMoi(DichVuThemRequest request) {
        DichVuThem dv = new DichVuThem();
        dv.setMaDichVuThem("DV_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        dv.setTen(request.getTen());
        dv.setDonViTinh(request.getDonViTinh());
        dv.setDonGia(request.getDonGia());
        dv.setTrangThai(request.getTrangThai() != null ? request.getTrangThai() : "HOAT_DONG");
        dichVuThemRepository.save(dv);
        return toResponse(dv);
    }

    @Transactional
    public DichVuThemResponse capNhat(String id, DichVuThemRequest request) {
        DichVuThem dv = dichVuThemRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay dich vu: " + id));

        if (request.getTen() != null) dv.setTen(request.getTen());
        if (request.getDonViTinh() != null) dv.setDonViTinh(request.getDonViTinh());
        if (request.getDonGia() != null) dv.setDonGia(request.getDonGia());
        if (request.getTrangThai() != null) {
            if (!"HOAT_DONG".equals(request.getTrangThai()) && !"KHOA".equals(request.getTrangThai())) {
                throw AppException.badRequest("Trang thai khong hop le. Chi chap nhan: HOAT_DONG, KHOA");
            }
            dv.setTrangThai(request.getTrangThai());
        }
        dichVuThemRepository.save(dv);
        return toResponse(dv);
    }

    @Transactional
    public void xoa(String id) {
        DichVuThem dv = dichVuThemRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay dich vu: " + id));
        dv.setTrangThai("KHOA");
        dichVuThemRepository.save(dv);
    }

    private DichVuThemResponse toResponse(DichVuThem dv) {
        return DichVuThemResponse.builder()
                .maDichVuThem(dv.getMaDichVuThem())
                .ten(dv.getTen())
                .donViTinh(dv.getDonViTinh())
                .donGia(dv.getDonGia())
                .trangThai(dv.getTrangThai())
                .build();
    }
}
