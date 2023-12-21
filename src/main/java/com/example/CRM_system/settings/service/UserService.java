package com.example.CRM_system.settings.service;

import com.example.CRM_system.settings.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User getUserByLoginActAndPwd(Map<String, Object> map);

    List<User> getUserList();

    boolean updatePwd(String id, String loginPwd); //修改密码

    boolean updatePersonInformation(User user); //修改个人信息

    User getUserById(String id);    //根据id查询用户
}
