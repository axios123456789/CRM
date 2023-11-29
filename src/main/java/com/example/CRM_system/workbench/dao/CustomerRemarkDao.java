package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.CustomerRemark;

import java.util.List;

public interface CustomerRemarkDao {
    //根据客户id查询客户备注列表信息数据
    List<CustomerRemark> getCustomerRemarkListByCustomerId(String customerId);
}
