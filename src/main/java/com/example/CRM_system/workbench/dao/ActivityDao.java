package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.workbench.pojo.Activity;

import java.util.List;
import java.util.Map;

public interface ActivityDao {
    //添加一条数据到市场活动列表中 并返回受到影响的条数
    int save(Activity activity);

    //条件查询市场活动列表 返回的是查询到的条数
    int getTotalByCondition(Map<String, Object> map);

    //条件查询市场活动列表 返回list集合
    List<Activity> getActivityListByCondition(Map<String, Object> map);

    //通过id删除市场活动列表的数据 一条或多条
    int deleteActivityByIds(String[] ids);

    //根据id查询到市场活动的一条数据
    Activity getActivityById(String id);

    //通过id查询市场活动列表 返回查询到的条数
    int selectById(String id);

    //根据id修改市场活动的数据
    int upData(Activity activity);

    //根据id查询市场活动数据 要求将owner渲染成名字 所以不能复用activityDao.getActivityById(String id)
    Activity detail(String id);

    //根据线索id查看市场活动信息
    List<Activity> getActivityListByClueId(String clueId);

    //跟据线索id查询没有被关联的市场活动信息
    List<Activity> getNotBeRelationActivityByClueId(String clueId);

    //根据市场活动名字模糊查询市场活动信息的记录在没有被关联的市场活动列表中
    List<Activity> getNotBeRelationActivityListByName(String name, String clueId);

    //根据市场活动名字模糊查询被关联的市场活动列表
    List<Activity> getBeRelationActivityListByName(String name, String clueId);

    //根据联系人id查询与之关联的市场活动列表
    List<Activity> getActivityListRelationWithContactByContactId(String contactId);

    //根据联系人id查询没有被关联的市场活动列表
    List<Activity> getNotBeRelationActivityListByContactId(String contactId);

    //根据联系人id和市场活动名字模糊查询没有被关联的市场活动列表
    List<Activity> getNotBeRelationActivityListByNameAndContactId(String name, String contactId);

    //根据市场活动名字进行分组查询
    List<TradeChartsVo> getActivityListGroupByName();

    //根据市场活动各成本段进行分组查询
    List<TradeChartsVo> getActivityListGroupByCost();

    //根据市场活动所有者进行分组查询
    List<TradeChartsVo> getActivityListGroupByOwner();
}
