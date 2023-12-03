package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;

import java.util.List;

public interface CustomerDao {
    //条件查询客户列表
    List<Customer> getCustomerListByCondition(CustomerReq customerReq);

    //条件查询客户列表，拿到查到的记录数
    int getCustomerListTotalByCondition(CustomerReq customerReq);

    //根据id查询客户列表
    Customer getCustomerById(String id);

    //添加客户记录
    void addCustomer(Customer customer);

    //修改客户信息
    void editCustomer(Customer customer);

    //根据客户id删除客户相关信息
    void deleteCustomerByIds(String[] ids);

    //根据id查询客户列表并保证拿到的owner为中文
    Customer getCustomerMakeChineseOwnerById(String id);

    //根据名字查询客户信息
    Customer getCustomerByName(String name);
}
