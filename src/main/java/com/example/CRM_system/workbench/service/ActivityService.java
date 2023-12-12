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

    List<Activity> getNotBeRelationActivityListByName(String name, String clueId);  //根据市场活动名字模糊查询市场活动信息在没有被关联的市场活动列表中

    List<Activity> getBeRelationActivityListByName(String name, String clueId); //根据名字模糊查询被关联的市场活动列表

    List<Activity> getActivityListRelationWithContactByContactId(String contactId); //根据联系人id查询与之关联的市场活动列表

    List<Activity> getNotBeRelationActivityListByContactId(String contactId);   //根据联系人id查询没有被关联的市场活动列表

    List<Activity> getNotBeRelationActivityListByNameAndContactId(String name, String contactId);   //根据市场活动名字模糊查询没有被联系人关联的市场活动列表
}
