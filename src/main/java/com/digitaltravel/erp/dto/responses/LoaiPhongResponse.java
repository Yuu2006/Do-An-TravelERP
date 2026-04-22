package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LoaiPhongResponse {
    String maLoaiPhong;
    String tenLoai;
    BigDecimal mucPhuThu;
    String trangThai;
}
