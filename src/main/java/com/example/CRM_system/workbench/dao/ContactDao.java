package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;

import java.util.List;

public interface ContactDao {
    //条件查询联系人总记录数
    int getContactTotalByCondition(ContactReq contactReq);

    //条件查询所有联系人
    List<Contact> getContactListByCondition(ContactReq contactReq);

    //根据id拿到对应联系人数据记录
    Contact getContactById(String id);

    //添加一条联系人记录
    void addContact(Contact contact);

    //修改联系人记录
    void updateContact(Contact contact);
}
