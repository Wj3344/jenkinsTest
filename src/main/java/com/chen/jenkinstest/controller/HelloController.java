package com.chen.jenkinstest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by handsome programmer.
 * User: chen
 * Date: 2019/4/3
 * Time: 19:50
 * Description:
 *
 * @author chen
 */
@Controller
public class HelloController {

    @GetMapping("/hello")
    @ResponseBody
    public String hello() {
        return "hello test";
    }
}
