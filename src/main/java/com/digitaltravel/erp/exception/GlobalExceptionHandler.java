package com.digitaltravel.erp.exception;

import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import com.digitaltravel.erp.dto.responses.ApiResponse;

@RestControllerAdvice
public class GlobalExceptionHandler {

    // ── AppException (lỗi nghiệp vụ tùy chỉnh) ──────────────────────────────
    @ExceptionHandler(AppException.class)
    public ResponseEntity<ApiResponse<Void>> handleAppException(AppException ex) {
        return ResponseEntity
                .status(ex.getHttpStatus())
                .body(ApiResponse.<Void>builder()
                        .status(ex.getHttpStatus().value())
                        .success(false)
                        .message(ex.getMessage())
                        .error(ex.getErrorCode())
                        .build());
    }

    // ── Validation (@Valid) → 400 ─────────────────────────────────────────────
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<Void>> handleValidation(MethodArgumentNotValidException ex) {
        String message = ex.getBindingResult().getFieldErrors().stream()
                .map(fe -> fe.getField() + ": " + fe.getDefaultMessage())
                .collect(Collectors.joining(", "));
        return ResponseEntity
                .badRequest()
                .body(ApiResponse.badRequest("VALIDATION_ERROR", message));
    }

    // ── 401 – Sai credentials ─────────────────────────────────────────────────
    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<ApiResponse<Void>> handleBadCredentials(BadCredentialsException ex) {
        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(ApiResponse.unauthorized("BAD_CREDENTIALS", "Sai tên đăng nhập hoặc mật khẩu"));
    }

    // ── 401 – Tài khoản bị tắt ───────────────────────────────────────────────
    @ExceptionHandler(DisabledException.class)
    public ResponseEntity<ApiResponse<Void>> handleDisabled(DisabledException ex) {
        return ResponseEntity
                .status(HttpStatus.FORBIDDEN)
                .body(ApiResponse.forbidden("Tài khoản không ở trạng thái HOAT_DONG"));
    }

    // ── 423 – Tài khoản bị khóa ──────────────────────────────────────────────
    @ExceptionHandler(LockedException.class)
    public ResponseEntity<ApiResponse<Void>> handleLocked(LockedException ex) {
        return ResponseEntity
                .status(423)
                .body(ApiResponse.badRequest("ACCOUNT_LOCKED", "Tài khoản đang bị khóa"));
    }

    // ── 401 – AuthenticationException tổng quát ──────────────────────────────
    @ExceptionHandler(AuthenticationException.class)
    public ResponseEntity<ApiResponse<Void>> handleAuthentication(AuthenticationException ex) {
        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(ApiResponse.unauthorized("AUTHENTICATION_FAILED", ex.getMessage()));
    }

    // ── 403 – Không đủ quyền ─────────────────────────────────────────────────
    @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ApiResponse<Void>> handleAccessDenied(AccessDeniedException ex) {
        return ResponseEntity
                .status(HttpStatus.FORBIDDEN)
                .body(ApiResponse.forbidden("Bạn không có quyền truy cập tài nguyên này"));
    }

    // ── 404 – Không tìm thấy route ───────────────────────────────────────────
    @ExceptionHandler(NoResourceFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleNoResource(NoResourceFoundException ex) {
        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(ApiResponse.notFound("Không tìm thấy đường dẫn: " + ex.getResourcePath()));
    }

    // ── 500 – Mọi lỗi còn lại ────────────────────────────────────────────────
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse<Void>> handleGeneric(Exception ex) {
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(ApiResponse.internalError("Lỗi hệ thống, vui lòng thử lại sau"));
    }
}
