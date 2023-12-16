package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.TradeHistory;

import java.util.List;

public interface TradeHistoryService {
    List<TradeHistory> getTradeHistoryListByTradeId(TradeHistory tradeHistory); //查询交易历史

    void addTradeHistory(TradeHistory tradeHistory);    //添加交易历史
}
