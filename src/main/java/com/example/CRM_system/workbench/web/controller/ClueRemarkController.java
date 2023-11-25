package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.pojo.ClueRemark;
import com.example.CRM_system.workbench.service.ClueRemarkService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/workbench/clueRemark")
public class ClueRemarkController {
    @Autowired
    private ClueRemarkService clueRemarkService;

    //根据线索id查询所有备注
    @GetMapping("/getClueRemark.do")
    public Result getClueRemarkByClueId(String id){
        System.out.println("进入获取线索备注操作");

        List<ClueRemark> clueRemarks = clueRemarkService.getClueRemarkByClueId(id);

        return  Result.success(clueRemarks);
    }

    //添加或修改备注信息
    @PostMapping("/save.do")
    public Result saveClueRemark(ClueRemark clueRemark, HttpSession session){
        System.out.println("进入添加或修改线索备注信息操作");

        if (clueRemark.getId() != null && clueRemark.getId() != ""){//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            String editTime = DateTimeUtil.getSysTime();
            clueRemark.setEditBy(editBy);
            clueRemark.setEditTime(editTime);
            clueRemark.setEditFlag("1");
        }else{//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            String createTime = DateTimeUtil.getSysTime();
            clueRemark.setId(UUIDUtil.getUUID());
            clueRemark.setCreateBy(createBy);
            clueRemark.setCreateTime(createTime);
            clueRemark.setEditFlag("0");
        }

        boolean flag = clueRemarkService.saveClueRemark(clueRemark);

        if (flag){
            return Result.success();
        }else{
            return Result.error("500", "添加或修改有误");
        }
    }

    //根据id查询备注信息
    @GetMapping("/getClueRemarkById.do")
    public Result getClueRemarkById(String id){
        System.out.println("进入根据id查询备注信息的操作");

        ClueRemark clueRemark = clueRemarkService.getClueRemarkById(id);

        return Result.success(clueRemark);
    }

    //根据id删除备注信息
    @PostMapping ("/del.do")
    public Result deleteClueRemarkById(String id){
        System.out.println("进入删除线索备注信息操作");

        boolean flag = clueRemarkService.deleteClueRemarkById(id);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除出现错误，请联系工作人员");
        }
    }

    //根据线索id查询市场活动相关信息
    @GetMapping("/getActivityListByClueId.do")
    public Result getActivityListByClueId(String clueId){
        System.out.println("进入根据线索id查询市场活动信息的操作");

        List<Activity> activities = clueRemarkService.getActivityListByClueId(clueId);

        return Result.success(activities);
    }

    //根据线索id查询没有被关联的市场活动信息列表
    @GetMapping("/getNotBeRelationActivityByClueId.do")
    public Result getNotBeRelationActivityByClueId(String clueId){
        System.out.println("进入查询没有被关联的市场活动信息");

        List<Activity> activities = clueRemarkService.getNotBeRelationActivityByClueId(clueId);

        return Result.success(activities);
    }

    //关联市场活动(添加)
    @PostMapping("/relationActivity.do")
    public Result addClueAndActivityRelation(String clueId, String[] activityId){
        System.out.println("进入关联市场活动操作");

        boolean flag = clueRemarkService.addClueAndActivityRelation(clueId, activityId);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "关联失败，请联系工作人员");
        }
    }

    //解除线索与市场活动的关联
    @PostMapping("/delRelation.do")
    public Result deleteClueAndActivityRelationByClueIdAndActivityId(String clueId, String activityId){
        System.out.println("进入解除线索与市场活动关联操作");

        boolean flag = clueRemarkService.deleteClueAndActivityRelationByClueIdAndActivityId(clueId, activityId);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "解除关联失败，请联系工作人员");
        }
    }
}
