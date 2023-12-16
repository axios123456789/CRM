package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.TradeHistory;

import java.util.List;

public interface TradeHistoryDao {
    //根据交易id查询交易历史列表
    List<TradeHistory> getTradeHistoryListByTradeId(String tradeId);

    //添加一条交易历史记录
    void addTradeHistory(TradeHistory tradeHistory);

    //根据交易ids删除交易历史
    void deleteTradeHistoryByTradeIds(String[] tradeIds);
}
