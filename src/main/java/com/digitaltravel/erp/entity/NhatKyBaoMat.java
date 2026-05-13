package com.digitaltravel.erp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "NHATKYBAOMAT")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class NhatKyBaoMat {
    @Id
    @Column(name = "MaNhatKyBaoMat", nullable = false, length = 50)
    String MaNhatKyBaoMat;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaTaiKhoan")
    TaiKhoan taiKhoan;

    @Column(name = "HanhDong", nullable = false, length = 100)
    String HanhDong;

    @Column(name = "DoiTuong", length = 100)
    String DoiTuong;

    @Column(name = "MaDoiTuong", length = 50)
    String MaDoiTuong;

    @Column(name = "KetQua", nullable = false, length = 20)
    String KetQua;

    @CreationTimestamp
    @Column(name = "ThoiGian", nullable = false, updatable = false)
    LocalDateTime ThoiGian;

}
