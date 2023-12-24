package com.example.CRM_system.settings.service.impl;

import com.example.CRM_system.settings.dao.UserDao;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.settings.service.UserService;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.UserReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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

    /**
     * 修改密码
     * @param id
     * @param loginPwd
     * @return
     */
    @Override
    public boolean updatePwd(String id, String loginPwd) {
        try {
            userDao.updatePwd(id, loginPwd);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 修改个人信息
     * @param user
     * @return
     */
    @Override
    public boolean updatePersonInformation(User user) {
        try {
            userDao.updatePersonInformation(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Override
    public User getUserById(String id) {
        User user = userDao.getUserById(id);

        return user;
    }

    /**
     * 查询除当前用户以外的用户列表
     * @param userReq
     * @return
     */
    @Override
    public PaginationVO<User> getUserListAndNotIncludeCurrentUser(UserReq userReq) {
        int total = userDao.getUserListAndNotIncludeCurrentUserTotal(userReq);
        List<User> users = userDao.getUserListAndNotIncludeCurrentUser(userReq);

        PaginationVO<User> paginationVO = new PaginationVO<>();
        paginationVO.setTotal(total);
        paginationVO.setDataList(users);

        return paginationVO;
    }

    /**
     * 添加新账户
     * @param user
     * @return
     */
    @Override
    public boolean addAct(User user) {
        try {
            userDao.addAct(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 删除账户
     * @param id
     * @return
     */
    @Override
    public boolean deleteAct(String id) {
        try {
            userDao.deleteAct(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     * 管理员修改
     * @param user
     * @return
     */
    @Override
    public boolean editActByManage(User user) {
        try {
            userDao.editActByManage(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
