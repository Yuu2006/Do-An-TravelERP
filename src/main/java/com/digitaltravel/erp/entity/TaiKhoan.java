package com.digitaltravel.erp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "TAIKHOAN")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class TaiKhoan {
    @Id
    @Column(name = "MaTaiKhoan", nullable = false, length = 50)
    String MaTaiKhoan;

    @Column(name = "TenDangNhap", nullable = false, length = 100, unique = true)
    String TenDangNhap;

    @Column(name = "MatKhau", nullable = false, length = 255)
    String MatKhau;

    @Column(name = "HoTen", nullable = false, length = 200)
    String HoTen;

    @Column(name = "SoDinhDanh", length = 20, unique = true)
    String SoDinhDanh;

    @Column(name = "Email", length = 200, unique = true)
    String Email;

    @Column(name = "SoDienThoai", length = 20)
    String SoDienThoai;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "VaiTro", nullable = false)
    VaiTro vaiTro;

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

    @OneToOne(mappedBy = "taiKhoan", fetch = FetchType.LAZY)
    HoChieuSo hoChieuSo;

    @OneToOne(mappedBy = "taiKhoan", fetch = FetchType.LAZY)
    NhanVien nhanVien;
}
