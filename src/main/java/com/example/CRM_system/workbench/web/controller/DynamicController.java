package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.RecentlyCustomerVo;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/workbench/dynamic")
public class DynamicController {
    @Autowired
    private DynamicService dynamicService;

    //查询最近的成交的客户
    @GetMapping("/getRecentlyCustomer")
    public Result getRecentlyCustomer(){
        List<RecentlyCustomerVo> recentlyCustomerVos = dynamicService.getRecentlyCustomer();
        return Result.success(recentlyCustomerVos);
    }

    //查询最近创建的交易
    @GetMapping("/getRecentlyCreateTrade")
    public Result getRecentlyCreateTrade(){
        List<Trade> trades = dynamicService.getRecentlyCreateTrade();
        return Result.success(trades);
    }

    //查询所有交易
    @GetMapping("/getAllTrade")
    public Result getAllTrade(){
        List<Trade> trades = dynamicService.getAllTrade();
        return Result.success(trades);
    }

    //分页查询所有线索
    @GetMapping("/getAllClue")
    public Result getAllClue(Integer pageNoStr, Integer pageSizeStr){
        int skipCount = (pageNoStr-1)*pageSizeStr;
        PaginationVO<Clue> cluePaginationVO = dynamicService.getAllClue(skipCount, pageSizeStr);
        return Result.success(cluePaginationVO);
    }
}
