package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.CustomerRemark;

import java.util.List;

public interface CustomerRemarkService {
    List<CustomerRemark> getCustomerRemarkListByCustomerId(String customerId);  //根据客户id查询客户备注列表信息
}
