package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class DanhGiaRequest {
    @NotBlank(message = "MaTourThucTe khong duoc trong")
    String maTourThucTe;

    @NotNull(message = "SoSao khong duoc trong")
    @Min(value = 1, message = "So sao toi thieu la 1")
    @Max(value = 5, message = "So sao toi da la 5")
    Integer soSao;

    String nhanXet;
}
