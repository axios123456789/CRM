package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.pojo.ClueRemark;

import java.util.List;

public interface ClueRemarkService {
    List<ClueRemark> getClueRemarkByClueId(String id);  //根据线索id查询所有备注

    boolean saveClueRemark(ClueRemark clueRemark);  //添加或修改备注

    ClueRemark getClueRemarkById(String id);    //根据id查备注信息

    boolean deleteClueRemarkById(String id);    //根据id删除线索备注信息

    List<Activity> getActivityListByClueId(String clueId);  //根据线索id查询市场活动信息

    List<Activity> getNotBeRelationActivityByClueId(String clueId); //根据线索id查询没有被关联的市场活动信息列表

    boolean addClueAndActivityRelation(String clueId, String[] activityId); //关联市场活动信息

    boolean deleteClueAndActivityRelationByClueIdAndActivityId(String clueId, String activityId);   //解除关联
}
