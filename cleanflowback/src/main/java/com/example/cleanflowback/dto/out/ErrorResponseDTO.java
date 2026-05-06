package com.example.cleanflowback.dto.out;

import lombok.Builder;
import org.springframework.http.HttpStatus;

import java.util.Map;

@Builder
public record ErrorResponseDTO(
    int statusCode, String message, String code, Map<String, String> details
) {
    public static ErrorResponseDTO of(
        HttpStatus statusCode, String message, String code
    ) {
        return ErrorResponseDTO.builder()
            .statusCode(statusCode.value()).message(message).code(code).build();
    }

    public static ErrorResponseDTO of(
        HttpStatus statusCode, String message, String code, Map<String, String> details
    ) {
        return ErrorResponseDTO.builder()
            .statusCode(statusCode.value()).message(message).code(code).details(details).build();
    }
}
