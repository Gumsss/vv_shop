package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.entity.AddressVo;
import com.example.demo.entity.GoodsVo;
import com.example.demo.entity.OrderDetailVo;
import com.example.demo.entity.OrderVo;
import com.example.demo.service.ApiOrderDetailService;
import com.example.demo.service.ApiOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Api(tags = "订单接口")
@RestController
@RequestMapping(value = "/order")
public class ApiOrderController {

   @Autowired
   private ApiOrderService  apiOrderService;
   @Autowired
   private ApiOrderDetailService orderDetailService;

    /**
     * 创建订单（购物车）
     */
    @ApiOperation(value = "从购物车提交订单")
    @PostMapping(value="create_cart",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object create_cart(@RequestBody String str) {
        Map resultObj = new HashMap();

        //从str获取前端传递过来的参数
        Integer user_id = Integer.parseInt(JSON.parseObject(str).get("user_id").toString());
        Integer totalMoney = Integer.parseInt(JSON.parseObject(str).get("totalMoney").toString());
        AddressVo address = JSON.parseObject(JSON.parseObject(str).getString("address"), AddressVo.class);
        List <GoodsVo> goodList = JSON.parseArray(JSON.parseObject(str).getString("cart"), GoodsVo.class);

        //从地址VO获取相关参数
         String user_name = address.getUser_name();
         String tel_number = address.getTel_number();
         String detail_Info = address.getDetail_Info();
         String region= address.getRegion();
        LocalDateTime time= LocalDateTime.now();
        DateTimeFormatter dtf= DateTimeFormatter.ofPattern("yyMMddhhmmss");
        Random rd=new Random(System.currentTimeMillis());
        int num=100+rd.nextInt(900);
        String order_no=dtf.format(time)+String.valueOf(num);

        //将订单数据存放进order数据库
        OrderVo order=new OrderVo();
        order.setOrder_no(order_no);
        order.setUser_id(user_id);
        order.setTotal_price(totalMoney);
        order.setPay_status(10);
        order.setExpress_price(10);
        order.setAssess_status(10);
        order.setOrder_status(10);
        order.setUser_name(user_name);
        order.setTel_number(tel_number);
        order.setDetail_Info(detail_Info);
        order.setRegion(region);
        order.setCreate_time(time);
        apiOrderService.save(order);

        //将订单数据存放进order_detail数据库
        List<OrderDetailVo> OrderDetailList = new ArrayList<OrderDetailVo>();
        for (GoodsVo goods : goodList) {
            Integer goods_id = goods.getGoods_id();
            Integer count = goods.getCount();
            String goods_name = goods.getGoods_name();
            String goods_img_url = goods.getGoods_img_url();
            BigDecimal counter_price = goods.getCounter_price();
            OrderDetailVo orderDetail = new OrderDetailVo();
            orderDetail.setGoods_id(goods_id);
            orderDetail.setCount(count);
            orderDetail.setOrder_no(order_no);
            orderDetail.setGoods_name(goods_name);
            orderDetail.setGoods_img_url(goods_img_url);
            orderDetail.setCounter_price(counter_price);
            orderDetail.setUser_id(user_id);
            OrderDetailList.add( orderDetail);
        }
        for (OrderDetailVo orderDetail : OrderDetailList){
            orderDetailService.saveDetail(orderDetail);
        }
        resultObj.put("OrderDetailList", OrderDetailList);
        resultObj.put("ok","ok");
        resultObj.put("order", order);
        return  resultObj;
    }

    @ApiOperation(value = "从商品详情直接购买提交订单")
    @PostMapping(value="buyNow",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object buyNow(@RequestBody String str) {
        Map resultObj = new HashMap();
        //从str获取前端传递过来的参数

        Integer user_id = Integer.parseInt(JSON.parseObject(str).get("user_id").toString());
        Integer totalMoney = Integer.parseInt(JSON.parseObject(str).get("totalMoney").toString());
        AddressVo address = JSON.parseObject(JSON.parseObject(str).getString("address"), AddressVo.class);
        GoodsVo goods = JSON.parseObject(JSON.parseObject(str).getString("cart"), GoodsVo.class);
        Integer goods_num = Integer.parseInt(JSON.parseObject(str).get("goods_num").toString());

        //从地址VO获取相关参数
        String user_name = address.getUser_name();
        String tel_number = address.getTel_number();
        String detail_Info = address.getDetail_Info();
        String region= address.getRegion();
        LocalDateTime time= LocalDateTime.now();
        DateTimeFormatter dtf= DateTimeFormatter.ofPattern("yyMMddhhmmss");
        Random rd=new Random(System.currentTimeMillis());
        int num=100+rd.nextInt(900);
        String order_no=dtf.format(time)+String.valueOf(num);

        //将订单数据存放进order数据库
        OrderVo order=new OrderVo();
        order.setOrder_no(order_no);
        order.setUser_id(user_id);
        order.setTotal_price(totalMoney);
        order.setPay_status(10);
        order.setExpress_price(10);
        order.setAssess_status(10);
        order.setOrder_status(10);
        order.setUser_name(user_name);
        order.setTel_number(tel_number);
        order.setDetail_Info(detail_Info);
        order.setRegion(region);
        order.setCreate_time(time);
        apiOrderService.save(order);

        //将订单数据存放进order_detail数据库
        List<OrderDetailVo> OrderDetailList = new ArrayList<OrderDetailVo>();
            Integer goods_id = goods.getGoods_id();
            Integer count = goods_num;
            String goods_name = goods.getGoods_name();
            String goods_img_url = goods.getGoods_img_url();
            BigDecimal counter_price = goods.getCounter_price();
            OrderDetailVo orderDetail = new OrderDetailVo();
            orderDetail.setGoods_id(goods_id);
            orderDetail.setCount(count);
            orderDetail.setOrder_no(order_no);
            orderDetail.setGoods_name(goods_name);
            orderDetail.setGoods_img_url(goods_img_url);
            orderDetail.setCounter_price(counter_price);
            orderDetail.setUser_id(user_id);
            OrderDetailList.add( orderDetail);

        for (OrderDetailVo orderDetailVo : OrderDetailList){
            orderDetailService.saveDetail(orderDetailVo);
        }
        resultObj.put("OrderDetailList", OrderDetailList);
        resultObj.put("ok","ok");
        resultObj.put("order", order);
        return  resultObj;
    }

    /**
     * 获取用户的订单
     */
    @ApiImplicitParams({
            @ApiImplicitParam(name = "dataType", value = "订单状态", paramType = "path", required = true),
            @ApiImplicitParam(name = "user_id", value = "用户id", paramType = "path", required = true)
    })
    @ApiOperation(value = "获取用户的订单")
    @GetMapping("lists")
    public Object list(String dataType,Integer user_id) {

        Map resultObj = new HashMap();
        Integer order_status;
        Map req = new HashMap();
        //判断用户想要查询的订单状态
        if(!dataType.equals("all")){
         if (dataType.equals("payment")) {
                order_status = 10;
                req.put("order_status", order_status);
            } else if (dataType.equals("delivery")) {
                order_status = 20;
                req.put("order_status", order_status);
            } else if (dataType.equals("received")) {
                order_status = 30;
                req.put("order_status", order_status);
            }
            req.put("user_id", user_id);
            List<OrderVo> orderVos = apiOrderService.queryList(req);
        for (OrderVo item :orderVos) {
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_no", item.getOrder_no());
            List<OrderDetailVo> goodsList = orderDetailService.queryList(orderGoodsParam);
            item.setSuborderList(goodsList);
        }
        resultObj.put("list", orderVos);
        return resultObj;
        }
        else{
            req.put("user_id", user_id);
            List<OrderVo> orderVos = apiOrderService.queryAllList(req);
            for (OrderVo item :orderVos) {
                Map orderGoodsParam = new HashMap();
                orderGoodsParam.put("order_no", item.getOrder_no());
                List<OrderDetailVo> goodsList = orderDetailService.queryList(orderGoodsParam);
                item.setSuborderList(goodsList);
            }
            resultObj.put("list", orderVos);
            return resultObj;
        }
    }

    /**
     * 取消订单
     */
    @ApiOperation(value = "取消订单")
    @PostMapping("cancel")
    public Object cancel(Integer id) {

        Map resultObj = new HashMap();
        try {
             apiOrderService.delete(id);
             String order_no = apiOrderService.queryOrder_no(id);
             orderDetailService.delete(order_no);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resultObj.put("ok","ok");
        return resultObj;
    }

    /**
     * 为订单付款，改变订单状态
     */
    @ApiOperation(value = "付款")
    @PostMapping("updatePay")
    @ApiImplicitParam(name = "id", value = "用户id", paramType = "path", required = true)
    public Object update(Integer id) {
        Map resultObj = new HashMap();
        try {
            apiOrderService.update(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resultObj.put("ok","ok");
        return resultObj;
    }

    /**
     * 确认收货
     */
    @ApiOperation(value = "收货")
    @PostMapping("updateFin")
    @ApiImplicitParam(name = "id", value = "用户id", paramType = "path", required = true)
    public Object updateFin(Integer id) {
        Map resultObj = new HashMap();
        try {
            apiOrderService.updateFin(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resultObj.put("ok","ok");
        return resultObj;
    }

    /**
     * 获取订单详情
     */
    @ApiOperation(value = "订单详情")
    @GetMapping("detail")
    @ApiImplicitParam(name = "id", value = "订单id", paramType = "path", required = true)
    public Object detail(Integer id) {
        Map resultObj = new HashMap();
            OrderVo orderInfo = apiOrderService.queryObject(id);
            String order_no = orderInfo.getOrder_no();
            Map orderGoodsParam = new HashMap();
            orderGoodsParam.put("order_no", order_no);
            List<OrderDetailVo> orderGoods = orderDetailService.queryList(orderGoodsParam);
           Integer total_num =0;
        for (OrderDetailVo orderGoodsEntity : orderGoods) {
            total_num += orderGoodsEntity.getCount();
        }
        resultObj.put("total_num", total_num);
            orderInfo.setSuborderList(orderGoods);
            resultObj.put("orderInfo",orderInfo);
        return resultObj;
    }
}
