package com.example.cleanflowback.utils;

import com.example.cleanflowback.dto.GeneratedRouteCursorDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Component
@AllArgsConstructor
public class CursorUtil {
    private final ObjectMapper mapper;

    public String encode(GeneratedRouteCursorDTO dto) {
        try {
            String json = mapper.writeValueAsString(dto);
            return Base64.getEncoder().encodeToString(json.getBytes(StandardCharsets.UTF_8));
        } catch (Exception e) {
            throw new RuntimeException("Error when encoding generated route cursor: " + e.getMessage());
        }
    }

    public GeneratedRouteCursorDTO decode(String encodedCursor) {
        try {
            byte[] decodedBytes = Base64.getUrlDecoder().decode(encodedCursor);
            String jsonString = new String(decodedBytes, StandardCharsets.UTF_8);

            return mapper.readValue(jsonString, GeneratedRouteCursorDTO.class);
        } catch (Exception e) {
            throw new RuntimeException("Invalid cursor: " + e.getMessage());
        }
    }
}
