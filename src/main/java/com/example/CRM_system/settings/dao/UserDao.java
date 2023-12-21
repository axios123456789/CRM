package com.example.CRM_system.settings.dao;

import com.example.CRM_system.settings.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
import java.util.Map;

public interface UserDao {
    //根据登录信息进行条件查询
    User getUserByLoginActAndPwd(Map<String, Object> map);

    //查询用户表的所有信息
    List<User> getUserList();

    //修改密码
    void updatePwd(String id, String loginPwd);

    //修改个人信息
    void updatePersonInformation(User user);

    //根据id查询用户
    @Select("select * from c_user where id = #{id};")
    User getUserById(String id);
}
