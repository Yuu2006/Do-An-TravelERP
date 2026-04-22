package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class DichVuThemDatRequest {

    @NotBlank(message = "Ma dich vu them khong duoc de trong")
    String maDichVuThem;

    @NotNull(message = "So luong khong duoc de trong")
    @Min(value = 1, message = "So luong phai it nhat la 1")
    Long soLuong;
}
