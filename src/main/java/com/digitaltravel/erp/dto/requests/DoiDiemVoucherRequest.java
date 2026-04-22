package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class DoiDiemVoucherRequest {
    @NotBlank(message = "MaVoucher khong duoc trong")
    String maVoucher;
}
