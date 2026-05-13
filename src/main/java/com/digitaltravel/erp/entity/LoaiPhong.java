package com.digitaltravel.erp.entity;

import java.math.BigDecimal;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "LOAIPHONG")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoaiPhong {
    @Id
    @Column(name = "MaLoaiPhong", nullable = false, length = 50)
    String MaLoaiPhong;

    @Column(name = "TenLoai", nullable = false, length = 200)
    String TenLoai;

    // NUMBER(18,2): phu thu them cho loai phong, mac dinh 0
    @Column(name = "MucPhuThu", nullable = false, precision = 18, scale = 2)
    BigDecimal MucPhuThu;

    // Gia tri hop le: HOAT_DONG | KHOA
    @Column(name = "TrangThai", nullable = false, length = 20)
    String TrangThai;

}
