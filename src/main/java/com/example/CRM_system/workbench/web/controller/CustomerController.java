package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/workbench/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //条件查询客户列表
    @GetMapping("getCustomerListByCondition")
    public Result getCustomerListByCondition(CustomerReq customerReq){
        System.out.println("进入条件查询客户列表信息操作");

        //将默认的页数和每页展现条数强转为int类型
        Integer pageNo = Integer.valueOf(customerReq.getPageNoStr());
        Integer pageSize = Integer.valueOf(customerReq.getPageSizeStr());

        //计算出略过的记录数
        int skipCount = (pageNo - 1) * pageSize;
        customerReq.setPageSize(pageSize);
        customerReq.setSkipCount(skipCount);

        PaginationVO<Customer> customers = customerService.getCustomerListByCondition(customerReq);

        return Result.success(customers);
    }
}
