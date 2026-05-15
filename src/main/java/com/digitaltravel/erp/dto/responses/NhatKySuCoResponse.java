package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NhatKySuCoResponse {
    private String maNhatKySuCo;
    private String moTa;
    private String giaiPhap;
    private LocalDateTime thoiGianBaoCao;
}
