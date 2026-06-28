package com.example.cleanflowback.dto;

import java.time.Instant;

public record FromToInstant(
    Instant from,
    Instant to
) {}
