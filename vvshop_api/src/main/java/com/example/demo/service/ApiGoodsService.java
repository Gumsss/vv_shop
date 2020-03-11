package com.example.demo.service;

import com.example.demo.dao.ApiGoodsMapper;
import com.example.demo.entity.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ApiGoodsService {
      @Autowired
      private ApiGoodsMapper goodsDao;
      public List<GoodsVo> queryGoodsList() {
        return goodsDao.queryGoodsList();
      }
      public List<GoodsVo> queryHotList() {
        return goodsDao.queryHotList();
      }
      public GoodsVo queryGoodsDetail(Integer id) {
        return goodsDao.queryGoodsDetail(id);
      }
}

