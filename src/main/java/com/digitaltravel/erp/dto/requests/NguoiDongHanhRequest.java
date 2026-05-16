package com.digitaltravel.erp.dto.requests;

import java.time.LocalDate;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class NguoiDongHanhRequest {

    @NotBlank(message = "Ho ten khach di cung khong duoc de trong")
    @Size(max = 200, message = "Ho ten khong duoc vuot qua 200 ky tu")
    String hoTen;

    @Size(max = 20, message = "CCCD khong duoc vuot qua 20 ky tu")
    String cccd;

    @Size(max = 20, message = "So dien thoai khong duoc vuot qua 20 ky tu")
    String soDienThoai;

    LocalDate ngaySinh;

    @Size(max = 20, message = "Gioi tinh khong duoc vuot qua 20 ky tu")
    String gioiTinh;

    @Size(max = 1000, message = "Ghi chu khong duoc vuot qua 1000 ky tu")
    String ghiChu;
}
