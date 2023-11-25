package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.SqlSessionUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.dao.ClueActivityRelationDao;
import com.example.CRM_system.workbench.dao.ClueDao;
import com.example.CRM_system.workbench.dao.ClueRemarkDao;
import com.example.CRM_system.workbench.pojo.Clue;
import com.example.CRM_system.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
    @Override
    @Transactional
    public boolean deleteClue(String[] ids) {
        boolean flag = true;

        /*//查询需要删除的线索备注的数量
        int remarkCount = clueRemarkDao.getClueRemarkCountByClueIds(ids);

        //删除线索备注，返回删除的记录数
        int delRemarkCount = clueRemarkDao.deleteClueRemarkByClueIds(ids);

        //比较查询到的需要删除的备注数量和实际删除的线索备注数量，相同则删除成功，不同则删除出现业务问题
        if (remarkCount != delRemarkCount){
            flag = false;
        }

        //删除线索,返回删除的记录数
        int delClueCount = clueDao.deleteClueByIds(ids);

        //比较实际删除的线索数量和ids的长度（需要删除的线索数量），相同则删除成功，不同则删除出现业务问题
        if (delClueCount != ids.length){
            flag = false;
        }*/

        try {
            //删除线索备注
            clueRemarkDao.deleteClueRemarkByClueIds(ids);

            //根据线索id删除线索市场活动关联关系表中的相关记录
            clueActivityRelationDao.deleteClueAndActivityRelationByClueId(ids);

            //删除线索
            clueDao.deleteClueByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }
}
