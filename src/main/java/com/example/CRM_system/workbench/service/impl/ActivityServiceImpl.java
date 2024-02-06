package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.TransactionStatus;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.workbench.dao.ActivityDao;
import com.example.CRM_system.workbench.dao.ActivityRemarkDao;
import com.example.CRM_system.workbench.dao.ClueActivityRelationDao;
import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;

import java.util.HashMap;
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

    @Autowired
    private PlatformTransactionManager transactionManager;

    /**
     * 保存数据到市场活动列表中 包括修改和添加
     * @param activity
     * @return
     */
    @Override
    public boolean save(Activity activity) {
        //判断id是否存在
        int countSelect = activityDao.selectById(activity.getId());
        try {
            //id存在执行修改操作 不存在执行添加操作
            if (countSelect == 1){
                activityDao.upData(activity);
            }else {
                activityDao.save(activity);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
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
    public boolean delete(String[] ids) {
        org.springframework.transaction.TransactionStatus status = transactionManager.getTransaction(TransactionStatus.getTransactionStatus());
        try {
            //删除市场活动备注
            activityRemarkDao.deleteCountByAids(ids);

            //根据市场活动id删除市场活动线索关联关系表中的记录
            clueActivityRelationDao.deleteClueAndActivityRelationByActivityIds(ids);

            //删除市场活动
            activityDao.deleteActivityByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
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

    /**
     * 根据名字模糊查询市场活动信息在没有被关联的市场活动列表中
     * @param name
     * @return
     */
    @Override
    public List<Activity> getNotBeRelationActivityListByName(String name, String clueId) {
        List<Activity> activities = activityDao.getNotBeRelationActivityListByName(name, clueId);

        return activities;
    }

    /**
     * 根据名字模糊查询被关联的市场活动列表
     * @param name
     * @param clueId
     * @return
     */
    @Override
    public List<Activity> getBeRelationActivityListByName(String name, String clueId) {
        List<Activity> activities = activityDao.getBeRelationActivityListByName(name, clueId);

        return activities;
    }

    /**
     * 根据联系人id查询与之关联的市场活动列表
     * @param contactId
     * @return
     */
    @Override
    public List<Activity> getActivityListRelationWithContactByContactId(String contactId) {
        List<Activity> activities = activityDao.getActivityListRelationWithContactByContactId(contactId);

        return activities;
    }

    /**
     * 根据联系人id查询没有被关联的市场活动列表
     * @param contactId
     * @return
     */
    @Override
    public List<Activity> getNotBeRelationActivityListByContactId(String contactId) {
        List<Activity> activities = activityDao.getNotBeRelationActivityListByContactId(contactId);

        return activities;
    }

    /**
     * 根据联系人id和市场活动名字模糊查询没有被关联的市场活动列表
     * @param name
     * @param contactId
     * @return
     */
    @Override
    public List<Activity> getNotBeRelationActivityListByNameAndContactId(String name, String contactId) {
        List<Activity> activities = activityDao.getNotBeRelationActivityListByNameAndContactId(name, contactId);

        return activities;
    }

    /**
     * 显示市场活动相关图表
     * @return
     */
    @Override
    public Map<String ,List<TradeChartsVo>> showActivityCharts() {
        List<TradeChartsVo> activityListGroupByName = activityDao.getActivityListGroupByName();

        List<TradeChartsVo> activityListGroupByCost = activityDao.getActivityListGroupByCost();

        List<TradeChartsVo> activityListGroupByOwner = activityDao.getActivityListGroupByOwner();

        Map<String, List<TradeChartsVo>> map = new HashMap<>();
        map.put("activityName", activityListGroupByName);
        map.put("activityCost", activityListGroupByCost);
        map.put("activityOwner", activityListGroupByOwner);

        return map;
    }
}
