package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class DichVuThemRequest {

    @NotBlank(message = "Ten dich vu khong duoc de trong")
    @Size(max = 200, message = "Ten dich vu toi da 200 ky tu")
    String ten;

    @Size(max = 100, message = "Don vi tinh toi da 100 ky tu")
    String donViTinh;

    @NotNull(message = "Don gia khong duoc de trong")
    @DecimalMin(value = "0", message = "Don gia khong duoc am")
    BigDecimal donGia;
}
