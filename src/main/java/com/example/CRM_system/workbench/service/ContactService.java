package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;

import java.util.List;

public interface ContactService {
    PaginationVO<Contact> getContactListByCondition(ContactReq contactReq); //条件查询联系人列表

    Contact getContactById(String id);  //根据id拿到对应联系人数据

    boolean saveContact(Contact contact, String customerName);  //添加或修改联系人

    boolean deleteContactByIds(String[] ids);   //根据ids删除联系人

    Contact getContactMakeChineseOwnerById(String id); //根据id查询联系人并将所有者渲染成中文

    List<Contact> getContactListByCustomerId(String customerId);    //根据客户id查询联系人列表
}
