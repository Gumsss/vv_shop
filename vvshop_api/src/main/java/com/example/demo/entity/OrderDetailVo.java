package com.example.demo.entity;

import java.math.BigDecimal;

public class OrderDetailVo {
    private  Integer id;
    private  Integer goods_id;
    private  String order_no;
    private  Integer count;
    private  String goods_name;
    private  String goods_img_url;
    private BigDecimal counter_price;
    private  Integer user_id;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_img_url() {
        return goods_img_url;
    }

    public void setGoods_img_url(String goods_img_url) {
        this.goods_img_url = goods_img_url;
    }

    public BigDecimal getCounter_price() {
        return counter_price;
    }

    public void setCounter_price(BigDecimal counter_price) {
        this.counter_price = counter_price;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}
