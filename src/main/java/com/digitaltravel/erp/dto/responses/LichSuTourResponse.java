package com.digitaltravel.erp.dto.responses;

import java.time.LocalDate;

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
}
