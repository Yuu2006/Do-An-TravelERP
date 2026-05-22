package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class XacNhanThanhToanOfflineRequest {

    @Size(max = 50, message = "Phuong thuc khong duoc vuot qua 50 ky tu")
    String phuongThuc;

    @Size(max = 200, message = "Ma giao dich ngan hang khong duoc vuot qua 200 ky tu")
    String maGiaoDichNganHang;

    @Size(max = 500, message = "Ghi chu khong duoc vuot qua 500 ky tu")
    String ghiChu;
}
