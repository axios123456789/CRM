package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.workbench.pojo.TradeRemark;
import com.example.CRM_system.workbench.service.TradeRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/workbench/tradeRemark")
public class TradeRemarkController {
    @Autowired
    private TradeRemarkService tradeRemarkService;

    //根据交易id查询交易备注信息
    @GetMapping("/getTradeRemarkListByTradeId.do")
    public Result getTradeRemarkListByTradeId(String tradeId){
        System.out.println("进入根据交易id查询交易备注列表操作");

        List<TradeRemark> tradeRemarks = tradeRemarkService.getTradeRemarkListByTradeId(tradeId);

        return Result.success(tradeRemarks);
    }

    //根据id查询交易备注信息
    @GetMapping("/getTradeRemarkById.do")
    public Result getTradeRemarkById(String id){
        System.out.println("进入根据id查询交易备注操作");

        TradeRemark tradeRemark = tradeRemarkService.getTradeRemarkById(id);

        return Result.success(tradeRemark);
    }

    //添加或修改交易备注信息
    @PostMapping("/saveTradeRemark.do")
    public Result saveTradeRemark(TradeRemark tradeRemark, HttpSession session){
        System.out.println("进入添加或修改交易备注信息操作");

        if (tradeRemark.getId() == null || tradeRemark.getId() == ""){//添加
            String createBy = ((User) session.getAttribute("user")).getName();
            tradeRemark.setId(UUIDUtil.getUUID());
            tradeRemark.setCreateBy(createBy);
            tradeRemark.setCreateTime(DateTimeUtil.getSysTime());
            tradeRemark.setEditFlag("0");
        }else {//修改
            String editBy = ((User) session.getAttribute("user")).getName();
            tradeRemark.setEditBy(editBy);
            tradeRemark.setEditTime(DateTimeUtil.getSysTime());
            tradeRemark.setEditFlag("1");
        }

        boolean flag = tradeRemarkService.saveTradeRemark(tradeRemark);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "添加或修改备注失败，请联系工作人员！");
        }
    }

    //根据id删除交易备注信息
    @PostMapping("/deleteTradeRemarkById.do")
    public Result deleteTradeRemarkById(String id){
        System.out.println("根据id删除交易备注信息");

        boolean flag = tradeRemarkService.deleteTradeRemarkById(id);

        if (flag){
            return Result.success();
        }else {
            return Result.error("500", "删除交易备注失败，请联系相关工作人员！");
        }
    }
}
