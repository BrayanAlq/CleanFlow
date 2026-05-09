package com.example.cleanflowback.dto.out;

import java.time.LocalDateTime;
import java.util.List;

public record ReportResponseDTO(
    Long id,
    String content,
    LocalDateTime timestamp,
    UserInfoResponseDTO user,
    List<ReportImageResponseDTO> images
) {}
