package com.example.demo.service;

import com.example.demo.dao.ApiOrderDetailMapper;
import com.example.demo.entity.OrderDetailVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ApiOrderDetailService {
    @Autowired
    private ApiOrderDetailMapper orderDetailDao;
    public void saveDetail(OrderDetailVo orderDetail) {
        orderDetailDao.saveDetail(orderDetail);
    }
    public List<OrderDetailVo> queryList(Map req) {
        return orderDetailDao.queryList(req);
    }
    public void delete(String order_no) {
        orderDetailDao.delete(order_no);
    }
    public List<OrderDetailVo> queryListGetOrder_no(Integer goods_id) {
        return orderDetailDao.queryListGetOrder_no(goods_id);
    }
}
