package com.example.CRM_system.settings.service;

import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.UserReq;

import java.util.List;
import java.util.Map;

public interface UserService {
    User getUserByLoginActAndPwd(Map<String, Object> map);

    List<User> getUserList();

    boolean updatePwd(String id, String loginPwd); //修改密码

    boolean updatePersonInformation(User user); //修改个人信息

    User getUserById(String id);    //根据id查询用户

    PaginationVO<User> getUserListAndNotIncludeCurrentUser(UserReq userReq);    //查询除当前用户以外的用户列表

    boolean addAct(User user);  //添加新账户

    boolean deleteAct(String id);   //删除

    boolean editActByManage(User user); //管理员修改
}
