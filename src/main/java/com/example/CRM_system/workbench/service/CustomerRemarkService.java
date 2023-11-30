package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.CustomerRemark;

import java.util.List;

public interface CustomerRemarkService {
    List<CustomerRemark> getCustomerRemarkListByCustomerId(String customerId);  //根据客户id查询客户备注列表信息

    CustomerRemark getCustomerRemarkById(String id);    //根据备注id查询客户备注信息

    boolean saveCustomerRemark(CustomerRemark customerRemark); //添加或修改客户备注信息

    boolean deleteCustomerRemark(String id); //根据客户备注id删除客户备注信息
}
