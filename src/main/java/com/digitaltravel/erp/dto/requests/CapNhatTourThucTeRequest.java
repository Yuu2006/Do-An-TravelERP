package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import lombok.Getter;

@Getter
public class CapNhatTourThucTeRequest {

    @DecimalMin(value = "0.01", message = "Gia hien hanh phai lon hon 0")
    BigDecimal giaHienHanh;

    @Min(value = 1, message = "So khach toi da phai it nhat 1")
    Integer soKhachToiDa;

    @Min(value = 1, message = "So khach toi thieu phai it nhat 1")
    Integer soKhachToiThieu;

    String trangThai;
}
