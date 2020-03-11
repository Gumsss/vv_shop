package com.example.demo.service;

import com.example.demo.dao.ApiAssessMapper;
import com.example.demo.entity.AssessVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApiAssessService {
    @Autowired
    private ApiAssessMapper assessMapper;
    public void save(AssessVo assess) {
        assessMapper.save(assess);
    }
    public AssessVo queryAssess(String order_no) {
        return assessMapper.queryObject(order_no);
    }
}
