package com.digitaltravel.erp.dto.responses;

import java.time.LocalDate;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LichSuTourResponse {
    String maLichSuTour;
    String maDatTour;
    String maTourThucTe;
    String tieuDeTour;
    LocalDate ngayKhoiHanh;
    Integer thoiLuong;
    LocalDate ngayThamGia;
    String trangThaiTour;
    Boolean daDanhGia;
    Boolean daKhieuNai;
    String trangThaiKhieuNai;
}
