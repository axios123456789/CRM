package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.workbench.pojo.ContactRemark;
import com.example.CRM_system.workbench.service.ContactRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/workbench/contactRemark")
public class ContactRemarkController {
    @Autowired
    private ContactRemarkService contactRemarkService;

    //根据contactId查询联系人备注信息
    @GetMapping("/getContactRemarkListByContactId.do")
    public Result getContactRemarkListByContactId(String contactId){
        System.out.println("进入根据contactId查询联系人备注信息操作");

        List<ContactRemark> contactRemarks = contactRemarkService.getContactRemarkListByContactId(contactId);

        return Result.success(contactRemarks);
    }

    //根据id查询联系人备注信息
    @GetMapping("/getContactRemarkById.do")
    public Result getContactRemarkById(String id){
        System.out.println("今天根据id查询联系人备注信息操作");

        ContactRemark contactRemark = contactRemarkService.getContactRemarkById(id);

        return Result.success(contactRemark);
    }

    //添加或修改联系人备注信息
    @PostMapping("/saveContactRemark.do")
    public Result saveContactRemark(ContactRemark contactRemark, HttpSession session){
        System.out.println("进入添加或修改联系人备注信息操作");

        if (contactRemark.getId() == null || contactRemark.getId() == ""){//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            contactRemark.setId(UUIDUtil.getUUID());
            contactRemark.setCreateBy(createBy);
            contactRemark.setCreateTime(DateTimeUtil.getSysTime());
            contactRemark.setEditFlag("0");
        }else {//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            contactRemark.setEditBy(editBy);
            contactRemark.setEditTime(DateTimeUtil.getSysTime());
            contactRemark.setEditFlag("1");
        }

        boolean flag = contactRemarkService.saveContactRemark(contactRemark);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改失败，请联系工作人员");
        }
    }

    //根据id删除联系人备注
    @PostMapping("/deleteContactRemarkById.do")
    public Result deleteContactRemarkById(String id){
        System.out.println("进入根据id删除联系人备注信息操作");

        boolean flag = contactRemarkService.deleteContactRemarkById(id);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除联系人备注失败，请联系工作人员！");
        }
    }
}
