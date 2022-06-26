package com.example.isportmartapi.model.dto;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
 * 接收客户端（前端）的user用户注册的传输对象
 *
 * @author mahao
 * @since 2022-06-26
 */
@Slf4j
@Data
public class UserRegisterDto implements Serializable {
    private static final long serialVersionUID = 3573915115182909697L;

    private String userName;
    private String pwd;
    private String qq;
}
