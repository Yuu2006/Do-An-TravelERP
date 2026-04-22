package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.Data;

@Data
public class KhaiChiPhiRequest {
    @NotBlank
    private String danhMuc;
    @Positive
    private BigDecimal thanhTien;
    private String hoaDonAnh;
}
