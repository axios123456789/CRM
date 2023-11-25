package com.example.CRM_system.settings.service;

import com.example.CRM_system.settings.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User getUserByLoginActAndPwd(Map<String, Object> map);

    List<User> getUserList();
}
