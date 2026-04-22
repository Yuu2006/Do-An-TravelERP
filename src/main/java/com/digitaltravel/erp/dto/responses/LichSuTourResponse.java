package com.digitaltravel.erp.dto.responses;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LichSuTourResponse {
    String maLichSuTour;
    String maTourThucTe;
    String tieuDeTour;
    LocalDate ngayKhoiHanh;
    Integer thoiLuong;
    LocalDate ngayThamGia;
    LocalDateTime thoiDiemTao;
}
