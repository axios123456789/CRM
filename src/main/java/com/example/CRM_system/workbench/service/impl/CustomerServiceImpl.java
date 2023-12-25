package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.TransactionStatus;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.dao.*;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.ContactService;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import java.util.List;

@Service("customer")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    @Autowired
    private CustomerRemarkDao customerRemarkDao;

    @Autowired
    private ContactDao contactDao;

    @Autowired
    private ContactRemarkDao contactRemarkDao;

    @Autowired
    private ContactActivityRelationDao contactActivityRelationDao;

    @Autowired
    private PlatformTransactionManager transactionManager;

    /**
     * 条件查询客户列表数据
     * @param customerReq
     * @return
     */
    @Override
    public PaginationVO<Customer> getCustomerListByCondition(CustomerReq customerReq) {
        //拿到查到的总条数
        int total = customerDao.getCustomerListTotalByCondition(customerReq);

        //拿到查询到的客户列表
        List<Customer> customers = customerDao.getCustomerListByCondition(customerReq);

        //创建vo对象封装数据
        PaginationVO paginationVO = new PaginationVO();
        paginationVO.setTotal(total);
        paginationVO.setDataList(customers);

        return paginationVO;
    }

    /**
     * 根据id查询客户列表
     * @param id
     * @return
     */
    @Override
    public Customer getCustomerById(String id) {
        Customer customer = customerDao.getCustomerById(id);

        return customer;
    }

    /**
     * 根据id查询客户列表并保证拿到的owner是中文
     * @param id
     * @return
     */
    @Override
    public Customer getCustomerMakeChineseOwnerById(String id) {
        Customer customer = customerDao.getCustomerMakeChineseOwnerById(id);

        return customer;
    }

    /**
     * 根据名字查询客户信息
     * @param name
     * @return
     */
    @Override
    public Customer getCustomerByName(String name) {
        List<Customer> customers = customerDao.getCustomerByName(name);

        if (customers.size() == 1){
            return customers.get(0);
        }else {
            return null;
        }
    }

    /**
     * 根据地址模糊查询客户列表
     * @param detailAddress
     * @return
     */
    @Override
    public List<Customer> getCustomerByDetailAddress(String detailAddress) {
        List<Customer> customers = customerDao.getCustomerByDetailAddress(detailAddress);

        return customers;
    }

    /**
     * 添加或修改客户信息
     * @param customer
     * @return
     */
    @Override
    public boolean saveCustomer(Customer customer) {
        boolean flag = true;

        //根据id查询客户信息
        Customer customerById = customerDao.getCustomerById(customer.getId());
        try {
            //判断查到的客户信息是否为空，如果为空则执行添加操作，否则执行修改操作
            if (customerById == null || "[]".equals(customerById) || "".equals(customerById)){//添加
                customerDao.addCustomer(customer);
            }else {//修改
                customerDao.editCustomer(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 根据id组删除客户
     * 以及客户对应的所有备注信息
     * @param ids
     * @return
     */
    @Override
    public boolean deleteCustomerByIds(String[] ids) {
        org.springframework.transaction.TransactionStatus status = transactionManager.getTransaction(TransactionStatus.getTransactionStatus());

        try {
            //根据ids删除所有对应的客户备注信息
            customerRemarkDao.deleteCustomerRemarkByCustomerIds(ids);

            //根据客户ids查询联系人ids
            List<Contact> contacts = contactDao.getContactListByCustomerIds(ids);

            String[] contactId = new String[contacts.size()];
            for (int i = 0; i < contacts.size(); i++) {
                contactId[i] = contacts.get(i).getId();
            }

            if (contactId.length > 0) {
                //根据联系人ids删除联系人备注信息
                contactRemarkDao.deleteContactRemarkByContactIds(contactId);

                //根据联系人ids删除联系人市场活动关联关系
                contactActivityRelationDao.deleteContactWithActivityRelationByContactIds(contactId);
            }

            //根据客户ids删除联系人
            contactDao.deleteContactByCustomerIds(ids);

            //根据客户ids删除客户信息
            customerDao.deleteCustomerByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
    }
}
