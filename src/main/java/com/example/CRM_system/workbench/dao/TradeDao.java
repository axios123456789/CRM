package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;

import java.util.List;

public interface TradeDao {
    //条件查询交易列表
    List<Trade> getTradeListByCondition(TradeReq tradeReq);

    //条件查询交易的记录数
    int getTradeCountByCondition(TradeReq tradeReq);
}
