package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ChiTietDatTourResponse {
    String maChiTietDat;
    String maKhachHang;
    String hoTen;
    BigDecimal giaTaiThoiDiemDat;
}
