package com.digitaltravel.erp.repository;

import java.time.LocalDateTime;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.NhatKyBaoMat;

@Repository
public interface NhatKyBaoMatRepository extends JpaRepository<NhatKyBaoMat, String> {
    @Query("""
            SELECT nk FROM NhatKyBaoMat nk
            LEFT JOIN nk.taiKhoan tk
            WHERE (:maTaiKhoan IS NULL OR tk.MaTaiKhoan = :maTaiKhoan)
              AND (:hanhDong IS NULL OR nk.HanhDong = :hanhDong)
              AND (:doiTuong IS NULL OR nk.DoiTuong = :doiTuong)
              AND (:maDoiTuong IS NULL OR nk.MaDoiTuong = :maDoiTuong)
              AND (:ketQua IS NULL OR nk.KetQua = :ketQua)
              AND (:tuThoiGian IS NULL OR nk.ThoiGian >= :tuThoiGian)
              AND (:denThoiGian IS NULL OR nk.ThoiGian <= :denThoiGian)
            """)
    Page<NhatKyBaoMat> timKiem(
            @Param("maTaiKhoan") String maTaiKhoan,
            @Param("hanhDong") String hanhDong,
            @Param("doiTuong") String doiTuong,
            @Param("maDoiTuong") String maDoiTuong,
            @Param("ketQua") String ketQua,
            @Param("tuThoiGian") LocalDateTime tuThoiGian,
            @Param("denThoiGian") LocalDateTime denThoiGian,
            Pageable pageable);
}
