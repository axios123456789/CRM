package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.workbench.pojo.CustomerRemark;
import com.example.CRM_system.workbench.service.CustomerRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/workbench/customerRemark")
public class CustomerRemarkController {
    @Autowired
    private CustomerRemarkService customerRemarkService;

    //根据客户id查询客户备足信息列表
    @GetMapping("/getCustomerRemarkListByCustomerId")
    public Result getCustomerRemarkListByCustomerId(String customerId){
        System.out.println("进入根据客户id查询客户备注信息操作");

        List<CustomerRemark> customerRemarks = customerRemarkService.getCustomerRemarkListByCustomerId(customerId);

        return Result.success(customerRemarks);
    }


}
