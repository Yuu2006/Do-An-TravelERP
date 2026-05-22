package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class DanhGiaRequest {
    @NotBlank(message = "Mã tour thực tế không được trống")
    String maTourThucTe;

    @NotNull(message = "Số sao không được trống")
    @Min(value = 1, message = "Số sao tối thiểu là 1")
    @Max(value = 5, message = "Số sao tối đa là 5")
    Integer soSao;

    String nhanXet;
}
