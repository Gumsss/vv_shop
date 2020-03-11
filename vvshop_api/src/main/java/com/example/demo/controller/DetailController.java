package com.example.demo.controller;

import com.example.demo.annotation.IgnoreAuth;
import com.example.demo.entity.*;
import com.example.demo.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "商品详情接口")
@RestController
@RequestMapping("/GoodsDetail")
public class DetailController {
    @Autowired
    private ApiGoodsService goodsService;
    @Autowired
    private ApiBImgService bImgService;
    @Autowired
    private ApiOrderDetailService apiOrderDetailService;
    @Autowired
    private ApiAssessService apiAssessService;

    @ApiOperation(value = "商品的全部详情")
    @IgnoreAuth
    @ApiImplicitParams({@ApiImplicitParam(name = "goods_id", value = "商品id", paramType = "path", required = true)})
    @GetMapping(value = "detail")
    public Object Goods_detail(Integer goods_id) {
        Map resultObj = new HashMap();
        //获取商品详情的内容
        GoodsVo goods_detail = goodsService.queryGoodsDetail(goods_id);
        //获取商品详情的轮播图
        List<B_imgVo> BImgVos = bImgService.queryBImgList(goods_id);
        //获取商品的评论
        List<OrderDetailVo> orderDetailVos = apiOrderDetailService.queryListGetOrder_no(goods_id);
        List order_nos = new ArrayList();
        for(OrderDetailVo aa : orderDetailVos){
            String bb= aa.getOrder_no();
           order_nos.add(bb);
        }
        Map A =new HashMap();
        for(Object a :order_nos ){
            Map AssessVos =new HashMap();
            String order_no =  a.toString();
            AssessVo assessVo  = apiAssessService.queryAssess(order_no);
            AssessVos.put("assessVo",assessVo);
            A.put("A",AssessVos);
        }
        resultObj.put("goods_detail", goods_detail);
        resultObj.put("BImg",BImgVos);
        resultObj.put("AssessVo",A);
        return resultObj;
    }
}
