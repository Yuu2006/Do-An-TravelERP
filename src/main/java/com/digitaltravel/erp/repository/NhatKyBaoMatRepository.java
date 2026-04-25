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
              AND (:ketQua IS NULL OR nk.KetQua = :ketQua)
              AND (:tuThoiDiem IS NULL OR nk.ThoiDiemTao >= :tuThoiDiem)
              AND (:denThoiDiem IS NULL OR nk.ThoiDiemTao <= :denThoiDiem)
            """)
    Page<NhatKyBaoMat> timKiem(
            @Param("maTaiKhoan") String maTaiKhoan,
            @Param("hanhDong") String hanhDong,
            @Param("ketQua") String ketQua,
            @Param("tuThoiDiem") LocalDateTime tuThoiDiem,
            @Param("denThoiDiem") LocalDateTime denThoiDiem,
            Pageable pageable);
}
