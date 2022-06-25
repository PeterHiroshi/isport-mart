package com.example.isportmartapi.controller;

import com.example.isportmartapi.model.Result;
import com.example.isportmartapi.model.dto.UserDto;
import com.example.isportmartapi.model.dto.UserRegisterDto;
import com.example.isportmartapi.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author mahao
 * @since 2022-06-25
 */
@RestController
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/register")
    public Result<UserDto> registerUser(@RequestBody UserRegisterDto userRegisterDto) {
        UserDto userDto = userService.registerUser(userRegisterDto);
        return Result.success(userDto, "register user successfully");
    }

}
