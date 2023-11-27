package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;

import java.util.List;

public interface CustomerDao {
    //条件查询客户列表
    List<Customer> getCustomerListByCondition(CustomerReq customerReq);

    //条件查询客户列表，拿到查到的记录数
    int getCustomerListTotalByCondition(CustomerReq customerReq);
}
