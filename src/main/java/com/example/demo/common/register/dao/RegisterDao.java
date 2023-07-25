package com.example.demo.common.register.dao;

import com.example.demo.common.register.dto.AddUserFormDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegisterDao {
    //회원 정보 등록
    public int insertMember(AddUserFormDto dto);

}
