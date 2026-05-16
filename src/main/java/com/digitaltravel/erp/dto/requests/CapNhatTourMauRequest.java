package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class CapNhatTourMauRequest {

    @Size(max = 500, message = "Tieu de toi da 500 ky tu")
    String tieuDe;

    String moTa;

    @Min(value = 1, message = "Thoi luong phai it nhat 1 ngay")
    Integer thoiLuong;

    @DecimalMin(value = "0.01", message = "Gia san phai lon hon 0")
    BigDecimal giaSan;
}
