package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;

import java.util.List;

public interface CustomerService {
    PaginationVO<Customer> getCustomerListByCondition(CustomerReq customerReq); //条件查询客户列表

    Customer getCustomerById(String id);  //根据id查询客户列表

    boolean saveCustomer(Customer customer);    //添加或修改客户信息

    boolean deleteCustomerByIds(String[] ids);    //根据ids删除客户

    Customer getCustomerMakeChineseOwnerById(String id); //根据id查询客户并保证拿到的客户所有者为中文

    Customer getCustomerByName(String name); //根据名字查询客户信息

    List<Customer> getCustomerByDetailAddress(String detailAddress);    //根据地址模糊查询客户列表
}
