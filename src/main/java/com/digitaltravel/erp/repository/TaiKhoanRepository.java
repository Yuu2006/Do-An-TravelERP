package com.digitaltravel.erp.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.TaiKhoan;

@Repository
public interface TaiKhoanRepository extends JpaRepository<TaiKhoan, String>{
    boolean existsByEmail(String email);

    default boolean TonTaiTaiKhoan(String email) {
        return existsByEmail(email);
    }
    
    Optional<TaiKhoan> findByEmail(String email);
    @Query(
            value = """
            select tk.* from TAIKHOAN tk
            join VAITRO vt on tk.VaiTro = vt.MaVaiTro
            where vt.TenHienThi = :TenVaiTro
            """, nativeQuery = true
    )
    List<TaiKhoan> findUsersByRoleName(@Param("TenVaiTro") String TenVaiTro);
}
