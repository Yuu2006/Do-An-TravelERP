package com.digitaltravel.erp.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.LoaiPhongRequest;
import com.digitaltravel.erp.dto.responses.LoaiPhongResponse;
import com.digitaltravel.erp.entity.LoaiPhong;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.LoaiPhongRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoaiPhongService {

    private final LoaiPhongRepository loaiPhongRepository;

    public List<LoaiPhongResponse> danhSach() {
        return loaiPhongRepository.findAll().stream()
                .map(this::toResponse)
                .toList();
    }

    public LoaiPhongResponse chiTiet(String id) {
        LoaiPhong lp = loaiPhongRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay loai phong: " + id));
        return toResponse(lp);
    }

    @Transactional
    public LoaiPhongResponse taoMoi(LoaiPhongRequest request) {
        LoaiPhong lp = new LoaiPhong();
        lp.setMaLoaiPhong("LP_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        lp.setTenLoai(request.getTenLoai());
        lp.setMucPhuThu(request.getMucPhuThu() != null ? request.getMucPhuThu() : BigDecimal.ZERO);
        lp.setTrangThai(request.getTrangThai() != null ? request.getTrangThai() : "HOAT_DONG");
        loaiPhongRepository.save(lp);
        return toResponse(lp);
    }

    @Transactional
    public LoaiPhongResponse capNhat(String id, LoaiPhongRequest request) {
        LoaiPhong lp = loaiPhongRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay loai phong: " + id));

        if (request.getTenLoai() != null) lp.setTenLoai(request.getTenLoai());
        if (request.getMucPhuThu() != null) lp.setMucPhuThu(request.getMucPhuThu());
        if (request.getTrangThai() != null) {
            if (!"HOAT_DONG".equals(request.getTrangThai()) && !"KHOA".equals(request.getTrangThai())) {
                throw AppException.badRequest("Trang thai khong hop le. Chi chap nhan: HOAT_DONG, KHOA");
            }
            lp.setTrangThai(request.getTrangThai());
        }
        loaiPhongRepository.save(lp);
        return toResponse(lp);
    }

    @Transactional
    public void xoa(String id) {
        LoaiPhong lp = loaiPhongRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay loai phong: " + id));
        lp.setTrangThai("KHOA");
        loaiPhongRepository.save(lp);
    }

    private LoaiPhongResponse toResponse(LoaiPhong lp) {
        return LoaiPhongResponse.builder()
                .maLoaiPhong(lp.getMaLoaiPhong())
                .tenLoai(lp.getTenLoai())
                .mucPhuThu(lp.getMucPhuThu())
                .trangThai(lp.getTrangThai())
                .build();
    }
}
