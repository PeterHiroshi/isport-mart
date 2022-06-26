package com.example.isportmartapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * @author mahao
 * @since 2022-06-25
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result<T> implements Serializable {
    private static final long serialVersionUID = -192851517149562082L;

    private Integer code;
    private boolean success = true;
    private String message;
    private T data;

    public Result(Integer code, boolean success) {
        this.code = code;
        this.success = success;
    }

    public Result(Integer code, boolean success, String message) {
        this.code = code;
        this.success = success;
        this.message = message;
    }

    public static <T> Result<T> success() {
        Result<T> result = new Result<>();
        result.setSuccess(true);
        result.setCode(HttpStatus.OK.value());
        return result;
    }

    public static <T> Result<T> success(String message) {
        Result<T> result = success();
        result.setMessage(message);
        return result;
    }

    public static <T> Result<T> success(T data) {
        Result<T> result = success();
        result.setData(data);
        return result;
    }

    public static <T> Result<T> success(T data, String message) {
        Result<T> result = success();
        result.setData(data);
        result.setMessage(message);
        return result;
    }

    public static <T> Result<T> failure() {
        Result<T> result = new Result<>();
        result.setSuccess(false);
        result.setCode(HttpStatus.INTERNAL_SERVER_ERROR.value());
        return result;
    }

    public static <T> Result<T> failure(T data) {
        Result<T> result = failure();
        result.setData(data);
        return result;
    }

    public static <T> Result<T> failure(String message) {
        Result<T> result = failure();
        result.setMessage(message);
        return result;
    }

    public static <T> Result<T> failure(T data, String message) {
        Result<T> result = failure();
        result.setData(data);
        result.setMessage(message);
        return result;
    }
}
