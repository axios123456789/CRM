package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;

import java.util.List;

public interface TradeService {
    PaginationVO<Trade> getTradeListByCondition(TradeReq tradeReq); //条件和分页查询交易列表

    boolean addTrade(Trade trade);  //添加交易

    Trade getTradeById(String id);  //根据id查询交易信息

    boolean editTrade(Trade trade); //修改交易

    boolean deleteTradeByIds(String[] ids); //根据ids删除相关交易

    Trade getTradeSetChineseOwnerById(String id);   //根据id查询交易信息，并将相关信息渲染成中文

    List<Trade> getTradeListByCustomerId(String customerId);    //根据customerId查询交易列表

    List<Trade> getTradeListByContactId(String contactId);  //根据contactId查询交易列表

    List<TradeChartsVo> getTradeListGroupByStage(); //分组查询交易列表显示为漏斗图表
}
