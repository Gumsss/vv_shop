package com.example.demo.utils;

import java.util.Date;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
public   class JWTutils {
    //过期时间
    public static String getToken(String user_id,String session_key,String password) {
        String token="";
        token= JWT.create()
                .withKeyId(user_id)
                .withIssuer("www.ikertimes.com")
                .withIssuedAt(new Date())
                .withJWTId("jwt.ikertimes.com")
                .withClaim("session_key", session_key)
                .withAudience(user_id)
                .sign(Algorithm.HMAC256(password));
        return token;
    }
}
