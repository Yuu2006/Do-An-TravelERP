package com.digitaltravel.erp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "THAMSOHETHONG")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ThamSoHeThong {
    @Id
    @Column(name = "MaThamSo", nullable = false, length = 50)
    String MaThamSo;

    @Column(name = "TenThamSo", nullable = false, length = 100, unique = true)
    String TenThamSo;

    @Column(name = "GiaTri", nullable = false, length = 2000)
    String GiaTri;

    @Column(name = "KieuDuLieu", nullable = false, length = 20)
    String KieuDuLieu;

    @Column(name = "MoTa", length = 1000)
    String MoTa;

    @Column(name = "TrangThai", nullable = false, length = 20)
    String TrangThai;

    @CreationTimestamp
    @Column(name = "ThoiDiemTao", nullable = false, updatable = false)
    LocalDateTime ThoiDiemTao;

    @UpdateTimestamp
    @Column(name = "CapNhatVao")
    LocalDateTime CapNhatVao;

    @Column(name = "TaoBoi", length = 100)
    String TaoBoi;

    @Column(name = "CapNhatBoi", length = 100)
    String CapNhatBoi;
}
