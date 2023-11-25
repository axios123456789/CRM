package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.ActivityRemark;

import java.util.List;

public interface ActivityRemarkDao {
    //根据外键id查询市场活动列表详情数据 返回查到的记录数
    int getCountByAids(String[] ids);

    //根据外键id删除市场活动详情列表数据 返回删除的记录数
    int deleteCountByAids(String[] ids);

    //通过外键id查询市场活动备注信息
    List<ActivityRemark> getRemarkByAid(String id);

    //根据id查询该id的备注信息 返回记录数
    int getRemarkById(String id);

    //修改市场活动备注表
    int updateRemark(ActivityRemark activityRemark);

    //添加市场活动备注
    int addRemark(ActivityRemark activityRemark);

    //根据id删除备注信息
    int deleteRemark(String id);

    //根据id查询该id的备注信息
    ActivityRemark getRemarkObjById(String id);
}
