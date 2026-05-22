package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LichTrinhRequest {

    @NotNull(message = "Ngày thứ không được để trống")
    @Min(value = 1, message = "Ngày thứ phải lớn hơn 0")
    Integer ngayThu;

    @NotBlank(message = "Hoạt động không được để trống")
    String hoatDong;

    String moTa;

    String thucDon;
}
