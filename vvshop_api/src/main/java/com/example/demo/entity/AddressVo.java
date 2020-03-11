package com.example.demo.entity;

public class AddressVo {
    private  Integer id;
    //会员ID
    private Integer user_id;
    //收货人姓名
    private String user_name;
    //手机
    private String tel_number;
    private String detail_Info;
    private String region;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getDetail_Info() {
        return detail_Info;
    }

    public void setDetail_Info(String detail_Info) {
        this.detail_Info = detail_Info;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getTel_number() {
        return tel_number;
    }

    public void setTel_number(String tel_number) {
        this.tel_number = tel_number;
    }
}
