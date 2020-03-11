package com.example.demo.service;

import com.example.demo.dao.ApiGoodsMapper;
import com.example.demo.entity.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApiCategory_detService {
    @Autowired
    private ApiGoodsMapper goodsDao;
    public List<GoodsVo> queryCategoryList(Integer cate_id) {
        return goodsDao.queryCategoryList(cate_id);
    }
}
