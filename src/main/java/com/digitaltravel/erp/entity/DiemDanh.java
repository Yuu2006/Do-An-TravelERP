package com.digitaltravel.erp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "DIEMDANH")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DiemDanh {
    @Id
    @Column(name = "MaDiemDanh", nullable = false, length = 50)
    String MaDiemDanh;

    // FK -> TOURTHUCTE(MaTourThucTe)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTourThucTe", nullable = false)
    TourThucTe tourThucTe;

    // FK -> HOCHIEUSO(MaKhachHang)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaKhachHang", nullable = false)
    HoChieuSo khachHang;

    // FK -> NHANVIEN(MaNhanVien)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNhanVien", nullable = false)
    NhanVien nhanVien;

    @Column(name = "ThoiGian", nullable = false)
    LocalDateTime ThoiGian;

    @Column(name = "DiaDiem", length = 500)
    String DiaDiem;

    // FK composite (MaTourThucTe, MaNhanVien) -> PHANCONGTOUR
    // insertable/updatable=false vi cac column da duoc map boi tourThucTe va nhanVien
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
        @JoinColumn(name = "MaTourThucTe", referencedColumnName = "MaTourThucTe", insertable = false, updatable = false),
        @JoinColumn(name = "MaNhanVien",   referencedColumnName = "MaNhanVien",   insertable = false, updatable = false)
    })
    PhanCongTour phanCongTour;

    @CreationTimestamp
    @Column(name = "ThoiDiemTao", nullable = false, updatable = false)
    LocalDateTime ThoiDiemTao;
}
