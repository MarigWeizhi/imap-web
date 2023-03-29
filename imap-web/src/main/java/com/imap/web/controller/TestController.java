//package com.imap.web.controller;
//
////import org.springframework.retry.annotation.CircuitBreaker;
//import io.github.resilience4j.circuitbreaker.CallNotPermittedException;
//import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * @Author: Weizhi
// * @Date: create in 2023/3/20 23:40
// * @Description:
// */
//@RestController
//@RequestMapping("/test")
//public class TestController {
//
//
//    @CircuitBreaker(name="test",fallbackMethod="testFail")
//    @GetMapping("/")
//    public String test(){
//
//        return "success";
//    }
//
//    public String testFail(Exception e){
//        return e.getMessage();
//    }
//    public String testFail(CallNotPermittedException e){
//        System.out.println(e.getCausingCircuitBreakerName());
//
//        return e.getMessage();
//    }
//
//}
