package com.digitaltravel.erp.dto.responses;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class HanhDongXanhResponse {
    String maHanhDongXanh;
    String tenHanhDong;
    Long diemCong;
    String trangThai;
}
