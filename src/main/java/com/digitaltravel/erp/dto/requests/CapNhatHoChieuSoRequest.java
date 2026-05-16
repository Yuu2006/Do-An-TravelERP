package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class CapNhatHoChieuSoRequest {

    @Size(max = 20, message = "CCCD khong duoc vuot qua 20 ky tu")
    String cccd;

    @Size(max = 20, message = "So dien thoai khong duoc vuot qua 20 ky tu")
    String soDienThoai;

    @Size(max = 1000, message = "Di ung khong duoc vuot qua 1000 ky tu")
    String diUng;

    // CLOB field - no max length constraint
    String ghiChuYTe;
}
