package com.example.demo.service;

import com.example.demo.dao.ApiOrderMapper;
import com.example.demo.entity.OrderVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ApiOrderService {
    @Autowired
    private ApiOrderMapper OrderDao;
    public void save(OrderVo order) {
        OrderDao.save(order);
    }
    public List<OrderVo> queryList(Map req) {
        return OrderDao.queryList(req);
    }
    public void delete(Integer id) {
        OrderDao.delete(id);
    }
    public String queryOrder_no(Integer id) {
        return OrderDao.queryOrder_no(id);
    }
    public List<OrderVo> queryAllList(Map req) {
        return OrderDao.queryAllList(req);
    }
    public void update(Integer id) {
        OrderDao.update(id);
    }
    public void updateFin(Integer id) {
        OrderDao.updateFin(id);
    }
    public OrderVo queryObject(Integer id) {
        return OrderDao.queryObject(id);
    }
    public void updateAssess(Integer id) {
        OrderDao.updateAssess(id);
    }
}
