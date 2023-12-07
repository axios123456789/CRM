package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/workbench/trade")
public class TradeController {
    @Autowired
    private TradeService tradeService;

    //条件查询交易列表
    @GetMapping("/getTradeListByCondition.do")
    @ResponseBody
    public Result getTradeListByCondition(TradeReq tradeReq){
        System.out.println("进入条件查询交易列表的操作");

        Integer pageNo = Integer.valueOf(tradeReq.getPageNoStr());
        Integer pageSize = Integer.valueOf(tradeReq.getPageSizeStr());

        int skipCount = (pageNo - 1) * pageSize;
        tradeReq.setPageSize(pageSize);
        tradeReq.setSkipCount(skipCount);

        PaginationVO<Trade> tradeListByCondition = tradeService.getTradeListByCondition(tradeReq);

        return Result.success(tradeListByCondition);
    }
}
