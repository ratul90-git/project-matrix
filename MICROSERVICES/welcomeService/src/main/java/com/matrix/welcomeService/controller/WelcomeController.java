package com.matrix.welcomeService.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @PostMapping("/api/login")
    public Map<String, Object> checkLogin(@RequestBody Map<String, String> credentials) {
        String username = credentials.get("username");
        String password = credentials.get("password");

        Map<String, Object> response = new HashMap<>();
        // Simple validation for demonstration purposes
        if ("user".equals(username) && "12345".equals(password)) {
            response.put("success", true);
        } else {
            response.put("success", false);
        }
        return response;
    }
}
