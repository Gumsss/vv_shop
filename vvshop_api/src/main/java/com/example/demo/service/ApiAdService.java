package com.example.demo.service;

import com.example.demo.dao.ApiAdMapper;
import com.example.demo.entity.AdVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ApiAdService {
    @Autowired
    private ApiAdMapper adDao;
    public List<AdVo> queryList() {
        return adDao.queryList();
    }
}
