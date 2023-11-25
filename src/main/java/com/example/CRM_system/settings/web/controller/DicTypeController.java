package com.example.CRM_system.settings.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.settings.pojo.DicType;
import com.example.CRM_system.settings.service.DicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class DicTypeController{
    @Autowired
    private DicService dicService;

    //查询字典类型列表
    @RequestMapping("/settings/dicType/getTypeList.do")
    private @ResponseBody Result getTypeList() {
        System.out.println("进入查询字典列表操作");

        List<DicType> dicTypes = dicService.getTypeList();

        return Result.success(dicTypes);
    }

    //修改或添加字典类型
    @PostMapping("/settings/dicType/save.do")
    private @ResponseBody Result save(DicType dicType) {
        System.out.println("进入添加或修改字典类型操作");

        boolean flag = dicService.save(dicType);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","修改或添加失败");
        }
    }

    //根据code查询字典类型
    @RequestMapping("/settings/dicType/getTypeByCode.do")
    private @ResponseBody Result getTypeByCode(String code) {
        System.out.println("进入根据code查询字典类型操作");

        DicType dicType = dicService.getTypeByCode(code);

        return Result.success(dicType);
    }

    //根据id删除字典类型
    @PostMapping("/settings/dicType/delTypeByIds.do")
    private @ResponseBody Result delTypeByIds(String[] codes) {
        System.out.println("进入根据id删除字典类型操作");

        //String[] codes = req.getParameterValues("code");
        System.out.println("codes"+ Arrays.toString(codes));

        boolean flag = dicService.deleteTypeByIds(codes);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","删除失败");
        }
    }
}
