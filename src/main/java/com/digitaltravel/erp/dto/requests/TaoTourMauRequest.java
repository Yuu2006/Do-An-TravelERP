package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;
import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class TaoTourMauRequest {

    @NotBlank(message = "Tieu de khong duoc de trong")
    @Size(max = 500, message = "Tieu de toi da 500 ky tu")
    String tieuDe;

    String moTa;

    @NotNull(message = "Thoi luong khong duoc de trong")
    @Min(value = 1, message = "Thoi luong phai it nhat 1 ngay")
    Integer thoiLuong;

    @NotNull(message = "Gia san khong duoc de trong")
    @DecimalMin(value = "0.01", message = "Gia san phai lon hon 0")
    BigDecimal giaSan;

    @Valid
    List<LichTrinhRequest> lichTrinh;
}
