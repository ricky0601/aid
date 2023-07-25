package com.example.demo.common.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.demo.common.login.dto.LoginForm;
import com.example.demo.common.login.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

    private LoginService service;

    @Autowired
    public LoginController(LoginService service) {
        this.service = service;
    }

    @GetMapping("/login")
    public String login() {
        return "common/login/login";
    }

    @ResponseBody
    @PostMapping("/login")
    public HashMap<String, Object> loginAjax(LoginForm loginForm, HttpServletRequest request) {
        // login Service 메서드 호출
        HashMap<String, Object> resultMap = service.login(loginForm);

        // 성공 시 Session에 회원 정보 저장
        String result_cd = resultMap.get("result_cd").toString();
        if ("00".equals(result_cd)) {
            // Session 처리
            HttpSession session = request.getSession(); // Session이 없으면 새로 생성한 Session을 반환

            HashMap<String, Object> memberMap = (HashMap<String, Object>) resultMap.get("member");
            session.setAttribute("sMemberId", memberMap.get("USERID"));
            session.setAttribute("sName", memberMap.get("NAME"));
            session.setAttribute("sEmail", memberMap.get("EMAIL"));
            session.setAttribute("sMemberType", memberMap.get("USER_TYPE"));
        }

        return resultMap;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false); // Session이 없으면 null을 반환

        if (session != null) {
            session.invalidate();
        }

        return "redirect:/";
    }
}
