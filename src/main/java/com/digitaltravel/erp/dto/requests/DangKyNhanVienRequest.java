package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class DangKyNhanVienRequest {

    @NotBlank(message = "Ten dang nhap khong duoc de trong")
    @Size(min = 4, max = 100, message = "Ten dang nhap phai tu 4 den 100 ky tu")
    String tenDangNhap;

    @NotBlank(message = "Mat khau khong duoc de trong")
    @Size(min = 6, message = "Mat khau phai co it nhat 6 ky tu")
    String matKhau;

    @NotBlank(message = "Ho ten khong duoc de trong")
    @Size(max = 200)
    String hoTen;

    @Email(message = "Email khong hop le")
    String email;

    @Size(max = 20)
    String soDienThoai;

    /**
     * Ma vai tro can gan: SANPHAM, KINHDOANH, DIEUHANH, KETOAN, HDV
     * (ADMIN va KHACHHANG khong dung endpoint nay)
     */
    @NotBlank(message = "Ma vai tro khong duoc de trong")
    String maVaiTro;
}
