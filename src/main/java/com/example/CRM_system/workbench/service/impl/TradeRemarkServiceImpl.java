package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.workbench.dao.TradeRemarkDao;
import com.example.CRM_system.workbench.pojo.TradeRemark;
import com.example.CRM_system.workbench.service.TradeRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tradeRemark")
public class TradeRemarkServiceImpl implements TradeRemarkService {
    @Autowired
    private TradeRemarkDao tradeRemarkDao;

    /**
     * 根据交易id查询交易备注相关信息列表
     * @param tradeId
     * @return
     */
    @Override
    public List<TradeRemark> getTradeRemarkListByTradeId(String tradeId) {
        List<TradeRemark> tradeRemarks = tradeRemarkDao.getTradeRemarkListByTradeId(tradeId);

        return tradeRemarks;
    }

    /**
     * 根据id查询交易备注信息
     * @param id
     * @return
     */
    @Override
    public TradeRemark getTradeRemarkById(String id) {
        TradeRemark tradeRemark = tradeRemarkDao.getTradeRemarkById(id);

        return tradeRemark;
    }

    /**
     * 添加或修改交易备注
     * @param tradeRemark
     * @return
     */
    @Override
    public boolean saveTradeRemark(TradeRemark tradeRemark) {
        //根据id查询交易备注信息
        TradeRemark tradeRemarkById = tradeRemarkDao.getTradeRemarkById(tradeRemark.getId());

        //根据查到的备注信息是否为空来判断是添加还是修改备注信息
        try {
            if (tradeRemarkById == null || "".equals(tradeRemarkById) || "[]".equals(tradeRemarkById)){//添加
                tradeRemarkDao.addTradeRemark(tradeRemark);
            }else {//修改
                tradeRemarkDao.editTradeRemark(tradeRemark);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据id删除交易备注信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteTradeRemarkById(String id) {
        try {
            tradeRemarkDao.deleteTradeRemarkById(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
