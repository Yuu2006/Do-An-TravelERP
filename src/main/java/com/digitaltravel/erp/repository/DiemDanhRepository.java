package com.digitaltravel.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.DiemDanh;

@Repository
public interface DiemDanhRepository extends JpaRepository<DiemDanh, String> {

    @Query("SELECT d FROM DiemDanh d JOIN FETCH d.khachHang WHERE d.tourThucTe.MaTourThucTe = :maTour ORDER BY d.ThoiGian DESC")
    List<DiemDanh> findByMaTour(@Param("maTour") String maTour);
}
