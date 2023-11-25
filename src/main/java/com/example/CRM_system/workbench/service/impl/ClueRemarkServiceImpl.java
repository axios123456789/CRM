package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.workbench.dao.ActivityDao;
import com.example.CRM_system.workbench.dao.ClueActivityRelationDao;
import com.example.CRM_system.workbench.dao.ClueRemarkDao;
import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.pojo.ClueActivityRelation;
import com.example.CRM_system.workbench.pojo.ClueRemark;
import com.example.CRM_system.workbench.service.ClueRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("clueRemark")
public class ClueRemarkServiceImpl implements ClueRemarkService {
    @Autowired
    private ClueRemarkDao clueRemarkDao;

    @Autowired
    private ActivityDao activityDao;

    @Autowired
    private ClueActivityRelationDao clueActivityRelationDao;

    /**
     * 根据线索id查询所有备注
     * @param id
     * @return
     */
    @Override
    public List<ClueRemark> getClueRemarkByClueId(String id) {
        List<ClueRemark> clueRemarks = clueRemarkDao.getClueRemarkByClueId(id);

        return clueRemarks;
    }

    /**
     * 添加或修改备注信息
     * @param clueRemark
     * @return
     */
    @Override
    public boolean saveClueRemark(ClueRemark clueRemark) {
        boolean flag = true;

        //根据id查备注
        int countClueRemark = clueRemarkDao.getClueRemarkCountById(clueRemark.getId());

        //判断查到的备注是否为空，为空则为添加，不为空就是修改
        if (countClueRemark == 1){//修改
            try {
                clueRemarkDao.editClueRemarkById(clueRemark);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }else{//添加
            try {
                clueRemarkDao.addClueRemarkById(clueRemark);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }

        return flag;
    }

    /**
     * 根据id查备注信息
     * @param id
     * @return
     */
    @Override
    public ClueRemark getClueRemarkById(String id) {
        ClueRemark clueRemark = clueRemarkDao.getClueRemarkById(id);

        return clueRemark;
    }

    /**
     * 根据id删除备注信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteClueRemarkById(String id) {
        boolean flag = true;

        try {
            clueRemarkDao.deleteClueRemarkById(id);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 根据线索id查看市场活动信息
     * @param clueId
     * @return
     */
    @Override
    public List<Activity> getActivityListByClueId(String clueId) {
        List<Activity> activities = activityDao.getActivityListByClueId(clueId);

        return activities;
    }

    /**
     * 根据线索id查询没有被关联的市场活动信息列表
     * @param clueId
     * @return
     */
    @Override
    public List<Activity> getNotBeRelationActivityByClueId(String clueId) {
        List<Activity> activities = activityDao.getNotBeRelationActivityByClueId(clueId);

        return activities;
    }

    /**
     * 关联市场活动
     * @param clueId
     * @param activityId
     * @return
     */
    @Override
    public boolean addClueAndActivityRelation(String clueId, String[] activityId) {
        boolean flag = true;

        //将参数处理成List<Map>类型，保证一次性添加所有数据
        List<ClueActivityRelation> clueActivityRelation = new ArrayList<>();

        for (int i = 0; i < activityId.length; i++) {
            ClueActivityRelation clueActivityRelation1 = new ClueActivityRelation();
            clueActivityRelation1.setId(UUIDUtil.getUUID());
            clueActivityRelation1.setClueId(clueId);
            clueActivityRelation1.setActivityId(activityId[i]);
            clueActivityRelation.add(clueActivityRelation1);
        }

        //System.out.println("list:"+clueActivityRelation);

        try {
            clueActivityRelationDao.addClueAndActivityRelation(clueActivityRelation);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 解除线索与市场活动的关联
     * @param clueId
     * @param activityId
     * @return
     */
    @Override
    public boolean deleteClueAndActivityRelationByClueIdAndActivityId(String clueId, String activityId) {
        boolean flag = true;

        //System.out.println("clueId:"+clueId+"activityId"+activityId);
        try {
            clueActivityRelationDao.deleteClueAndActivityRelationByClueIdAndActivityId(clueId, activityId);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }
}
