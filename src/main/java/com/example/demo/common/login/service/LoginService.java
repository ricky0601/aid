package com.example.demo.common.login.service;

import java.util.HashMap;

import com.example.demo.common.login.dao.LoginDao;
import com.example.demo.common.login.dto.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoginService {

    private LoginDao dao;

    @Autowired
    public LoginService(LoginDao dao) {
        this.dao = dao;
    }

    public HashMap<String, Object> login(LoginForm loginForm) {
        HashMap<String, Object> resultMap = new HashMap<>();

        String result_cd = "00";
        String result_msg = "정상";

        try {
            // 파라미터 설정
            HashMap<String, Object> paramMap = new HashMap<>();
            paramMap.put("id", loginForm.getId());
            paramMap.put("password", loginForm.getPassword());

            // [1] 로그인 정보와 일치하는 회원 확인
            HashMap<String, Object> memberMap = dao.selectMemberForLogin(paramMap);
            if (memberMap == null) {
                throw new Exception("일치하는 회원이 없습니다.");
            }

            resultMap.put("member", memberMap);

            // [2] 회원의 최근 로그인 일시 정보 갱신
            dao.updateMemberRecentLoginDatetime(paramMap);

        } catch (Exception ex) {
            result_cd = "99";
            result_msg = ex.getMessage();

            ex.printStackTrace();

        } finally {
            resultMap.put("result_cd", result_cd);
            resultMap.put("result_msg", result_msg);
        }

        return resultMap;
    }
}
