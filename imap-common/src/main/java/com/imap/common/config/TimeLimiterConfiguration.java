package com.imap.common.config;

import io.github.resilience4j.timelimiter.TimeLimiter;
import io.github.resilience4j.timelimiter.TimeLimiterConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;

/**
 * @Author: Weizhi
 * @Date: create in 2023/3/21 2:35
 * @Description:
 */
//@Configuration
public class TimeLimiterConfiguration {

    @Value("${resilience4j.timelimiter.timeoutDuration}")
    private Duration timeoutDuration;

    @Value("${resilience4j.timelimiter.cancelRunningFuturee}")
    private boolean cancelRunningFuture;

    @Bean
    public TimeLimiter timeLimiter(){
        return TimeLimiter.of(timeLimiterConfig());
    }

    private TimeLimiterConfig timeLimiterConfig(){
        return TimeLimiterConfig.custom()
                .timeoutDuration(timeoutDuration)
                .cancelRunningFuture(cancelRunningFuture).build();
    }
}
