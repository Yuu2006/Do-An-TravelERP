package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class CapNhatHoChieuSoRequest {

    @Size(max = 1000, message = "Di ung khong duoc vuot qua 1000 ky tu")
    String diUng;

    // CLOB field - no max length constraint
    String ghiChuYTe;
}
