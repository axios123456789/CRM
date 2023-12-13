package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.workbench.pojo.TradeRemark;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TradeRemarkDao {
    //根据交易id查询交易备注列表记录
    @Select("select * from c_trade_remark where tradeId = #{tradeId} order by createTime desc")
    List<TradeRemark> getTradeRemarkListByTradeId(String tradeId);

    //根据id查询交易备注信息
    @Select("select * from c_trade_remark where id = #{id}")
    TradeRemark getTradeRemarkById(String id);

    //添加交易备注记录
    void addTradeRemark(TradeRemark tradeRemark);

    //修改交易备注信息
    void editTradeRemark(TradeRemark tradeRemark);

    //根据id删除交易备注记录
    @Delete("delete from c_trade_remark where id = #{id}")
    void deleteTradeRemarkById(String id);

    //根据tradeIds删除交易备注相关信息
    void deleteTradeRemarkByTradeIds(String[] ids);

    //添加一条或多条备注到交易备注表中
    void addTradeRemarks(List<TradeRemark> tradeRemarks);
}
