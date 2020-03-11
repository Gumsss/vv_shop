package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.entity.AssessVo;
import com.example.demo.entity.OrderVo;
import com.example.demo.service.ApiAssessService;
import com.example.demo.service.ApiOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Api(tags = "评价接口")
@RestController
@RequestMapping(value = "/assess")
public class ApiAssessController {
    @Autowired
    private ApiAssessService apiAssessService;
    @Autowired
    private ApiOrderService apiOrderService;

    /**
     * 提交评价
     */
    @ApiOperation(value = "提交评价")
    @PostMapping("post")
    public Object post(@RequestBody String str) {
        Map resultObj = new HashMap();
        Integer id = Integer.parseInt(JSON.parseObject(str).get("id").toString());
        Integer user_id = Integer.parseInt(JSON.parseObject(str).get("user_id").toString());
        String text = JSON.parseObject(str).get("text").toString();
        Integer score = Integer.parseInt(JSON.parseObject(str).get("score").toString());
        LocalDateTime time= LocalDateTime.now();
        try {
        OrderVo orderVo = apiOrderService.queryObject(id);
        String order_no =orderVo.getOrder_no();
        AssessVo assess = new AssessVo();
        assess.setOrder_no(order_no);
        assess.setUser_id(user_id);
        assess.setText(text);
        assess.setScore(score);
        assess.setCreate_time(time);
        apiAssessService.save(assess);
        apiOrderService.updateAssess(id);
        }catch (Exception e) {
            e.printStackTrace();
        }
        resultObj.put("ok","msg");
        return resultObj;
    }
}
