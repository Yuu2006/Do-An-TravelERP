package com.digitaltravel.erp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "NHATKYSUCO")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NhatKySuCo {
    @Id
    @Column(name = "MaNhatKySuCo", nullable = false, length = 50)
    String MaNhatKySuCo;

    // FK -> TOURTHUCTE(MaTourThucTe)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTourThucTe", nullable = false)
    TourThucTe tourThucTe;

    // FK -> NHANVIEN(MaNhanVien)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaNhanVienBaoCao", nullable = false)
    NhanVien nhanVienBaoCao;

    // CLOB: mo ta chi tiet su co
    @Lob
    @Column(name = "MoTa", nullable = false)
    String MoTa;

    // CLOB: giai phap da xu ly
    @Lob
    @Column(name = "GiaiPhap")
    String GiaiPhap;

    // Gia tri hop le: MOI_TAO | DANG_XU_LY | DA_DONG
    @Column(name = "TrangThai", nullable = false, length = 20)
    String TrangThai;

    @Column(name = "ThoiGianBaoCao", nullable = false)
    LocalDateTime ThoiGianBaoCao;

    @CreationTimestamp
    @Column(name = "ThoiDiemTao", nullable = false, updatable = false)
    LocalDateTime ThoiDiemTao;

    @UpdateTimestamp
    @Column(name = "CapNhatVao")
    LocalDateTime CapNhatVao;
}
