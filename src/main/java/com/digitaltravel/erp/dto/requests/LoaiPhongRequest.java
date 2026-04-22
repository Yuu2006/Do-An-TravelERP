package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class LoaiPhongRequest {

    @NotBlank(message = "Ten loai phong khong duoc de trong")
    @Size(max = 200, message = "Ten loai phong toi da 200 ky tu")
    String tenLoai;

    @DecimalMin(value = "0", message = "Muc phu thu khong duoc am")
    BigDecimal mucPhuThu;

    String trangThai;
}
