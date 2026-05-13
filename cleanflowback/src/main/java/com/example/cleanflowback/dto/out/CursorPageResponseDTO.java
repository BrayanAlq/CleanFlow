package com.example.cleanflowback.dto.out;

import java.util.List;

public record CursorPageResponseDTO<T>(
    List<T> content,
    Long cursor,
    boolean hasNext
) {
}
