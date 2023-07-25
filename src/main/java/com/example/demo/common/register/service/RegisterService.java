package com.example.demo.common.register.service;

import com.example.demo.common.register.dao.RegisterDao;
import com.example.demo.common.register.dto.AddUserFormDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {
    private RegisterDao dao;

    @Autowired
    public RegisterService(RegisterDao dao){
        this.dao = dao;
    }

    /*
    회원 정보 등록 Service Method
     */
    public void addMember(AddUserFormDto dto){
        System.out.println("\n[ 회원 정보 등록 Service Method Start ]");

        try{
            //등록용 파라미터 정체 (Dto -> Domain)
            AddUserFormDto afd = new AddUserFormDto();
            afd.setUserId(dto.getUserId());
            afd.setPassword(dto.getPassword());
            afd.setUserName(dto.getUserName());
            afd.setEmail(dto.getEmail());
            afd.setJoin_dt(dto.getJoin_dt());

            //[1] 회원 정보 등록
            int resultCount = dao.insertMember(afd);
            System.out.println("[1] 회원 등록 완료 ( 건수 : "+resultCount+" 건)");
        }catch(Exception e){
            e.printStackTrace();
        }

        System.out.println("[ 회원 정보 등록 Service Method End ]\n");
    }
}
