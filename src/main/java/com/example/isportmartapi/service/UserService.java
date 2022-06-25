package com.example.isportmartapi.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.isportmartapi.entity.User;
import com.example.isportmartapi.enums.UserStatusEnum;
import com.example.isportmartapi.mapper.UserMapper;
import com.example.isportmartapi.model.dto.UserDto;
import com.example.isportmartapi.model.dto.UserRegisterDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * @author mahao
 * @since 2022-06-26
 */
@Service
@Slf4j
public class UserService extends ServiceImpl<UserMapper, User> {

    /**
     * Register user
     *
     * @param userRegisterDto user register transfer object
     * @return User transfer object
     */
    public UserDto registerUser(UserRegisterDto userRegisterDto) {
        User userNeedToRegister = new User();
        BeanUtils.copyProperties(userRegisterDto, userNeedToRegister);
        userNeedToRegister.setStatus(UserStatusEnum.ACTIVED.getValue());
        this.save(userNeedToRegister);
        log.info("[registerUser]: register a new user, name={}", userNeedToRegister.getUserName());
        UserDto result = new UserDto();
        BeanUtils.copyProperties(userNeedToRegister, result);
        return result;
    }
}
