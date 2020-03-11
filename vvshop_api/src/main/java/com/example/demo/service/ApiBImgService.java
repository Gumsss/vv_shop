package com.example.demo.service;

import com.example.demo.dao.ApiBImgMapper;
import com.example.demo.entity.B_imgVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ApiBImgService {
    @Autowired
    private ApiBImgMapper goodsBImg;
    public List<B_imgVo> queryBImgList(Integer id) { return goodsBImg.queryBImgList(id);}
}
