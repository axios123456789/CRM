package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;

import java.util.List;

public interface TradeService {
    PaginationVO<Trade> getTradeListByCondition(TradeReq tradeReq); //条件和分页查询交易列表

    boolean addTrade(Trade trade);  //添加交易

    Trade getTradeById(String id);  //根据id查询交易信息

    boolean editTrade(Trade trade); //修改交易
}
