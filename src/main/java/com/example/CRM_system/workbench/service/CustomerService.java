package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;

public interface CustomerService {
    PaginationVO<Customer> getCustomerListByCondition(CustomerReq customerReq); //条件查询客户列表

    Customer getCustomerById(String id);  //根据id查询客户列表

    boolean saveCustomer(Customer customer);    //添加或修改客户信息
}
