package com.example.demo.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderVo {
    private  Integer id;
    private String order_no;
    private  Integer user_id;
    private  Integer total_price;
    private  Integer pay_status;
    private  Integer express_price;
    private  Integer assess_status;
    private  Integer order_status;
    private  String transaction_id;
    private LocalDateTime create_time;
    private String user_name;
    private  String detail_Info;
    private  String tel_number;
    private  String region;
    private List<OrderDetailVo> suborderList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setTotal_price(Integer total_price) {
        this.total_price = total_price;
    }

    public Integer getTotal_price() {
        return total_price;
    }

    public Integer getPay_status() {
        return pay_status;
    }

    public void setPay_status(Integer pay_status) {
        this.pay_status = pay_status;
    }

    public void setExpress_price(Integer express_price) {
        this.express_price = express_price;
    }

    public Integer getExpress_price() {
        return express_price;
    }

    public Integer getAssess_status() {
        return assess_status;
    }

    public void setAssess_status(Integer assess_status) {
        this.assess_status = assess_status;
    }

    public Integer getOrder_status() {
        return order_status;
    }

    public void setOrder_status(Integer order_status) {
        this.order_status = order_status;
    }

    public String getTel_number() {
        return tel_number;
    }

    public void setTel_number(String tel_number) {
        this.tel_number = tel_number;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public void setCreate_time(LocalDateTime create_time) {
        this.create_time = create_time;
    }

    public LocalDateTime getCreate_time() {
        return create_time;
    }

    public void setDetail_Info(String detail_Info) {
        this.detail_Info = detail_Info;
    }

    public String getDetail_Info() {
        return detail_Info;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setSuborderList(List<OrderDetailVo> suborderList) {
        this.suborderList = suborderList;
    }

    public List<OrderDetailVo> getSuborderList() {
        return suborderList;
    }
}
