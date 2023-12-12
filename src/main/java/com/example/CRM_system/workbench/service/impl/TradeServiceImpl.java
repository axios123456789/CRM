package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.TransactionStatus;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.dao.TradeDao;
import com.example.CRM_system.workbench.dao.TradeRemarkDao;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("trade")
public class TradeServiceImpl implements TradeService {
    @Autowired
    private TradeDao tradeDao;

    @Autowired
    private TradeRemarkDao tradeRemarkDao;

    @Autowired
    private PlatformTransactionManager transactionManager;

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

    /**
     * 根据ids删除交易，交易备注，
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public boolean deleteTradeByIds(String[] ids) {
        org.springframework.transaction.TransactionStatus status = transactionManager.getTransaction(TransactionStatus.getTransactionStatus());
        try {
            //根据ids删除交易备注相关记录
            tradeRemarkDao.deleteTradeRemarkByTradeIds(ids);

            //根据ids删除交易
            tradeDao.deleteTradeByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
    }

    /**
     * 根据id查询交易信息，并将相关字段渲染成中文
     * @param id
     * @return
     */
    @Override
    public Trade getTradeSetChineseOwnerById(String id) {
        Trade trade = tradeDao.getTradeSetChineseOwnerById(id);

        return trade;
    }

    /**
     * 根据customerId查询交易列表信息
     * @param customerId
     * @return
     */
    @Override
    public List<Trade> getTradeListByCustomerId(String customerId) {
        List<Trade> trades = tradeDao.getTradeListByCustomerId(customerId);

        return trades;
    }

    /**
     * 根据contactId查询交易列表信息
     * @param contactId
     * @return
     */
    @Override
    public List<Trade> getTradeListByContactId(String contactId) {
        List<Trade> trades = tradeDao.getTradeListByContactId(contactId);

        return trades;
    }
}
