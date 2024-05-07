package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.RecentlyCustomerVo;
import com.example.CRM_system.workbench.dao.DynamicDao;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.DynamicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dynamic")
public class DynamicServiceImpl implements DynamicService {
    @Autowired
    private DynamicDao dynamicDao;

    /**
     * 查询最近成交的客户
     * @return
     */
    @Override
    public List<RecentlyCustomerVo> getRecentlyCustomer() {
        List<RecentlyCustomerVo> recentlyCustomerVos = dynamicDao.selectRecentlyCustomer();

        return recentlyCustomerVos;
    }

    /**
     * 查询最近创建的交易
     * @return
     */
    @Override
    public List<Trade> getRecentlyCreateTrade() {
        List<Trade> trades = dynamicDao.selectRecentlyCreateTrade();
        return trades;
    }

    /**
     * 查询所有交易
     * @return
     */
    @Override
    public List<Trade> getAllTrade() {
        List<Trade> trades = dynamicDao.getAllTrade();
        return trades;
    }

    /**
     * 查询所有线索
     * @param pageNoStr
     * @param pageSizeStr
     * @return
     */
    @Override
    public PaginationVO<Clue> getAllClue(Integer pageNoStr, Integer pageSizeStr) {
        List<Clue> cluePaginationVO = dynamicDao.selectAllClue(pageNoStr, pageSizeStr);
        int count = dynamicDao.getClueCount();

        PaginationVO<Clue> objectPaginationVO = new PaginationVO<>();
        objectPaginationVO.setDataList(cluePaginationVO);
        objectPaginationVO.setTotal(count);
        return objectPaginationVO;
    }
}
