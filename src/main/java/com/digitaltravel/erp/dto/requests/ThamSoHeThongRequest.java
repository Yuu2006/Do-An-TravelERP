package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class ThamSoHeThongRequest {
    @NotBlank(message = "TenThamSo khong duoc de trong")
    @Size(max = 100)
    String tenThamSo;

    @NotBlank(message = "GiaTri khong duoc de trong")
    @Size(max = 2000)
    String giaTri;

    @NotBlank(message = "KieuDuLieu khong duoc de trong")
    @Size(max = 20)
    String kieuDuLieu;

    @Size(max = 1000)
    String moTa;
}
