package com.example.demo.admin.product.controller;

import com.example.demo.admin.product.dto.ApDto;
import com.example.demo.admin.product.service.ApService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApController {

    /*
    private ApService service;

    @Autowired
    public ApController(ApService service){
        this.service = service;
    } */
    @GetMapping("/admin-menu")
    public String adminMenu(){
        return "admin/admin-menu";
    }
}
