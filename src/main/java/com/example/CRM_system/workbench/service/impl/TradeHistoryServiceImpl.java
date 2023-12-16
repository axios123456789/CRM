package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.workbench.dao.TradeHistoryDao;
import com.example.CRM_system.workbench.pojo.TradeHistory;
import com.example.CRM_system.workbench.service.TradeHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tradeHistory")
public class TradeHistoryServiceImpl implements TradeHistoryService {
    @Autowired
    private TradeHistoryDao tradeHistoryDao;

    /**
     * 查询交易历史表
     * @param tradeHistory
     * @return
     */
    @Override
    public List<TradeHistory> getTradeHistoryListByTradeId(TradeHistory tradeHistory) {
        List<TradeHistory> tradeHistoryListByTradeId = tradeHistoryDao.getTradeHistoryListByTradeId(tradeHistory.getTradeId());

        return tradeHistoryListByTradeId;
    }

    /**
     * 添加交易历史
     * @param tradeHistory
     */
    @Override
    public void addTradeHistory(TradeHistory tradeHistory) {
        tradeHistoryDao.addTradeHistory(tradeHistory);
    }
}
