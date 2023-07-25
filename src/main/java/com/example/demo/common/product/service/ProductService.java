package com.example.demo.common.product.service;

import com.example.demo.common.product.dao.ProductDao;
import com.example.demo.common.product.dto.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    private ProductDao dao;

    @Autowired
    public ProductService(ProductDao dao){
        this.dao = dao;
    }

    /*
    상품 목록 조회 Service Method
     */

    public Map<String, Object> getProductList(ProductDTO productDTO){
        Map<String, Object> resultMap = new HashMap<>();

        try{
            //목록 조회 전 파라미터 설정
            Map<String, Object> paramMap = new HashMap<>();

            List<ProductDTO> productList = dao.selectProductList(paramMap);
            resultMap.put("productList",productList);


        }catch (Exception ex){
            ex.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 상품 상세 정보 조회
     */
    public ProductDTO getProductDetail(String pNo) {
        ProductDTO productDTO = null;
        try {
            //게시판 상세 정보 조회
            productDTO = dao.selectProductInfo(pNo);
        }catch(Exception e) {
            e.printStackTrace();
        }
        return productDTO;
    }
}
