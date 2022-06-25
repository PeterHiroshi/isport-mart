package com.example.isportmartapi.service;

import com.example.isportmartapi.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void list() {
        List<User> userList = userService.list();
        Assert.assertNotNull(userList);
        log.info("[list]: userList={}", userList);
    }

}