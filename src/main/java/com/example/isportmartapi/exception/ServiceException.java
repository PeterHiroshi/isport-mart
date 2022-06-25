package com.example.isportmartapi.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author mahao
 * @since 2022-06-26
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceException extends RuntimeException {
    private static final long serialVersionUID = -6264954826415071112L;

    private String message;

    public ServiceException(Throwable cause, String message) {
        super(cause);
        this.message = message;
    }
}
