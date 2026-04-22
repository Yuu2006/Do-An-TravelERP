package com.digitaltravel.erp.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.QuyetToan;

@Repository
public interface QuyetToanRepository extends JpaRepository<QuyetToan, String> {

    Optional<QuyetToan> findByTourThucTe_MaTourThucTe(String maTour);

    boolean existsByTourThucTe_MaTourThucTe(String maTour);

    @Query("""
            SELECT qt FROM QuyetToan qt JOIN FETCH qt.tourThucTe tt
            WHERE (:trangThai IS NULL OR qt.TrangThai = :trangThai)
            ORDER BY qt.NgayQuyetToan DESC
            """)
    Page<QuyetToan> findByTrangThai(@Param("trangThai") String trangThai, Pageable pageable);
}
