package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.ContactService;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

    //根据id拿到联系人对应的数据
    @GetMapping("/getContactById.do")
    @ResponseBody
    public Result getContactById(String id){
        System.out.println("进入根据id拿到对应联系人数据操作");

        Contact contact = contactService.getContactById(id);

        return Result.success(contact);
    }

    //添加或修改联系人
    @PostMapping("/saveContact.do")
    @ResponseBody
    public Result saveContact(Contact contact, String customerName, HttpSession session){
        System.out.println("进入添加或修改联系人操作");

        if (contact.getId() == null || contact.getId() == ""){//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            contact.setId(UUIDUtil.getUUID());
            contact.setCreateBy(createBy);
            contact.setCreateTime(DateTimeUtil.getSysTime());
        }else {//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            contact.setEditBy(editBy);
            contact.setEditTime(DateTimeUtil.getSysTime());
        }

        boolean flag = contactService.saveContact(contact, customerName);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改失败，请联系工作人员");
        }
    }

    //根据ids删除联系人
    @PostMapping("/deleteContactByIds.do")
    @ResponseBody
    public Result deleteContactByIds(String[] ids){
        System.out.println("进入根据ids删除联系人操作");

        boolean flag = contactService.deleteContactByIds(ids);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除联系人失败，请联系相关工作人员！");
        }
    }

    //跳转到联系人详细信息页
    @RequestMapping("/detail.do")
    public String detail(String id, HttpSession session) {
        System.out.println("进入到跳转到联系人详细信息页操作");

        //根据id查询到联系人相关信息
        Contact contact = contactService.getContactMakeChineseOwnerById(id);

        //将contact保存到session域中去
        session.setAttribute("contact", contact);

        return "companyLogin/menu/relative/detail";
    }

    //显示联系人和客户，联系人和交易，客户和交易关系统计图表
    @GetMapping("/showContactAndCustomerAndTradeCharts.do")
    @ResponseBody
    public Result showCharts(){
        System.out.println("进入显示客户联系人，客户交易，联系人交易关系图表操作！");

        Map<String, List<TradeChartsVo>> map = contactService.showContactAndCustomerAndTradeCharts();

        return Result.success(map);
    }
}
