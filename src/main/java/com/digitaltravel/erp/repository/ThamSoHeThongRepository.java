package com.digitaltravel.erp.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.ThamSoHeThong;

@Repository
public interface ThamSoHeThongRepository extends JpaRepository<ThamSoHeThong, String> {
    boolean existsByTenThamSo(String tenThamSo);

    Optional<ThamSoHeThong> findByTenThamSo(String tenThamSo);

    @Query("""
            SELECT ts FROM ThamSoHeThong ts
            WHERE (:tuKhoa IS NULL OR LOWER(ts.TenThamSo) LIKE LOWER(CONCAT('%', :tuKhoa, '%'))
                    OR LOWER(ts.MoTa) LIKE LOWER(CONCAT('%', :tuKhoa, '%')))
              AND (:trangThai IS NULL OR ts.TrangThai = :trangThai)
            """)
    Page<ThamSoHeThong> timKiem(
            @Param("tuKhoa") String tuKhoa,
            @Param("trangThai") String trangThai,
            Pageable pageable);
}
