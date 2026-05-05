package com.example.cleanflowback.config.security;

import org.springframework.security.web.servlet.util.matcher.PathPatternRequestMatcher;

import java.util.List;
import java.util.stream.Stream;

public class PublicPaths {
    public static List<PathPatternRequestMatcher> publicMatchers = Stream.of(
        "/auth/**",
        "/error"
    ).map(path -> PathPatternRequestMatcher.withDefaults().matcher(path)).toList();
}
