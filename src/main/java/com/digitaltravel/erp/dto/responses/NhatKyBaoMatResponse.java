package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NhatKyBaoMatResponse {
    String maNhatKyBaoMat;
    String maTaiKhoan;
    String tenDangNhap;
    String hanhDong;
    String doiTuong;
    String maDoiTuong;
    String ketQua;
    LocalDateTime thoiGian;
}
