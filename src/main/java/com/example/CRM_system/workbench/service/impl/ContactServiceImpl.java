package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.dao.ContactDao;
import com.example.CRM_system.workbench.dao.CustomerDao;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("contact")
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDao contactDao;

    @Autowired
    private CustomerDao customerDao;

    /**
     * 条件和分页查询联系人列表
     * @param contactReq
     * @return
     */
    @Override
    public PaginationVO<Contact> getContactListByCondition(ContactReq contactReq) {
        //条件查询联系人总记录数
        int total = contactDao.getContactTotalByCondition(contactReq);

        //条件查询联系人列表
        List<Contact> contacts = contactDao.getContactListByCondition(contactReq);

        //创建返回给前端的vo对象，将查到的总记录数和列表存入其中
        PaginationVO<Contact> paginationVO = new PaginationVO<>();
        paginationVO.setTotal(total);
        paginationVO.setDataList(contacts);

        return paginationVO;
    }

    /**
     * 根据id拿到对应联系人数据
     * @param id
     * @return
     */
    @Override
    public Contact getContactById(String id) {
        Contact contact = contactDao.getContactById(id);

        return contact;
    }

    /**
     * 根据id拿到对应联系人数据，并将联系人所有者渲染成中文
     * @param id
     * @return
     */
    @Override
    public Contact getContactMakeChineseOwnerById(String id) {
        Contact contact = contactDao.getContactMakeChineseOwnerById(id);

        return contact;
    }

    /**
     * 添加或修改联系人
     * @param contact
     * @param customerName
     * @return
     */
    @Override
    public boolean saveContact(Contact contact, String customerName) {
        boolean flag = true;

        if (customerName != null && customerName != "") {
            //根据客户名称到客户列表中查询客户信息，如果查到了则将id保存为concat中的customerId， 没查到则创建客户并保存到客户表中
            Customer customerByName = customerDao.getCustomerByName(customerName);
            if (customerByName != null && !("".equals(customerByName)) && !("[]".equals(customerByName))){
                //设置客户id设为concat的customerId
                contact.setCustomerId(customerByName.getId());
            }else {
                //创建一个客户
                Customer customer = new Customer();
                customer.setId(UUIDUtil.getUUID());
                customer.setOwner(contact.getOwner());
                customer.setName(customerName);
                customer.setCreateBy(contact.getCreateBy());
                customer.setCreateTime(contact.getCreateTime());

                try {
                    //保存该客户到客户表中
                    customerDao.addCustomer(customer);
                } catch (Exception e) {
                    e.printStackTrace();
                    flag = false;
                }

                //将新创建的客户id作为contact的customerId
                contact.setCustomerId(customer.getId());
            }
        }

        //根据联系人id到联系人表中查询，若查到了数据则为修改操作，否则为添加操作
        Contact contactById = contactDao.getContactById(contact.getId());
        try {
            if (contactById == null || "".equals(contactById) || "[]".equals(contactById)){//添加
                contactDao.addContact(contact);
            }else {//修改
                contactDao.updateContact(contact);
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 根据ids删除联系人
     * @param ids
     * @return
     */
    @Override
    public boolean deleteContactByIds(String[] ids) {
        boolean flag = true;

        try {
            //根据ids删除联系人
            contactDao.deleteContactByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }
}
