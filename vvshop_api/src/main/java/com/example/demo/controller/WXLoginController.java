package com.example.demo.controller;

import com.example.demo.entity.UserVo;
import com.example.demo.service.ApiUserService;
import com.example.demo.utils.AESCBCUtil;
import com.example.demo.utils.HttpRequestUtil;
import com.example.demo.utils.JWTutils;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/wXLoginController")
public class WXLoginController {
    @Autowired
    private ApiUserService apiUserService;
    @RequestMapping( method = RequestMethod.POST)
    @ResponseBody
    public Map decodeUserInfo(String encryptedData, String iv, String code) {
        Map map = new HashMap();
        // 登录凭证不能为空
        if (code == null || code.length() == 0) {
            map.put("status", 0);
            map.put("msg", "code 不能为空");
            return map;
        }
        // 小程序唯一标识 (在微信小程序管理后台获取)
        String wxspAppid = "wx3e38049d2c409a3c";
        // 小程序的 app secret (在微信小程序管理后台获取)
        String wxspSecret = "a6238ed9f4f0fd367b98363598b74f89";
        // 授权（必填）
        String grant_type = "authorization_code";
        // 请求参数
        String params = "appid=" + wxspAppid + "&secret=" + wxspSecret + "&js_code=" + code + "&grant_type="
                + grant_type;
        // 发送请求
        String sr = HttpRequestUtil.sendGet("https://api.weixin.qq.com/sns/jscode2session", params);
        // 解析相应内容（转换成json对象）
        try {
        JSONObject json = JSONObject.fromObject(sr);
        // 获取会话密钥（session_key）
        String session_key = json.get("session_key").toString();
        // 用户的唯一标识（openid）
        String open_id = (String) json.get("openid");

            UserVo userVo = apiUserService.queryByOpenId(open_id);
            String result = AESCBCUtil.decrypt(encryptedData,session_key,iv,"UTF-8");
            if (null != result && result.length() > 0) {
                map.put("status", 1);
                map.put("msg", "解密成功");
                JSONObject userInfoJSON =  JSONObject.fromObject(result);
                if (null == userVo) {
                    userVo = new UserVo();
                    String nickName = userInfoJSON.get("nickName").toString();
                    Integer gender = Integer.parseInt(userInfoJSON.get("gender").toString());
                    String country = userInfoJSON.get("country").toString();
                    String province = userInfoJSON.get("province").toString();
                    String city = userInfoJSON.get("city").toString();
                   Integer address_id = 1;
                    userVo.setOpen_id(open_id);
                    userVo.setNickName(nickName);
                    userVo.setGender(gender);
                    userVo.setCountry(country);
                    userVo.setProvince(province);
                    userVo.setCity(city);
                    userVo.setAddress_id(address_id);
                    apiUserService.save(userVo);
                } else {

                }
                map.put("userVo",userVo);
                String  userId = userVo.getUser_id().toString();
                String  password = userVo.getOpen_id();
                String token = JWTutils.getToken(userId,session_key,password);
                map.put("token",token);

            } else {
                map.put("status", 0);
                map.put("msg", "解密失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
