package com.example.cleanflowback.dto.out;

import java.util.List;

public record CursorPageWithEncodedResponseDTO<T>(
    String cursor,
    List<T> content,
    boolean hasNext
) {}
