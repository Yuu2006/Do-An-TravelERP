package com.digitaltravel.erp.config;

import static com.digitaltravel.erp.config.VaiTroConst.ADMIN;
import static com.digitaltravel.erp.config.VaiTroConst.DIEUHANH;
import static com.digitaltravel.erp.config.VaiTroConst.HDV;
import static com.digitaltravel.erp.config.VaiTroConst.KETOAN;
import static com.digitaltravel.erp.config.VaiTroConst.KHACHHANG;
import static com.digitaltravel.erp.config.VaiTroConst.KINHDOANH;
import static com.digitaltravel.erp.config.VaiTroConst.SANPHAM;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.digitaltravel.erp.service.TaiKhoanDetailsService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthFilter jwtAuthFilter;
    private final TaiKhoanDetailsService taiKhoanDetailsService;
    private final JwtAuthEntryPoint jwtAuthEntryPoint;
    private final JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Bean
    @Order(1)
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .csrf(csrf -> csrf.disable())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/auth/**").permitAll()
                        .requestMatchers("/api/public/**").permitAll()
                        .requestMatchers("/swagger-ui/**", "/v3/api-docs/**").permitAll()
                        .requestMatchers("/api/quan-tri/**").hasRole(ADMIN)
                        .requestMatchers("/api/san-pham/**").hasRole(SANPHAM)
                        .requestMatchers("/api/kinh-doanh/**").hasRole(KINHDOANH)
                        .requestMatchers("/api/dieu-hanh/**").hasRole(DIEUHANH)
                        .requestMatchers("/api/huong-dan-vien/**").hasAnyRole(DIEUHANH, HDV)
                        .requestMatchers("/api/ke-toan/**").hasRole(KETOAN)
                        .requestMatchers("/api/khach-hang/**").hasRole(KHACHHANG)
                        .requestMatchers("/api/thanh-toan/**").hasRole(KHACHHANG)
                        .anyRequest().authenticated()
                )
                .authenticationProvider(authenticationProvider())
                .exceptionHandling(ex -> ex
                        .authenticationEntryPoint(jwtAuthEntryPoint)
                        .accessDeniedHandler(jwtAccessDeniedHandler)
                )
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class)
                .build();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider(taiKhoanDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception {
        return config.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
