package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class YeuCauHoTroRequest {
    // Có thể null nếu yêu cầu không gắn với đơn nào
    String maDatTour;

    @NotBlank(message = "LoaiYeuCau khong duoc trong")
    String loaiYeuCau; // KHIEU_NAI | HO_TRO | THONG_TIN

    @NotBlank(message = "NoiDung khong duoc trong")
    String noiDung;
}
