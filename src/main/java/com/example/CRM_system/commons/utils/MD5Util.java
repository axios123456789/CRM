package com.example.CRM_system.commons.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//MD5的方式对密码加密
public class MD5Util {
    public static String getMD5(String password){
        try {
            //得到一个信息摘要器
            MessageDigest digest = MessageDigest.getInstance("md5");
            byte[] result = digest.digest(password.getBytes());
            StringBuffer buffer = new StringBuffer();

            //把每一个byte做一个与运算 0xff；
            for (byte b : result){
                //与运算
                int number = b & 0xff;  //加盐
                String str = Integer.toHexString(number);
                if (str.length() == 1){
                    buffer.append("0");
                }
                buffer.append(str);
            }

            //标准的md5加密后结果
            return buffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }
}
