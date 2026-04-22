package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;

@Getter
public class TaoTourThucTeRequest {

    @NotBlank(message = "Ma tour mau khong duoc de trong")
    String maTourMau;

    @NotNull(message = "Ngay khoi hanh khong duoc de trong")
    @Future(message = "Ngay khoi hanh phai o tuong lai")
    LocalDate ngayKhoiHanh;

    @NotNull(message = "So khach toi da khong duoc de trong")
    @Min(value = 1, message = "So khach toi da phai it nhat 1")
    Integer soKhachToiDa;

    @Min(value = 1, message = "So khach toi thieu phai it nhat 1")
    Integer soKhachToiThieu;

    @NotNull(message = "Gia hien hanh khong duoc de trong")
    @DecimalMin(value = "0.01", message = "Gia hien hanh phai lon hon 0")
    BigDecimal giaHienHanh;
}
