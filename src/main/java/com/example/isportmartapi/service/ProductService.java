package com.example.isportmartapi.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.isportmartapi.entity.Product;
import com.example.isportmartapi.mapper.ProductMapper;
import org.springframework.stereotype.Service;

/**
 * @author mahao
 * @since 2022-06-26
 */
@Service
public class ProductService extends ServiceImpl<ProductMapper, Product> {
    public Page<Product> pageProducts(Long pageNo, Long pageSize) {
        Page<Product> resultPage = new Page<>(pageNo, pageSize);
        QueryWrapper<Product> queryWrapper = new QueryWrapper<>();
        // 根据viewCount降序排列
        queryWrapper.lambda().orderByDesc(Product::getViewCount);
        return this.baseMapper.selectPage(resultPage, queryWrapper);
    }
}
