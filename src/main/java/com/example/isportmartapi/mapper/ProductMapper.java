package com.example.isportmartapi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.isportmartapi.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @author mahao
 * @since 2022-06-26
 */
@Mapper
@Repository
public interface ProductMapper extends BaseMapper<Product> {
}