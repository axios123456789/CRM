package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.CustomerRemark;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.ContactService;
import com.example.CRM_system.workbench.service.CustomerRemarkService;
import com.example.CRM_system.workbench.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/workbench/customerRemark")
public class CustomerRemarkController {
    @Autowired
    private CustomerRemarkService customerRemarkService;

    @Autowired
    private TradeService tradeService;

    @Autowired
    private ContactService contactService;

    //根据客户id查询客户备足信息列表
    @GetMapping("/getCustomerRemarkListByCustomerId.do")
    public Result getCustomerRemarkListByCustomerId(String customerId){
        System.out.println("进入根据客户id查询客户备注信息操作");

        List<CustomerRemark> customerRemarks = customerRemarkService.getCustomerRemarkListByCustomerId(customerId);

        return Result.success(customerRemarks);
    }

    //根据客户备注id查询客户备注信息
    @GetMapping("/getCustomerRemarkById.do")
    public Result getCustomerRemarkById(String id){
        System.out.println("进入根据客户备注id查询客户备注信息操作");

        CustomerRemark customerRemark = customerRemarkService.getCustomerRemarkById(id);

        return Result.success(customerRemark);
    }

    //添加或修改备注信息
    @PostMapping("/saveCustomerRemark.do")
    public Result saveCustomerRemark(CustomerRemark customerRemark, HttpSession session){
        System.out.println("进入添加或修改客户备注信息操作");

        //判断添加还是修改
        if (customerRemark.getId() == null || customerRemark.getId() == ""){//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            String createTime = DateTimeUtil.getSysTime();
            customerRemark.setId(UUIDUtil.getUUID());
            customerRemark.setCreateBy(createBy);
            customerRemark.setCreateTime(createTime);
            customerRemark.setEditFlag("0");
        }else {//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            String editTime = DateTimeUtil.getSysTime();
            customerRemark.setEditBy(editBy);
            customerRemark.setEditTime(editTime);
            customerRemark.setEditFlag("1");
        }

        boolean flag = customerRemarkService.saveCustomerRemark(customerRemark);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改失败，请联系工作人员");
        }
    }

    //根据客户备注id删除客户备注信息
    @PostMapping("/deleteCustomerRemark.do")
    public Result deleteCustomerRemark(String id){
        System.out.println("进入到根据客户备注id删除客户备注操作");

        boolean flag = customerRemarkService.deleteCustomerRemark(id);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除备注失败，请联系工作人员");
        }
    }

    //根据客户id查询交易列表
    @GetMapping("/getTradeListByCustomerId.do")
    public Result getTradeListByCustomerId(String customerId){
        System.out.println("进入根据客户id查询交易列表的操作");

        List<Trade> trades = tradeService.getTradeListByCustomerId(customerId);

        return Result.success(trades);
    }

    //根据客户id查询联系人列表
    @GetMapping("/getContactListByCustomerId.do")
    public Result getContactListByCustomerId(String customerId){
        System.out.println("进入根据客户id查询联系人列表操作");

        List<Contact> contacts = contactService.getContactListByCustomerId(customerId);

        return Result.success(contacts);
    }
}
