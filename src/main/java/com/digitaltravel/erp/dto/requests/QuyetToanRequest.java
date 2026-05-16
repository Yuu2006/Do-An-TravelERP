package com.digitaltravel.erp.dto.requests;

import java.math.BigDecimal;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class QuyetToanRequest {
    @DecimalMin(value = "0", message = "Gia cam ket khong duoc am")
    private BigDecimal giaCamKet;

    @Size(max = 4000)
    private String ghiChu;
}
