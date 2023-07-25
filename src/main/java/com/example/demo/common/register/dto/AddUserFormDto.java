package com.example.demo.common.register.dto;

import java.util.Date;

public class AddUserFormDto {
    private String userId;
    private String password;
    private String userName;
    private String email;
    private Date join_dt;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getJoin_dt() {
        return join_dt;
    }

    public void setJoin_dt(Date join_dt) {
        this.join_dt = join_dt;
    }
}
