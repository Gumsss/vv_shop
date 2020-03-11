package com.example.demo.entity;

import java.math.BigDecimal;


public class GoodsVo {
    //图片链接
    private String goods_img_url;
    //主键
    private Integer goods_id;
    //商品类型Id
    private Integer category_id;
    //名称
    private String goods_name;
    //排序
    private Integer goods_sort;
    //删除状态
    private Integer is_delete;
    //专柜价格
    private BigDecimal counter_price;
    //是否新商品
    private Integer is_new;
    //热销
    private Integer is_hot;
    //商品规格
    private  Integer spec_type;
    //库存计算方式
    private  Integer deduct_stock_type;
    //商品详情
    private  String content;
    //实际销量
    private  Integer sales_actual;
    //商品状态
    private Integer goods_status;
    //商品库存
    private  Integer stock_num;
    //商品banner
    private String b_img;
    //商品详情图
    private  String c_img;
    //购买商品数量
    private  Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getStock_num() {
        return stock_num;
    }

    public void setStock_num(Integer stock_num) {
        this.stock_num = stock_num;
    }

    public String getGoods_img_url() {
        return goods_img_url;
    }

    public void setGoods_img_url(String goods_img_url) {
        this.goods_img_url = goods_img_url;
    }

    public Integer getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(Integer goods_id) {
        this.goods_id = goods_id;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public String getGoods_name() {
        return  goods_name;
    }

    public void setGoods_name(String  goods_name) {
        this. goods_name =  goods_name;
    }

    public Integer getGoods_sort() {
        return goods_sort;
    }

    public void setGoods_sort(Integer goods_sort) {
        this.goods_sort = goods_sort;
    }

    public Integer getDeduct_stock_type() {
        return deduct_stock_type;
    }

    public void setDeduct_stock_type(Integer deduct_stock_type) {
        this.deduct_stock_type = deduct_stock_type;
    }

    public Integer getGoods_status() {
        return goods_status;
    }

    public void setGoods_status(Integer goods_status) {
        this.goods_status = goods_status;
    }

    public Integer getSales_actual() {
        return sales_actual;
    }

    public void setSales_actual(Integer sales_actual) {
        this.sales_actual = sales_actual;
    }

    public String getB_img() {
        return b_img;
    }

    public void setB_img(String b_img) {
        this.b_img = b_img;
    }

    public String getC_img() {
        return c_img;
    }

    public void setC_img(String c_img) {
        this.c_img = c_img;
    }

    public Integer getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(Integer is_delete) {
        this.is_delete = is_delete;
    }

    public BigDecimal getCounter_price() {
        return counter_price;
    }

    public void setCounter_price(BigDecimal counter_price) {
        this.counter_price = counter_price;
    }

    public Integer getIs_new() {
        return is_new;
    }

    public void setIs_new(Integer is_new) {
        this.is_new = is_new;
    }

    public Integer getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(Integer is_hot) {
        this.is_hot = is_hot;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getSpec_type() {
        return spec_type;
    }

    public void setSpec_type(Integer spec_type) {
        this.spec_type = spec_type;
    }
}
