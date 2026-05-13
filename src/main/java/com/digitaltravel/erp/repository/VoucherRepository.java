package com.digitaltravel.erp.repository;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.Voucher;

@Repository
public interface VoucherRepository extends JpaRepository<Voucher, String> {

    Optional<Voucher> findByMaCode(String maCode);

    // Tất cả voucher đang có hiệu lực (admin quản lý)
    @Query("""
            SELECT v FROM Voucher v
            WHERE (:trangThai IS NULL OR v.TrangThai = :trangThai)
            ORDER BY v.NgayHieuLuc DESC
            """)
    Page<Voucher> timKiem(@Param("trangThai") String trangThai, Pageable pageable);

    // Voucher còn hiệu lực và còn lượt dùng (dùng để validate khi áp vào đơn)
    @Query("""
            SELECT v FROM Voucher v
            WHERE v.TrangThai = 'SAN_SANG'
              AND v.NgayHieuLuc <= :today
              AND v.NgayHetHan >= :today
              AND v.SoLuotDaDung < v.SoLuotPhatHanh
            """)
    Page<Voucher> findAllActive(@Param("today") LocalDate today, Pageable pageable);
}
