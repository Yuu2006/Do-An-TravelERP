package com.digitaltravel.erp.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.digitaltravel.erp.dto.requests.HanhDongXanhRequest;
import com.digitaltravel.erp.dto.responses.HanhDongXanhResponse;
import com.digitaltravel.erp.entity.HanhDongXanh;
import com.digitaltravel.erp.entity.TourThucTe;
import com.digitaltravel.erp.exception.AppException;
import com.digitaltravel.erp.repository.HanhDongXanhRepository;
import com.digitaltravel.erp.repository.TourThucTeRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HanhDongXanhService {

    private final HanhDongXanhRepository hanhDongXanhRepository;
    private final TourThucTeRepository tourThucTeRepository;

    public List<HanhDongXanhResponse> danhSach(String maTourThucTe) {
        List<HanhDongXanh> dsHanhDong = maTourThucTe == null || maTourThucTe.isBlank()
                ? hanhDongXanhRepository.findAll()
                : hanhDongXanhRepository.findAvailableForTour(maTourThucTe);
        return dsHanhDong.stream()
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
        hdx.setTourThucTe(getTourThucTeIfPresent(request.getMaTourThucTe()));
        hdx.setTenHanhDong(request.getTenHanhDong());
        hdx.setDiemCong(request.getDiemCong());
        hanhDongXanhRepository.save(hdx);
        return toResponse(hdx);
    }

    @Transactional
    public HanhDongXanhResponse capNhat(String id, HanhDongXanhRequest request) {
        HanhDongXanh hdx = hanhDongXanhRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + id));

        if (request.getTenHanhDong() != null) hdx.setTenHanhDong(request.getTenHanhDong());
        if (request.getDiemCong() != null) hdx.setDiemCong(request.getDiemCong());
        hdx.setTourThucTe(getTourThucTeIfPresent(request.getMaTourThucTe()));
        hanhDongXanhRepository.save(hdx);
        return toResponse(hdx);
    }

    @Transactional
    public void xoa(String id) {
        HanhDongXanh hdx = hanhDongXanhRepository.findById(id)
                .orElseThrow(() -> AppException.notFound("Khong tim thay hanh dong xanh: " + id));
        hanhDongXanhRepository.delete(hdx);
    }

    private HanhDongXanhResponse toResponse(HanhDongXanh hdx) {
        TourThucTe tourThucTe = hdx.getTourThucTe();
        return HanhDongXanhResponse.builder()
                .maHanhDongXanh(hdx.getMaHanhDongXanh())
                .maTourThucTe(tourThucTe != null ? tourThucTe.getMaTourThucTe() : null)
                .tenHanhDong(hdx.getTenHanhDong())
                .diemCong(hdx.getDiemCong())
                .build();
    }

    private TourThucTe getTourThucTeIfPresent(String maTourThucTe) {
        if (maTourThucTe == null || maTourThucTe.isBlank()) {
            return null;
        }
        return tourThucTeRepository.findById(maTourThucTe)
                .orElseThrow(() -> AppException.notFound("Khong tim thay tour thuc te: " + maTourThucTe));
    }
}
