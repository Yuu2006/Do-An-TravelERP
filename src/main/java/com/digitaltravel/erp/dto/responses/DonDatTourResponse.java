package com.digitaltravel.erp.dto.responses;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class DonDatTourResponse {
    String maDatTour;
    String maTourThucTe;
    String tieuDeTour;
    LocalDate ngayKhoiHanh;
    BigDecimal giaHienHanh;
    Integer thoiLuong;
    String maKhachHang;
    String tenKhachHang;
    LocalDateTime ngayDat;
    BigDecimal tongTien;
    String trangThai;
    LocalDateTime thoiGianHetHan;
    String ghiChu;
    LocalDateTime thoiDiemTao;
    LocalDateTime capNhatVao;
    List<ChiTietDatTourResponse> chiTietKhach;
    List<ChiTietDichVuResponse> chiTietDichVu;
}
