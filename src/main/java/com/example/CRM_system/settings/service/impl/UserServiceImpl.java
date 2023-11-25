package com.example.CRM_system.settings.service.impl;

import com.example.CRM_system.settings.dao.UserDao;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User getUserByLoginActAndPwd(Map<String, Object> map) {
        User userByLoginActAndPwd = userDao.getUserByLoginActAndPwd(map);

        return userByLoginActAndPwd;
    }

    @Override
    public List<User> getUserList() {
        List<User> userList = userDao.getUserList();

        return userList;
    }
}
