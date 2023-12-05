package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.TransactionStatus;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.dao.ClueActivityRelationDao;
import com.example.CRM_system.workbench.dao.ClueDao;
import com.example.CRM_system.workbench.dao.ClueRemarkDao;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("clue")
public class ClueServiceImpl implements ClueService {
    //private ClueDao clueDao = SqlSessionUtil.getSession().getMapper(ClueDao.class);
    @Autowired
    private ClueDao clueDao;

    @Autowired
    private ClueRemarkDao clueRemarkDao;

    @Autowired
    private ClueActivityRelationDao clueActivityRelationDao;

    @Autowired
    private PlatformTransactionManager transactionManager;

    /**
     * 条件查询线索列表
     * @param clueReq 查询的条件对象
     * @return
     */
    @Override
    public PaginationVO<Clue> getClueListByCondition(ClueReq clueReq) {
        //取得总条数
        int total = clueDao.getClueTotalByCondition(clueReq);

        //取得查到的线索列表（dataList）
        List<Clue> clues = clueDao.getClueListByCondition(clueReq);

        //创建PaginationVo对象
        PaginationVO paginationVO = new PaginationVO();
        paginationVO.setTotal(total);
        paginationVO.setDataList(clues);

        return paginationVO;
    }

    /**
     * 根据id查询线索列表
     * @param id
     * @return
     */
    @Override
    public Clue getClueById(String id) {
        Clue clue = clueDao.getClueById(id);

        return clue;
    }

    @Override
    public Clue getClueById02(String id) {
        Clue clue = clueDao.getClueById02(id);

        return clue;
    }

    /**
     * 添加线索
     * @param clue
     * @return
     */
    @Override
    public boolean addClue(Clue clue) {
        boolean flag = true;

        try {
            clueDao.addClue(clue);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 修改线索
     * @param clue
     * @return
     */
    @Override
    public boolean updateClue(Clue clue) {
        boolean flag = true;

        try {
            clueDao.updateClue(clue);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 批量删除线索和每个线索对应的线索备注
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public boolean deleteClue(String[] ids) {
        org.springframework.transaction.TransactionStatus status = transactionManager.getTransaction(TransactionStatus.getTransactionStatus());

        try {
            //删除线索备注
            clueRemarkDao.deleteClueRemarkByClueIds(ids);

            //根据线索id删除线索市场活动关联关系表中的相关记录
            clueActivityRelationDao.deleteClueAndActivityRelationByClueId(ids);

            //删除线索
            clueDao.deleteClueByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
    }
}
