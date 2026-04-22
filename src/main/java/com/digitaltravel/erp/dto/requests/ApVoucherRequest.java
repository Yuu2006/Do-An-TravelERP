package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class ApVoucherRequest {
    @NotBlank(message = "MaDatTour khong duoc trong")
    String maDatTour;

    @NotBlank(message = "MaVoucher khong duoc trong")
    String maVoucher;
}
