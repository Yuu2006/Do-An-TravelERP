package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class HanhDongXanhRequest {

    @NotBlank(message = "Ten hanh dong khong duoc de trong")
    @Size(max = 200, message = "Ten hanh dong toi da 200 ky tu")
    String tenHanhDong;

    @NotNull(message = "Diem cong khong duoc de trong")
    @Min(value = 0, message = "Diem cong khong duoc am")
    Long diemCong;
}
