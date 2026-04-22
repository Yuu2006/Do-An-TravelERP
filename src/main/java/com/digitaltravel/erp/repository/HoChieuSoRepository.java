package com.digitaltravel.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.HoChieuSo;

@Repository
public interface HoChieuSoRepository extends JpaRepository<HoChieuSo, String> {

    @Query("""
            SELECT hcs FROM HoChieuSo hcs JOIN FETCH hcs.taiKhoan tk
            WHERE tk.MaTaiKhoan = :maTaiKhoan
            """)
    Optional<HoChieuSo> findByMaTaiKhoan(@Param("maTaiKhoan") String maTaiKhoan);

    @Query("""
            SELECT CASE WHEN COUNT(hcs) > 0 THEN true ELSE false END
            FROM HoChieuSo hcs
            WHERE hcs.taiKhoan.MaTaiKhoan = :maTaiKhoan
            """)
    boolean existsByMaTaiKhoan(@Param("maTaiKhoan") String maTaiKhoan);
}
