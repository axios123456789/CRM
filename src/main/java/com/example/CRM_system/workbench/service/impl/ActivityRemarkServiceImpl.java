package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.workbench.dao.ActivityRemarkDao;
import com.example.CRM_system.workbench.pojo.ActivityRemark;
import com.example.CRM_system.workbench.service.ActivityRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("activityRemark")
public class ActivityRemarkServiceImpl implements ActivityRemarkService {
    @Autowired
    private ActivityRemarkDao activityRemarkDao;
    /**
     * 根据外键id查询市场活动备注表
     * @param id
     * @return
     */
    @Override
    public List<ActivityRemark> getRemarkByAid(String id) {
        List<ActivityRemark> activityRemarks = activityRemarkDao.getRemarkByAid(id);

        return activityRemarks;
    }

    /**
     * 市场活动备注的添加和修改
     * @param activityRemark
     * @return
     */
    @Override
    public boolean saveRemark(ActivityRemark activityRemark) {
        boolean flag = true;

        //根据id查询该id的备注信息
        int countId = activityRemarkDao.getRemarkById(activityRemark.getId());

        if (countId == 1){//修改
            try {
                activityRemarkDao.updateRemark(activityRemark);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }else {//添加
            try {
                activityRemarkDao.addRemark(activityRemark);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }

        return flag;
    }

    /**
     * 根据id删除备注信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteRemark(String id) {
        boolean flag = true;

        try {
            activityRemarkDao.deleteRemark(id);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    @Override
    public ActivityRemark getRemarkById(String id) {
        ActivityRemark activityRemark = activityRemarkDao.getRemarkObjById(id);

        return activityRemark;
    }
}
