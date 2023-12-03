package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.ContactService;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/workbench/contact")
public class ContactController {
    @Autowired
    private ContactService contactService;

    @Autowired
    private CustomerService customerService;

    //条件查询联系人列表
    @GetMapping("/getContactListByCondition.do")
    @ResponseBody
    public Result getContactListByCondition(ContactReq contactReq){
        System.out.println("进入查询联系人列表信息操作");

        Integer pageNo = Integer.valueOf(contactReq.getPageNoStr());
        Integer pageSize = Integer.valueOf(contactReq.getPageSizeStr());
        int skipCount = (pageNo - 1) * pageSize;
        contactReq.setPageSize(pageSize);
        contactReq.setSkipCount(skipCount);

        PaginationVO<Contact> paginationVO = contactService.getContactListByCondition(contactReq);

        return Result.success(paginationVO);
    }

    //根据客户名字查询客户信息
    @GetMapping("/getCustomerByName.do")
    @ResponseBody
    public Result getCustomerByName(String name){
        System.out.println("进入根据名字查询客户信息操作");

        Customer customer = customerService.getCustomerByName(name);

        return Result.success(customer);
    }
}
