package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.ContactActivityRelation;

import java.util.List;

public interface ContactActivityRelationDao {
    //添加联系人市场活动关联关系
    void addContactAndActivityRelation(List<ContactActivityRelation> contactActivityRelations);

    //解除联系人与市场活动关联关系
    void deleteContactWithActivityRelation(String contactId, String activityId);

    //根据联系人id删除联系人市场活动关联关系
    void deleteContactWithActivityRelationByContactIds(String[] ids);
}
