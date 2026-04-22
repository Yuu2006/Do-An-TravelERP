package com.digitaltravel.erp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.digitaltravel.erp.entity.LoaiPhong;

@Repository
public interface LoaiPhongRepository extends JpaRepository<LoaiPhong, String> {
}
