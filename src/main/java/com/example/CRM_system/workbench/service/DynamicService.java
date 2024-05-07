package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.RecentlyCustomerVo;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.pojo.Trade;

import java.util.List;

public interface DynamicService {
    List<RecentlyCustomerVo> getRecentlyCustomer(); //查询最近成交的客户

    List<Trade> getRecentlyCreateTrade();   //查询最近创建的交易

    List<Trade> getAllTrade();  //查询所有交易

    PaginationVO<Clue> getAllClue(Integer pageNoStr, Integer pageSizeStr);  //查询所有线索
}
