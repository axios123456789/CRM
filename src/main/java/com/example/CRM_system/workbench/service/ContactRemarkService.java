package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.ContactRemark;

import java.util.List;

public interface ContactRemarkService {
    List<ContactRemark> getContactRemarkListByContactId(String contactId);  //根据contactId查询联系人备注信息

    ContactRemark getContactRemarkById(String id);  //根据id查询联系人备注信息

    boolean saveContactRemark(ContactRemark contactRemark); //添加或修改联系人备注

    boolean deleteContactRemarkById(String id); //根据id删除联系人备注
}
