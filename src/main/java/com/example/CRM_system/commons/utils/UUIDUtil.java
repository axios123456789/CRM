package com.example.CRM_system.commons.utils;

import java.util.UUID;

//获取唯一标识
public class UUIDUtil {
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }
}
