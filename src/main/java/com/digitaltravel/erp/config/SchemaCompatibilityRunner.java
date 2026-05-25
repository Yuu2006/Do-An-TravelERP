package com.digitaltravel.erp.config;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class SchemaCompatibilityRunner {

    private final JdbcTemplate jdbcTemplate;

    @PostConstruct
    void updateYeuCauHoTroStatusConstraint() {
        try {
            jdbcTemplate.execute("ALTER TABLE YEUCAUHOTRO DROP CONSTRAINT CK_YCHT_TrangThai");
        } catch (Exception ex) {
            log.debug("CK_YCHT_TrangThai was not dropped, continuing with add/update attempt: {}", ex.getMessage());
        }

        try {
            jdbcTemplate.execute("""
                    ALTER TABLE YEUCAUHOTRO ADD CONSTRAINT CK_YCHT_TrangThai CHECK (
                        TrangThai IN ('CHUA_XU_LY','CHO_BO_SUNG','CHO_GIAI_TRINH','CHO_DUYET','DA_XU_LY','TU_CHOI')
                    )
                    """);
        } catch (Exception ex) {
            log.warn("Could not update CK_YCHT_TrangThai to include CHO_DUYET: {}", ex.getMessage());
        }
    }

    @PostConstruct
    void addQuyetToanHoaDonAnhColumn() {
        try {
            Integer count = jdbcTemplate.queryForObject("""
                    SELECT COUNT(*)
                    FROM USER_TAB_COLUMNS
                    WHERE TABLE_NAME = 'QUYETTOAN'
                      AND COLUMN_NAME = 'HOADONANH'
                    """, Integer.class);
            if (count != null && count == 0) {
                jdbcTemplate.execute("ALTER TABLE QUYETTOAN ADD HoaDonAnh VARCHAR2(1000)");
            }
        } catch (Exception ex) {
            log.warn("Could not ensure QUYETTOAN.HoaDonAnh column exists: {}", ex.getMessage());
        }
    }
}
