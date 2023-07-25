package com.example.demo.common.product.controlller;

import com.example.demo.common.product.dto.ProductDTO;
import com.example.demo.common.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class ProductController {

    private ProductService productService;

    @Autowired
    public ProductController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/")
    public String productList(ProductDTO productDTO, Model model){
        Map<String,Object> resultMap = productService.getProductList(productDTO);
        model.addAllAttributes(resultMap);

        return "common/home/home";
    }

    /**
     * 상품 상세 페이지 연결 Controller
     */

    @GetMapping("/product/detail")
    public String getProductDetail(@RequestParam String pNo, Model model) {
        //게시판 상세정보 조회 메서드 호출
        ProductDTO productDTO = productService.getProductDetail(pNo);
        model.addAttribute("product", productDTO);

        return "product/detail";
    }
}
