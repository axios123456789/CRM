package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/workbench/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    //条件查询客户列表
    @GetMapping("getCustomerListByCondition.do")
    @ResponseBody
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
    @ResponseBody
    public Result getCustomerById(String id){
        System.out.println("进入根据id查询客户操作");

        Customer customer = customerService.getCustomerById(id);

        return Result.success(customer);
    }

    //添加或修改客户
    @PostMapping("saveCustomer.do")
    @ResponseBody
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
            return Result.error("500", "添加或修改失败，请检查您添加或修改的客户在客户列表中是否已经存在，如果已经存在了，请不要添加或修改相同的客户进来，如果不存在，请联系工作人员来解决您的问题！");
        }
    }

    //根据id组删除客户信息
    @PostMapping("/deleteCustomerByIds.do")
    @ResponseBody
    public Result deleteCustomerByIds(String[] ids){
        System.out.println("进入根据id组删除客户操作");

        boolean flag = customerService.deleteCustomerByIds(ids);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除失败，请联系工作人员");
        }
    }

    //根据客户id跳转到详细信息页
    @RequestMapping("/detail.do")
    public String detail(String id, HttpServletRequest req){
        System.out.println("进入到客户详细信息页操作");

        //根据id查到对应的客户
        Customer customer = customerService.getCustomerMakeChineseOwnerById(id);

        //将查到的客户信息保存到session域中
        req.getSession().setAttribute("customer", customer);

        //重定向到详细信息页
        return "companyLogin/menu/customer/customerDetail";
    }
}
