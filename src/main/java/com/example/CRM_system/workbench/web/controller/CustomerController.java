package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.CustomerService;
import com.mysql.cj.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/workbench/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //条件查询客户列表
    @GetMapping("getCustomerListByCondition.do")
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

    //根据id查询客户
    @GetMapping("/getCustomerById.do")
    public Result getCustomerById(String id){
        System.out.println("进入根据id查询客户操作");

        Customer customer = customerService.getCustomerById(id);

        return Result.success(customer);
    }

    //添加或修改客户
    @PostMapping("saveCustomer.do")
    public Result saveCustomer(Customer customer, HttpSession session){
        System.out.println("进入添加或修改客户操作");

        if (customer.getId() == null || customer.getId() == ""){//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            String createTime = DateTimeUtil.getSysTime();
            customer.setId(UUIDUtil.getUUID());
            customer.setCreateTime(createTime);
            customer.setCreateBy(createBy);
        }else {//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            String editTime = DateTimeUtil.getSysTime();
            customer.setEditBy(editBy);
            customer.setEditTime(editTime);
        }

        boolean flag = customerService.saveCustomer(customer);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改失败，请联系工作人员");
        }
    }
}
