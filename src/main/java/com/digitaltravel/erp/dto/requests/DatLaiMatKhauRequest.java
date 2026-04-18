package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class DatLaiMatKhauRequest {

    @NotBlank(message = "Reset token khong duoc de trong")
    String resetToken;

    @NotBlank(message = "Mat khau moi khong duoc de trong")
    @Size(min = 6, message = "Mat khau moi phai co it nhat 6 ky tu")
    String matKhauMoi;

    @NotBlank(message = "Xac nhan mat khau khong duoc de trong")
    String xacNhanMatKhau;
}
