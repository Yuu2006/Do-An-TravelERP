package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class TourMauResponse {
    String maTourMau;
    String tieuDe;
    String moTa;
    Integer thoiLuong;
    BigDecimal giaSan;
    BigDecimal danhGia;
    Integer soDanhGia;
    String trangThai;
    LocalDateTime thoiDiemTao;
    LocalDateTime capNhatVao;
    String taoBoi;
}
