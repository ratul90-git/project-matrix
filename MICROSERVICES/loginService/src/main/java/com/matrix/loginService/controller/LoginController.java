package com.matrix.loginService.controller;

import com.matrix.loginService.model.UserDetails;
import com.matrix.loginService.service.UserDetailsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class LoginController {

    private final UserDetailsService userDetailsService;

    public LoginController(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @PostMapping("/getDetails")
    public List<UserDetails> getDetails() {
        return userDetailsService.getAllUserDetails();
    }
}
