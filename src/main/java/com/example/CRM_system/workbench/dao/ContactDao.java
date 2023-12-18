package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.TradeChartsVo;
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

    //根据ids删除联系人
    void deleteContactByIds(String[] ids);

    //根据customerIds删除联系人
    void deleteContactByCustomerIds(String[] ids);

    //根据id拿到对应联系人记录并将所有者渲染成中文
    Contact getContactMakeChineseOwnerById(String id);

    //根据客户id查询联系人列表记录
    List<Contact> getContactListByCustomerId(String customerId);

    //根据name全名查询联系人记录
    Contact getContactByAllName(String name);

    //根据客户ids查询联系人ids
    List<Contact> getContactListByCustomerIds(String[] ids);

    //根据customerId进行分组查询
    List<TradeChartsVo> getContactListGroupByCustomerId();
}
