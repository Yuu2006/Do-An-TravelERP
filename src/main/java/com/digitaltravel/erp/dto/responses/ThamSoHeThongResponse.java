package com.digitaltravel.erp.dto.responses;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ThamSoHeThongResponse {
    String maThamSo;
    String tenThamSo;
    String giaTri;
    String kieuDuLieu;
    String moTa;
    String trangThai;
    LocalDateTime thoiDiemTao;
    LocalDateTime capNhatVao;
}
