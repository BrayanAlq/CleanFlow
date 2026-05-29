package com.example.cleanflowback.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/helloworld")
public class HelloWorldController {
    @GetMapping("")
    public ResponseEntity<Map<String, String>> getString() {
        return ResponseEntity.ok(Map.of("greetings", "Hello World"));
    }
}
