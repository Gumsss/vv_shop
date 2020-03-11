package com.example.demo.controller;

import com.example.demo.annotation.Authorize;
import com.example.demo.entity.AddressVo;
import com.example.demo.entity.GoodsVo;
import com.example.demo.service.ApiAddressService;
import com.example.demo.service.ApiGoodsService;
import com.example.demo.service.ApiUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "收货地址接口")
@RestController
@Authorize
@RequestMapping("/address")
public class ApiAddressController {
    @Autowired
    private ApiAddressService addressService;
    @Autowired
    private ApiUserService apiUserService;
    @Autowired
    private ApiGoodsService apiGoodsService;
    /**
     * 添加收货地址
     */
    @ApiOperation(value = "添加收货地址")
    @PostMapping(value ="save")
    public Object save( AddressVo address) {
        Map resultObj = new HashMap();
        if (null != address) {
            addressService.save(address);
        }
        resultObj.put("address", address);
        resultObj.put("msg", "添加成功");
       return resultObj;
    }

    /**
     * 获取用户的收货地址
     */
    @ApiImplicitParams({@ApiImplicitParam(name = "user_id", value = "用户id", paramType = "path", required = true)})
    @ApiOperation(value = "获取用户的收货地址接口")
    @GetMapping("lists")
    public Object list(Integer user_id) {
        Map resultObj = new HashMap();
        List<AddressVo> addressEntities = addressService.queryList(user_id);
        Integer id = addressService.queryAddress_Id(user_id);
        resultObj.put("default_id",id);
        resultObj.put("list", addressEntities);
        return  resultObj;
    }

    /**
     * 删除指定的收货地址
     */
    @ApiImplicitParams({@ApiImplicitParam(name = "id", value = "地址id", paramType = "path", required = true)})
    @ApiOperation(value = "删除指定的收货地址")
    @PostMapping("delete")
    public Object delete(Integer id) {
        Map resultObj = new HashMap();
        addressService.delete(id);
        resultObj.put("msg", "添加成功");
        return resultObj;
    }

    /**
     * 获取收货地址的详情
     */
    @ApiOperation(value = "获取收货地址的详情")
    @ApiImplicitParams(@ApiImplicitParam(name = "id", value = "收货地址ID", required = true, dataType = "Integer"))
    @GetMapping("detail")
    public Object detail(Integer id) {
        AddressVo entity = addressService.queryObject(id);
        return entity;
    }

    /**
     * 默认地址
     */
    @ApiOperation(value = "设置为默认地址")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user_id", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "id", value = "收货地址ID", required = true, dataType = "Integer")})
    @PostMapping("setDefault")
    public Object setDefault(Integer id,Integer user_id) {
        Map req = new HashMap();
        req.put("id",id);
        req.put("user_id",user_id);
        addressService.setDefault(req);
        Map resultObj = new HashMap();
        resultObj.put("msg", "添加成功");
        return resultObj;
    }

    /**
     * 保存更改的地址
     */
    @ApiOperation(value = "edit")//, response = Map.class)
    @PostMapping(value ="edit")
    public Object update(AddressVo addressVo) {
        Map resultObj = new HashMap();
        addressService.updata(addressVo);
        resultObj.put("msg", "修改成功");
        return resultObj;
    }

    /**
     * 在购物车跳转到订单确认
     */
    @ApiOperation(value = "购物车跳转到订单确认")
    @ApiImplicitParams(@ApiImplicitParam(name = "user_id", value = "用户ID", required = true, dataType = "Integer"))
    @GetMapping("check")
    public Object check(Integer user_id) {
        Map resultObj = new HashMap();
        Integer id =  apiUserService.queryByUser_id(user_id);
        AddressVo address = addressService.queryObject(id);
        resultObj.put("address", address);
        return resultObj;
    }

    /**
     * 在商品详情立即购买 跳转到订单确认
     */
    @ApiOperation(value = "商品详情跳转到订单确认")
    @ApiImplicitParams( {
            @ApiImplicitParam(name = "user_id", value = "用户ID", required = true, dataType = "Integer"),
            @ApiImplicitParam(name = "goods_id", value = "用户ID", required = true, dataType = "Integer")
    })
    @GetMapping("goods_check")
    public Object goods_check(Integer goods_id,Integer user_id) {
        Map resultObj = new HashMap();
        GoodsVo entity =  apiGoodsService.queryGoodsDetail(goods_id);
        Integer id =  apiUserService.queryByUser_id(user_id);
        AddressVo address = addressService.queryObject(id);
        resultObj.put("address", address);
        resultObj.put("entity", entity);
        return resultObj;
    }
}
