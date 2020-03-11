package com.example.demo.service;

import com.example.demo.dao.ApiCategoryMapper;
import com.example.demo.entity.CategoryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class ApiCategoryService {
    @Autowired
    private  ApiCategoryMapper categoryMapper;
    public List<CategoryVo> queryCategorySpe() {
        return categoryMapper.queryCategorySpe();
    }
}
