package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.CustomerRemark;

import java.util.List;

public interface CustomerRemarkDao {
    //根据客户id查询客户备注列表信息数据
    List<CustomerRemark> getCustomerRemarkListByCustomerId(String customerId);

    //根据客户备注id查询客户备注记录
    CustomerRemark getCustomerRemarkById(String id);

    //添加客户备注信息
    void addCustomerRemark(CustomerRemark customerRemark);

    //修改客户备注信息
    void updateCustomerRemark(CustomerRemark customerRemark);

    //根据客户备注id删除客户备注信息记录
    void deleteCustomerRemark(String id);

    //根据客户ids删除所有对应的客户备注信息
    void deleteCustomerRemarkByCustomerIds(String[] ids);
}
