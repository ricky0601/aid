package com.example.demo.common.product.dao;

import com.example.demo.common.product.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductDao {

    //상품 목록 전체 조회
    public List<ProductDTO> selectProductList(Map<String, Object> paramMap);

    //게시판 상세 정보 조회
    public ProductDTO selectProductInfo(String pNo);
}

