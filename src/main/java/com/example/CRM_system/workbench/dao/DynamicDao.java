package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.RecentlyCustomerVo;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.pojo.Trade;

import java.util.List;

public interface DynamicDao {
    //查询最近成交的客户
    List<RecentlyCustomerVo> selectRecentlyCustomer();

    //查找最近创建的交易记录
    List<Trade> selectRecentlyCreateTrade();

    //查询所有交易
    List<Trade> getAllTrade();

    //查询所有线索
    List<Clue> selectAllClue(Integer pageNoStr, Integer pageSizeStr);

    //查询所有线索的数量
    int getClueCount();
}
