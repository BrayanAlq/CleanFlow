package com.example.cleanflowback.dto.out;

import java.time.Instant;
import java.util.List;

public record ReportResponseDTO(
    Long id,
    String content,
    Instant timestamp,
    UserInfoResponseDTO user,
    List<ReportImageResponseDTO> images
) {}
