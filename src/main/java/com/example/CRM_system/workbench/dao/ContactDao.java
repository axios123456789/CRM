package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;

import java.util.List;

public interface ContactDao {
    //条件查询联系人总记录数
    int getContactTotalByCondition(ContactReq contactReq);

    //条件查询所有联系人
    List<Contact> getContactListByCondition(ContactReq contactReq);
}
