package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.dao.TradeDao;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("trade")
public class TradeServiceImpl implements TradeService {
    @Autowired
    private TradeDao tradeDao;

    /**
     * 条件和分页查询交易列表
     * @param tradeReq
     * @return
     */
    @Override
    public PaginationVO<Trade> getTradeListByCondition(TradeReq tradeReq) {
        //条件查询交易的记录数
        int total = tradeDao.getTradeCountByCondition(tradeReq);

        //条件查询交易列表
        List<Trade> trades = tradeDao.getTradeListByCondition(tradeReq);

        //创建返回给前端的VO对象
        PaginationVO<Trade> paginationVO = new PaginationVO<>();
        paginationVO.setTotal(total);
        paginationVO.setDataList(trades);

        return paginationVO;
    }

    /**
     * 添加交易
     * @param trade
     * @return
     */
    @Override
    public boolean addTrade(Trade trade) {
        try {
            tradeDao.addTrade(trade);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据id查询交易信息
     * @param id
     * @return
     */
    @Override
    public Trade getTradeById(String id) {
        Trade trade = tradeDao.getTradeById(id);

        return trade;
    }

    /**
     * 修改交易
     * @param trade
     * @return
     */
    @Override
    public boolean editTrade(Trade trade) {
        try {
            tradeDao.editTrade(trade);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
