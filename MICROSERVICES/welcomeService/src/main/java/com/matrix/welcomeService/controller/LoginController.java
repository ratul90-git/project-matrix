package com.matrix.welcomeService.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {

    @PostMapping("/api/login")
    public Map<String, Object> login(@RequestBody Map<String, String> credentials) {
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