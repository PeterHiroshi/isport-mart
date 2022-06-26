package com.example.isportmartapi.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author mahao
 * @since 2022-06-26
 */
@Data
@TableName("`product`")
public class Product implements Serializable {

    private static final long serialVersionUID = 795549075446940051L;

    @TableId(value = "`id`", type = IdType.AUTO)
    private Integer id;

    @TableField("`productName`")
    private String productName;

    @TableField("`productPrice`")
    private Double productPrice;

    @TableField("`count`")
    private Integer count;

    @TableField("`productLogo`")
    private String productLogo;

    @TableField("`productCity`")
    private String productCity;

    @TableField("`classId`")
    private Integer classId;

    @TableField("`viewCount`")
    private Integer viewCount;
}
