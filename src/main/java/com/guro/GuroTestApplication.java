package com.guro;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.guro.config.SwaggerConfig;

@Import(SwaggerConfig.class)
@SpringBootApplication
public class GuroTestApplication {
    public static void main(String[] args) {
        SpringApplication.run(GuroTestApplication.class, args);
    }
}