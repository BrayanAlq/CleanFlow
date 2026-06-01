package com.example.cleanflowback.dto.out;

import java.util.List;

public record CursorPageWithEncodedResponseDTO<T>(
    List<T> content,
    boolean hasNext,
    String cursor
) {}
