package com.digitaltravel.erp.dto.requests;

import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class QuyetToanRequest {
    @Size(max = 4000)
    private String ghiChu;
}
