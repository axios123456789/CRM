package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.settings.pojo.User;
import com.example.CRM_system.commons.utils.SqlSessionUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.workbench.dao.ActivityDao;
import com.example.CRM_system.workbench.dao.ActivityRemarkDao;
import com.example.CRM_system.workbench.dao.ClueActivityRelationDao;
import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.service.ActivityRemarkService;
import com.example.CRM_system.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("activity")
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityDao activityDao;

    @Autowired
    private ActivityRemarkDao activityRemarkDao;

    @Autowired
    private ClueActivityRelationDao clueActivityRelationDao;

    /**
     * 保存数据到市场活动列表中 包括修改和添加
     * @param activity
     * @return
     */
    @Override
    public boolean save(Activity activity) {
        boolean flag = true;

        //判断id是否存在
        int countSelect = activityDao.selectById(activity.getId());

        //id存在执行修改操作 不存在执行添加操作
        if (countSelect == 1){
            try {
                activityDao.upData(activity);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }else {
            try {
                activityDao.save(activity);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }

        return flag;
    }

    /**
     * 条件查询市场活动列表
     * @param map   查询的条件
     * @return
     */
    @Override
    public PaginationVO<Activity> getActivityList(Map<String, Object> map) {
        //取得total
        int total = activityDao.getTotalByCondition(map);

        //取得dataList
        List<Activity> dataList = activityDao.getActivityListByCondition(map);

        //创建一个vo对象 将total和dataList封装到vo中
        PaginationVO<Activity> vo = new PaginationVO<>();
        vo.setTotal(total);
        vo.setDataList(dataList);

        return vo;
    }

    /**
     * 删除市场活动列表的数据 一条或多条
     * @param ids
     * @return
     */
    @Override
    @Transactional
    public boolean delete(String[] ids) {
        boolean flag = true;

        /*//查询需要删除的市场活动备注的数量
        int remarkCount = activityRemarkDao.getCountByAids(ids);

        //删除市场活动备注， 返回受到影响的条数（实际删除的数量）
        int delRemarkCount = activityRemarkDao.deleteCountByAids(ids);

        if (remarkCount != delRemarkCount){
            flag = false;
        }

        //删除市场活动
        int delActivityCount = activityDao.deleteActivityByIds(ids);
        if (delActivityCount != ids.length){
            flag = false;
        }*/

        try {
            //删除市场活动备注
            activityRemarkDao.deleteCountByAids(ids);

            //根据市场活动id删除市场活动线索关联关系表中的记录
            clueActivityRelationDao.deleteClueAndActivityRelationByActivityIds(ids);

            //删除市场活动
            activityDao.deleteActivityByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 通过id查询到市场活动的一条数据 这条数据在前端点击修改按钮时被接收到
     * @param id
     * @return
     */
    @Override
    public Activity getActivityById(String id) {
        Activity activity = activityDao.getActivityById(id);

        return activity;
    }

    /**
     * 根据id查询市场活动数据 要求将owner渲染成名字 所以不能复用activityDao.getActivityById(String id)
     * @param id
     * @return
     */
    @Override
    public Activity detail(String id) {
        Activity activity = activityDao.detail(id);

        return activity;
    }

    @Override
    public List<Activity> getActivityListByName(String name) {
        List<Activity> activities = activityDao.getActivityListByName(name);

        return activities;
    }
}
