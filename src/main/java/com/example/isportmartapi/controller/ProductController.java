package com.example.isportmartapi.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.isportmartapi.entity.Product;
import com.example.isportmartapi.model.Result;
import com.example.isportmartapi.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author mahao
 * @since 2022-06-26
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/page")
    public Result<IPage<Product>> pageProducts(@RequestParam(value = "pageNo", required = false, defaultValue = "1") Long pageNo,
                                               @RequestParam(value = "pageSize", required = false, defaultValue = "10") Long pageSize) {
        Page<Product> productPage = productService.pageProducts(pageNo, pageSize);
        return Result.success(productPage);
    }
}
