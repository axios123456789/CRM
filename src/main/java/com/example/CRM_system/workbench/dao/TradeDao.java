package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TradeDao {
    //条件查询交易列表
    List<Trade> getTradeListByCondition(TradeReq tradeReq);

    //条件查询交易的记录数
    int getTradeCountByCondition(TradeReq tradeReq);

    //添加一笔交易
    void addTrade(Trade trade);

    //根据id查询交易记录
    @Select("select * from c_trade where id = #{id}")
    Trade getTradeById(String id);

    //修改交易信息
    void editTrade(Trade trade);
}
