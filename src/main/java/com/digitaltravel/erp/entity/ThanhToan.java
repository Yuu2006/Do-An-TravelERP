package com.digitaltravel.erp.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
@Table(name = "THANHTOAN")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ThanhToan {
    @Id
    @Column(name = "MaThanhToan", nullable = false, length = 50)
    String MaThanhToan;

    // FK -> DONDATTOUR(MaDatTour)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaDatTour", nullable = false)
    DonDatTour donDatTour;

    @Column(name = "PhuongThuc", nullable = false, length = 50)
    String PhuongThuc;

    // NUMBER(18,2): so tien giao dich
    @Column(name = "SoTien", nullable = false, precision = 18, scale = 2)
    BigDecimal SoTien;

    // Ma giao dich tra ve tu cong thanh toan (MoMo transId,...)
    @Column(name = "MaGiaoDich", length = 200)
    String MaGiaoDich;

    // Gia tri hop le: CHO_THANH_TOAN | THANH_CONG | THAT_BAI | CHO_HOAN_TIEN | DA_HOAN_TIEN
    @Column(name = "TrangThai", nullable = false, length = 30)
    String TrangThai;

    @Column(name = "NgayThanhToan")
    LocalDateTime NgayThanhToan;

    @Column(name = "GhiChu", length = 2000)
    String GhiChu;

    @CreationTimestamp
    @Column(name = "ThoiDiemTao", nullable = false, updatable = false)
    LocalDateTime ThoiDiemTao;

    @UpdateTimestamp
    @Column(name = "CapNhatVao")
    LocalDateTime CapNhatVao;
}
