package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;

@Getter
public class QuenMatKhauRequest {

    @NotBlank(message = "Ten dang nhap khong duoc de trong")
    String tenDangNhap;
}
