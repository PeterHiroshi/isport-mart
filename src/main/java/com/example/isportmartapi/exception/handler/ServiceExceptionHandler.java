package com.example.isportmartapi.exception.handler;

import com.example.isportmartapi.exception.ServiceException;
import com.example.isportmartapi.model.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author mahao
 * @since 2022-06-26
 */
@RestControllerAdvice
@Slf4j
public class ServiceExceptionHandler {

    @ExceptionHandler(ServiceException.class)
    public Result<?> handleJeecgBootException(ServiceException e){
        log.error(e.getMessage(), e);
        return Result.failure(e.getMessage());
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public Result<?> handleDuplicateKeyException(DuplicateKeyException e){
        log.error(e.getMessage(), e);
        return Result.failure("Duplicated data in database");
    }
}
