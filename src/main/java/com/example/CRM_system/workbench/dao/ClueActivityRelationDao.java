package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.ClueActivityRelation;

import java.util.List;
import java.util.Map;

public interface ClueActivityRelationDao {
    //添加市场活动与线索的关联到市场活动线索关联关系表中
    void addClueAndActivityRelation(List<ClueActivityRelation> clueActivityRelation);

    //解除线索和市场活动的关联
    void deleteClueAndActivityRelationByClueIdAndActivityId(String clueId, String activityId);

    //根据市场活动id删除线索市场活动关联关系表中的记录
    void deleteClueAndActivityRelationByActivityIds(String[] ids);

    //根据线索id删除线索市场活动关联关系表中的相关记录
    void deleteClueAndActivityRelationByClueId(String[] ids);
}
