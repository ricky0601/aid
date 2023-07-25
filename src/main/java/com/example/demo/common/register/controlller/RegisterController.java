package com.example.demo.common.register.controlller;

import com.example.demo.common.register.dto.AddUserFormDto;
import com.example.demo.common.register.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {

    RegisterService service;

    @Autowired
    public RegisterController(RegisterService service){ this.service = service;}

    /**
     * 회원 등록 페이지 연결 Controller Method
     */
    @GetMapping("/sw/newUser")
    public String addUserForm(){
        return "common/register/addUserForm";
    }
    /**
     * 회원 등록 Controller Method
     */
    @PostMapping("/sw/newUser")
    public String addUser(AddUserFormDto dto) {
        // 회원 정보 등록 Service 메서드 호출
        service.addMember(dto);

        return "common/login/login";

    }

}
