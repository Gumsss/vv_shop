package com.example.demo.service;

import com.example.demo.dao.ApiUserMapper;
import com.example.demo.entity.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApiUserService {
    @Autowired
    private ApiUserMapper apiUserMapper;
    public void save(UserVo userVo) {
        apiUserMapper.save(userVo);
    }
    public UserVo queryByOpenId(String open_id) {
        return apiUserMapper.queryByOpenId(open_id);
    }
    public UserVo queryObject(String user_id) {
        return apiUserMapper.queryObject(user_id);
    }
    public  Integer  queryByUser_id(Integer user_id){
        return apiUserMapper.queryAddress_Id(user_id);
}

}
