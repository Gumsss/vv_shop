package com.example.demo.controller;

import com.example.demo.annotation.IgnoreAuth;
import com.example.demo.entity.AdVo;
import com.example.demo.entity.GoodsVo;
import com.example.demo.service.ApiAdService;
import com.example.demo.service.ApiGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "首页接口文档")
@RestController
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private ApiAdService adService;
    @Autowired
    private ApiGoodsService goodsService;

    @ApiOperation(value = "横幅图片")
    @IgnoreAuth
    @PostMapping(value = "banner")
    public Object banner() {
        Map resultObj = new HashMap();
        List<AdVo> banner = adService.queryList();
        resultObj.put("banner", banner);
        return resultObj;
    }

    @ApiOperation(value = "首页商品展示")
    @IgnoreAuth
    @PostMapping(value = "goods")
    public Object HotGoods() {
        Map resultObj = new HashMap();
        List<GoodsVo> hotGoods = goodsService.queryHotList();
        List<GoodsVo> likeGoods = goodsService.queryGoodsList();
        resultObj.put("hotGoods", hotGoods);
        resultObj.put("goods", likeGoods);
        return resultObj;
    }
}
