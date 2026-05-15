package com.digitaltravel.erp.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.KhuyenMaiKh;
import com.digitaltravel.erp.entity.KhuyenMaiKhId;

@Repository
public interface KhuyenMaiKhRepository extends JpaRepository<KhuyenMaiKh, KhuyenMaiKhId> {

    // Xem ví voucher của một khách hàng
    @Query("""
            SELECT k FROM KhuyenMaiKh k
            JOIN FETCH k.voucher v
            WHERE k.khachHang.MaKhachHang = :maKhachHang
            ORDER BY k.NgayNhan DESC
            """)
    Page<KhuyenMaiKh> findByMaKhachHang(@Param("maKhachHang") String maKhachHang, Pageable pageable);

    // Kiểm tra KH đã có voucher chưa
    @Query("""
            SELECT k FROM KhuyenMaiKh k
            JOIN FETCH k.voucher
            WHERE k.khachHang.MaKhachHang = :maKhachHang
              AND k.voucher.MaVoucher = :maVoucher
            """)
    Optional<KhuyenMaiKh> findByKhachHangAndVoucher(
            @Param("maKhachHang") String maKhachHang,
            @Param("maVoucher") String maVoucher
    );
}
