package com.digitaltravel.erp.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class DangNhapRequest {

    @NotBlank
    String tenDangNhap;

    @NotBlank
    String matKhau;
}
