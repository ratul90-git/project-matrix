package com.matrix.welcomeService.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@RestController
public class WelcomeController {

    @GetMapping("/api/data")
    public Map<String, Object> getData() {
        Map<String, Object> response = new HashMap<>();
        response.put("message", "This is a response from the Spring Boot service");
        response.put("timestamp", Instant.now().toString());
        return response;
    }
}
