package com.example.CRM_system.settings.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.settings.pojo.DicValue;
import com.example.CRM_system.settings.service.DicService;
import com.example.CRM_system.settings.service.impl.DicServiceImpl;
import com.example.CRM_system.commons.utils.ServiceFactory;
import com.example.CRM_system.commons.utils.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class DicValueController{
    @Autowired
    private DicService dicService;

    //条件查询字典值列表
    @RequestMapping("/settings/dicValue/getValueByCondition.do")
    @ResponseBody
    private Result getValueByCondition(String code) {
        System.out.println("进入到条件查询字典值操作");

        List<DicValue> dicValues = dicService.getValueByCondition(code);

        return Result.success(dicValues);
    }

    //根据id查询字典值
    @RequestMapping("/settings/dicValue/getValueById.do")
    @ResponseBody
    private Result getValueById(String id) {
        System.out.println("进入根据id查询字典值操作");

        DicValue dicValue = dicService.getValueById(id);

        return Result.success(dicValue);
    }

    //添加或修改字典值
    @PostMapping("/settings/dicValue/save.do")
    @ResponseBody
    private Result saveValue(DicValue dicValue) {
        System.out.println("进入添加或修改字典值操作");

        if (dicValue.getId() == null || dicValue.getId() == ""){
            dicValue.setId(UUIDUtil.getUUID());
        }

        boolean flag = dicService.saveValue(dicValue);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","添加或修改失败");
        }
    }

    //根据id删除字典值
    @PostMapping("/settings/dicValue/delValueByIds.do")
    @ResponseBody
    private Result deleteValueByIds(String[] ids) {
        System.out.println("进入根据id删除字典值操作");

        boolean flag = dicService.deleteValueByIds(ids);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","删除失败");
        }
    }

}
