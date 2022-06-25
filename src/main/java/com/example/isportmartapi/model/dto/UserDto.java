package com.example.isportmartapi.model.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author mahao
 * @since 2022-06-25
 */
@Data
public class UserDto implements Serializable {
    private static final long serialVersionUID = 5996347386591442524L;

    private String userName;
    private String status;
}
