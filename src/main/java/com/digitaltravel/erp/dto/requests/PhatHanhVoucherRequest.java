package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class PhatHanhVoucherRequest {
    @NotBlank(message = "MaKhachHang khong duoc trong")
    String maKhachHang;
}
