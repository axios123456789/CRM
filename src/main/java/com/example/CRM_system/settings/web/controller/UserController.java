package com.example.CRM_system.settings.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.*;
import com.example.CRM_system.settings.pojo.DicValue;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.settings.service.DicService;
import com.example.CRM_system.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private DicService dicService;

    @RequestMapping("/settings/user/login.do")
    public @ResponseBody Result getUserByLoginActAndPwd(String loginAct, String loginPwd, HttpServletRequest req){
        System.out.println("进入登录验证操作");

        //对密码进行加密
        loginPwd = MD5Util.getMD5(loginPwd);

        //封装参数
        Map<String, Object> map = new HashMap<>();
        map.put("loginAct", loginAct);
        map.put("loginPwd", loginPwd);

        //调用service层方法， 查询用户
        User user = userService.getUserByLoginActAndPwd(map);

        if (user == null){//登录失败，用户名或密码错误
            return Result.error("500","用户名或密码错误");
        }else {
            //验证失效时间
            String expireTime = user.getExpireTime();
            String sysTime = DateTimeUtil.getSysTime();
            if (expireTime.compareTo(sysTime) < 0){
                return Result.error("500","账号已过期");
            }

            //判断锁定状态
            String lockState = user.getLockState();
            if ("0".equals(lockState)){
                return Result.error("500","账号被锁定");
            }

            //判断ip地址
            String allowIps = user.getAllowIps();
            String ip = req.getRemoteAddr();
            if (!allowIps.contains(ip)){
                return Result.error("500","IP地址受限");
            }

            //登录成功后将user保存到session域中
            req.getSession().setAttribute("user", user);

            //登陆成功后将数据字典值保存到session中
            Map<String, List<DicValue>> values = dicService.getAll();
            Set<String> set = values.keySet();
            for (String key : set) {
                req.getSession().setAttribute(key, values.get(key));
                System.out.println("values"+req.getSession().getAttribute(key));
            }

            return Result.success();
        }
    }
}
