package com.example.demo.service;

import com.example.demo.dao.ApiAddressMapper;
import com.example.demo.dao.ApiUserMapper;
import com.example.demo.entity.AddressVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ApiAddressService {
    @Autowired
    private ApiAddressMapper addressDao;
    @Autowired
    private ApiUserMapper apiUserMapper;
    public void save(AddressVo address) {
        addressDao.save(address);
    }
    public List<AddressVo> queryList(Integer user_id) {
        return addressDao.queryList(user_id);
    }
    public void delete(Integer id) {
        addressDao.delete(id);
    }
    public AddressVo queryObject(Integer id) {
        return addressDao.queryObject(id);
    }
    public void setDefault(Map req) {
        addressDao.setDefault(req);
    }
    public  Integer queryAddress_Id(Object id){
        return  apiUserMapper.queryAddress_Id(id);
    }
    public void updata(AddressVo address) {
        addressDao.updata(address);
    }
}
