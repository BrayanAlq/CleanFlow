package com.example.cleanflowback.advice;

import com.example.cleanflowback.dto.out.ErrorResponseDTO;
import com.example.cleanflowback.exception.CredentialsAlreadyUsedException;
import com.example.cleanflowback.exception.UserInvalidCredentialsException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import tools.jackson.core.JacksonException;
import tools.jackson.databind.exc.InvalidFormatException;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<ErrorResponseDTO> handleHttpMessageNotReadableException(HttpMessageNotReadableException ex) {
        Throwable cause = ex.getCause();

        Map<String, String> errors = new HashMap<>();
        if (cause instanceof InvalidFormatException ife) {
            String field = ife.getPath()
                .stream()
                .map(JacksonException.Reference::getPropertyName)
                .reduce((first, second) -> second)
                .orElse("unknown");

            errors.put(field, "Invalid value: " + ife.getValue());
        } else {
            errors.put("body", "malformed JSON request");
        }

        return ResponseEntity.badRequest()
            .body(ErrorResponseDTO.of(
                HttpStatus.BAD_REQUEST,
                "INVALID_JSON",
                "Request body has invalid types",
                errors
            ));
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponseDTO> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        Map<String, String> errors = ex.getBindingResult().getFieldErrors().stream()
            .collect(Collectors.toMap(
                fe -> toSnakeCase(fe.getField()),
                fe -> Objects.requireNonNullElse(fe.getDefaultMessage(), "Blank error message"),
                (a, b) -> a
            ));
        return ResponseEntity.badRequest().body(
            ErrorResponseDTO.of(HttpStatus.BAD_REQUEST, "VALIDATION_ERROR", "validation errors", errors)
        );
    }

    @ExceptionHandler(CredentialsAlreadyUsedException.class)
    public ResponseEntity<ErrorResponseDTO> handleCredentialsAlreadyUsedException(CredentialsAlreadyUsedException ex) {
        return ResponseEntity.status(HttpStatus.CONFLICT)
            .body(ErrorResponseDTO.of(HttpStatus.CONFLICT, "CREDENTIALS_TAKEN", ex.getMessage()));
    }

    @ExceptionHandler(UserInvalidCredentialsException.class)
    public ResponseEntity<ErrorResponseDTO> handleUserInvalidCredentialsException(UserInvalidCredentialsException ex) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
            .body(ErrorResponseDTO.of(HttpStatus.UNAUTHORIZED, "INVALID_CREDENTIALS", ex.getMessage()));
    }

    private static String toSnakeCase(String field) {
        return field.replaceAll("([a-z])([A-Z]+)", "$1_$2").toLowerCase();
    }
}
