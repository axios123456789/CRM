package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.settings.service.UserService;
import com.example.CRM_system.settings.service.impl.UserServiceImpl;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.ServiceFactory;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.service.ActivityService;
import com.example.CRM_system.workbench.service.impl.ActivityServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ActivityController{
    @Autowired
    private ActivityService activityService;

    @Autowired
    private UserService userService;

    //获取用户信息表
    @RequestMapping("/workbench/activity/getUserList.do")
    @ResponseBody
    private Result getUserList(){
        System.out.println("获取用户表");

        List<User> users = userService.getUserList();

        return Result.success(users);
    }

    //执行市场活动添加修改操作
    @PostMapping("/workbench/activity/save.do")
    @ResponseBody
    private Result save(Activity activity, HttpServletRequest req){
        System.out.println("执行市场活动添加操作");
        if (activity.getName() == ""){
            activity.setName(null);
        }

        if (activity.getId() == null || activity.getId() == ""){//添加
            String createBy = ((User)req.getSession().getAttribute("user")).getName();

            activity.setId(UUIDUtil.getUUID());
            activity.setCreateTime(DateTimeUtil.getSysTime());
            activity.setCreateBy(createBy);
        }else{//修改
            String editTime = DateTimeUtil.getSysTime();
            String editBy = ((User)req.getSession().getAttribute("user")).getName();
            activity.setEditTime(editTime);
            activity.setEditBy(editBy);
        }

        boolean flag = activityService.save(activity);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","添加或修改失败");
        }
    }

    //条件查询市场活动列表
    @RequestMapping("/workbench/activity/getActivityList.do")
    @ResponseBody
    private Result getActivityList(String pageNoStr, String pageSizeStr, String name, String owner, String startDate, String endDate){
        System.out.println("进入条件查询");

        //将默认的页数和每页展现条数强转为int类型
        Integer pageNo = Integer.valueOf(pageNoStr);
        Integer pageSize = Integer.valueOf(pageSizeStr);

        //计算出略过的记录数
        int skipCount = (pageNo - 1) * pageSize;

        //创建Map集合封装以上数据
        Map<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("owner", owner);
        map.put("startDate", startDate);
        map.put("endDate", endDate);
        map.put("skipCount", skipCount);
        map.put("pageSize", pageSize);

        PaginationVO<Activity> vo = activityService.getActivityList(map);

        return Result.success(vo);
    }

    //根据id删除市场活动数据
    @PostMapping("/workbench/activity/del.do")
    @ResponseBody
    private Result delete(String[] ids){
        System.out.println("市场活动删除操作");

        boolean flag = activityService.delete(ids);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500","删除失败");
        }
    }

    //根据id查找对应的市场活动数据
    @RequestMapping("/workbench/activity/getActivityById.do")
    @ResponseBody
    private Result getActivityById(String id){
        System.out.println("根据id查询市场活动数据");

        Activity activity = activityService.getActivityById(id);

        return Result.success(activity);
    }

    //跳转到详细信息页
    @RequestMapping("/workbench/activity/detail.do")
    private String detail(String id,HttpServletRequest req) throws ServletException, IOException {
        System.out.println("进入到跳转到详细信息页的操作");

        //String id = req.getParameter("id");

        Activity activity = activityService.detail(id);

        //将activity保存到session域中
        req.setAttribute("activity", activity);

        return "companyLogin/menu/activity/detail";
        //请求重定向到详情页面
        //req.getRequestDispatcher("/menu/activity/detail.jsp").forward(req, resp);
    }

    //根据市场活动名字模糊查询市场活动信息在没有被关联的市场活动中
    @GetMapping("/workbench/activity/getNotBeRelationActivityListByName.do")
    @ResponseBody
    public Result getActivityListByName(String name, String clueId){
        System.out.println("进入根据市场活动名字模糊查询没有被关联的市场活动列表操作");

        List<Activity> activities = activityService.getNotBeRelationActivityListByName(name, clueId);

        return Result.success(activities);
    }

    //根据市场活动名字模糊查询市场活动信息在被关联的市场活动中
    @GetMapping("/workbench/activity/getBeRelationActivityListByName.do")
    @ResponseBody
    public Result getBeRelationActivityListByName(String name, String clueId){
        System.out.println("根据名字模糊查询被关联的市场活动列表操作");

        List<Activity> activities = activityService.getBeRelationActivityListByName(name, clueId);

        return Result.success(activities);
    }

    //显示市场活动图表
    @GetMapping("/workbench/activity/showActivityCharts.do")
    @ResponseBody
    public Result showCharts(){
        System.out.println("进入显示市场活动相关图表操作");

        Map<String, List<TradeChartsVo>> map = activityService.showActivityCharts();

        return Result.success(map);
    }
}
