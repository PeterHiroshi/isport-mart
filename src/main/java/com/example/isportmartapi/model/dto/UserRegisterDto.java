package com.example.isportmartapi.model.dto;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
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
