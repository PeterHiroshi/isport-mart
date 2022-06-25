package com.example.isportmartapi;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;

import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
@Slf4j
public class IsportMartApiApplication {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext configurableApplicationContext
                = SpringApplication.run(IsportMartApiApplication.class, args);
        ConfigurableEnvironment environment = configurableApplicationContext.getEnvironment();
        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = environment.getProperty("server.port");
        String appName = environment.getProperty("spring.application.name");
        String contextPath = environment.getProperty("server.servlet.context-path");
        log.info("------------------------------------");
        log.info("start {} successfully", appName);
        log.info("host:\thttp://{}:{}{}", ip, port, contextPath);
        log.info("------------------------------------");
    }

}
