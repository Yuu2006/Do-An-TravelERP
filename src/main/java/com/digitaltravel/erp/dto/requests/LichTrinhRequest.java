package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LichTrinhRequest {

    @NotNull(message = "Ngay thu khong duoc de trong")
    @Min(value = 1, message = "Ngay thu phai lon hon 0")
    Integer ngayThu;

    @NotBlank(message = "Hoat dong khong duoc de trong")
    String hoatDong;

    String moTa;

    String thucDon;
}
