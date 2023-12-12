package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.ContactActivityRelation;
import com.example.CRM_system.workbench.pojo.ContactRemark;

import java.util.List;

public interface ContactRemarkDao {
    //根据contactId查询联系人备注记录
    List<ContactRemark> getContactRemarkListByContactId(String contactId);

    //根据id查询联系人备注信息
    ContactRemark getContactRemarkById(String id);

    //添加联系人备注信息
    void addContactRemark(ContactRemark contactRemark);

    //修改联系人备注信息
    void updateContactRemark(ContactRemark contactRemark);

    //根据id删除联系人备注信息
    void deleteContactRemarkById(String id);

    //根据contactIds删除联系人备注
    void deleteContactRemarkByContactIds(String[] ids);
}
