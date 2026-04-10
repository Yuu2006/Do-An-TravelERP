package com.digitaltravel.erp.config;

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

import static com.digitaltravel.erp.config.VaiTroConst.ADMIN;
import static com.digitaltravel.erp.config.VaiTroConst.HDV;
import static com.digitaltravel.erp.config.VaiTroConst.KETOAN;
import static com.digitaltravel.erp.config.VaiTroConst.KHACHHANG;
import static com.digitaltravel.erp.config.VaiTroConst.MANAGER;
import static com.digitaltravel.erp.config.VaiTroConst.SALES;
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
               .sessionManagement(session -> session
                       .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
               .authorizeHttpRequests(auth -> auth
                        // Public
                        .requestMatchers("/api/auth/**").permitAll()
                        .requestMatchers("/swagger-ui/**", "/v3/api-docs/**").permitAll()

                        // Chỉ ADMIN
                        .requestMatchers("/api/admin/**").hasRole(ADMIN)

                        // ADMIN + MANAGER
                        .requestMatchers("/api/manager/**").hasAnyRole(ADMIN, MANAGER)

                        // ADMIN + MANAGER + SALES
                        .requestMatchers("/api/sales/**").hasAnyRole(ADMIN, MANAGER, SALES)

                        // ADMIN + MANAGER + KETOAN
                        .requestMatchers("/api/ketoan/**").hasAnyRole(ADMIN, MANAGER, KETOAN)

                        // ADMIN + MANAGER + HDV
                        .requestMatchers("/api/hdv/**").hasAnyRole(ADMIN, MANAGER, HDV)

                        // Khách hàng tự phục vụ
                        .requestMatchers("/api/khachhang/**").hasAnyRole(ADMIN, KHACHHANG)

                        // Mọi endpoint còn lại: đã đăng nhập
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
