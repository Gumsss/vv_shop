package com.example.demo.entity;

import java.io.Serializable;

public class AdVo implements Serializable {
    private static final long serialVersionUID = 1L;

    //主键
    private Integer id;

    //广告名称
    private String name;
    //链接
    private String link;
    //图片
    private String image_url;
    //状态
    private Integer enabled;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

}
