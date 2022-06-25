package com.example.isportmartapi.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author mahao
 * @since 2022-06-25
 */
@Data
@TableName("`user`")
public class User implements Serializable {

    private static final long serialVersionUID = 5903592985493117550L;

    @TableId(value = "`userId`", type = IdType.AUTO)
    private Integer userId;

    @TableField("userName")
    private String userName;

    @TableField("pwd")
    private String pwd;

    @TableField("status")
    private String status;

    @TableField("qq")
    private String qq;

    @TableField("registerTime")
    private LocalDateTime registerTime;
}
