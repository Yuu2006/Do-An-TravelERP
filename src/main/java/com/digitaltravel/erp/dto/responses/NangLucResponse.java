package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NangLucResponse {
    String maNangLucNhanVien;
    String maNhanVien;
    String ngonNgu;
    String chungChi;
    String chuyenMon;
    BigDecimal danhGia;
    Integer soDanhGia;
    LocalDateTime capNhatVao;
}
