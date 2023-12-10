package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.TradeRemark;

import java.util.List;

public interface TradeRemarkService {
    List<TradeRemark> getTradeRemarkListByTradeId(String tradeId);  //根据交易id查询交易备注列表

    TradeRemark getTradeRemarkById(String id);  //根据id查询交易备注信息

    boolean saveTradeRemark(TradeRemark tradeRemark);   //添加或修改交易备注

    boolean deleteTradeRemarkById(String id);   //根据id删除交易备注信息
}
