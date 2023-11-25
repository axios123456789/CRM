package com.example.CRM_system.workbench.service;

import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.workbench.pojo.Activity;

import java.util.List;
import java.util.Map;

public interface ActivityService {
    //增改
    boolean save(Activity activity);

    //条件查询
    PaginationVO<Activity> getActivityList(Map<String, Object> map);

    //批量删除
    boolean delete(String[] ids);

    //通过id查询市场活动列表的数据
    Activity getActivityById(String id);

    Activity detail(String id);

    List<Activity> getActivityListByName(String name);  //根据市场活动名字模糊查询市场活动信息
}
