package com.digitaltravel.erp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.digitaltravel.erp.entity.DichVuTourThucTe;
import com.digitaltravel.erp.entity.DichVuTourThucTeId;

public interface DichVuTourThucTeRepository extends JpaRepository<DichVuTourThucTe, DichVuTourThucTeId> {
}
