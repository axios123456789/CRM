package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;

public interface ContactService {
    PaginationVO<Contact> getContactListByCondition(ContactReq contactReq); //条件查询联系人列表
}