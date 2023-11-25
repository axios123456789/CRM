package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.ServiceFactory;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.workbench.pojo.ActivityRemark;
import com.example.CRM_system.workbench.service.ActivityRemarkService;
import com.example.CRM_system.workbench.service.ActivityService;
import com.example.CRM_system.workbench.service.impl.ActivityRemarkServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;
import java.io.IOException;
import java.util.List;

@Controller
public class ActivityRemarkController extends HttpServlet {
    @Autowired
    private ActivityRemarkService activityRemarkService;

    //根据外键id（activityId）查询市场活动备注信息
    @RequestMapping("/workbench/activityRemark/getRemarkByAid.do")
    @ResponseBody
    private Result getRemarkByAid(String id) {
        System.out.println("进入根据外键id查询备注信息操作");

        List<ActivityRemark> activityRemarks = activityRemarkService.getRemarkByAid(id);

        return Result.success(activityRemarks);
    }

    //添加或修改市场活动备注信息
    @PostMapping("/workbench/activityRemark/save.do")
    @ResponseBody
    private Result remarkSave(ActivityRemark activityRemark, HttpServletRequest req){
        System.out.println("进入添加或修改备注信息操作");

        if (activityRemark.getId() == null || activityRemark.getId() == ""){//添加
            String createTime = DateTimeUtil.getSysTime();
            String createBy = ((User) req.getSession().getAttribute("user")).getName();
            String editFlag = "0";
            activityRemark.setId(UUIDUtil.getUUID());
            activityRemark.setCreateTime(createTime);
            activityRemark.setCreateBy(createBy);
            activityRemark.setEditFlag(editFlag);
        }else {//修改
            String editTime = DateTimeUtil.getSysTime();
            String editBy = ((User) req.getSession().getAttribute("user")).getName();
            String editFlag = "1";
            activityRemark.setEditTime(editTime);
            activityRemark.setEditBy(editBy);
            activityRemark.setEditFlag(editFlag);
        }

        boolean flag = activityRemarkService.saveRemark(activityRemark);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改失败");
        }
    }

    //删除备注
    @PostMapping("/workbench/activityRemark/delete.do")
    @ResponseBody
    private Result remarkDelete(String id) {
        System.out.println("进入删除备注操作");

        boolean flag = activityRemarkService.deleteRemark(id);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","删除失败");
        }
    }

    //根据id查询备注信息
    @RequestMapping("/workbench/activityRemark/getRemarkById.do")
    @ResponseBody
    private Result getRemarkById(String id) {
        System.out.println("进入根据id查询市场活动备注信息操作");

        ActivityRemark activityRemark = activityRemarkService.getRemarkById(id);

        return Result.success(activityRemark);
    }
}
