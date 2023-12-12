package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.workbench.dao.ContactActivityRelationDao;
import com.example.CRM_system.workbench.dao.ContactRemarkDao;
import com.example.CRM_system.workbench.pojo.ContactActivityRelation;
import com.example.CRM_system.workbench.pojo.ContactRemark;
import com.example.CRM_system.workbench.service.ContactRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("contactRemark")
public class ContactRemarkServiceImpl implements ContactRemarkService {
    @Autowired
    private ContactRemarkDao contactRemarkDao;

    @Autowired
    private ContactActivityRelationDao contactActivityRelationDao;

    /**
     * 根据contactId查询联系人备注列表信息
     * @param contactId
     * @return
     */
    @Override
    public List<ContactRemark> getContactRemarkListByContactId(String contactId) {
        List<ContactRemark> contactRemarks = contactRemarkDao.getContactRemarkListByContactId(contactId);

        return contactRemarks;
    }

    /**
     * 根据id查询联系人备注信息
     * @param id
     * @return
     */
    @Override
    public ContactRemark getContactRemarkById(String id) {
        ContactRemark contactRemark = contactRemarkDao.getContactRemarkById(id);

        return contactRemark;
    }

    /**
     * 添加或修改联系人备注
     * @param contactRemark
     * @return
     */
    @Override
    public boolean saveContactRemark(ContactRemark contactRemark) {
        boolean flag = true;

        //根据id查询联系人备注是否存在，存在则修改，不存在则为添加
        ContactRemark contactRemarkById = contactRemarkDao.getContactRemarkById(contactRemark.getId());
        try {
            if (contactRemarkById == null || "".equals(contactRemarkById) || "[]".equals(contactRemarkById)){//添加
                contactRemarkDao.addContactRemark(contactRemark);
            }else {//修改
                contactRemarkDao.updateContactRemark(contactRemark);
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 根据id删除联系人备注
     * @param id
     * @return
     */
    @Override
    public boolean deleteContactRemarkById(String id) {
        boolean flag = true;

        //删除联系人备注
        try {
            contactRemarkDao.deleteContactRemarkById(id);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 添加联系人与市场活动关联关系
     * @param contactId
     * @param activityIds
     * @return
     */
    @Override
    public boolean addContactAndActivityRelation(String contactId, String[] activityIds) {
        //处理数据
        List<ContactActivityRelation> contactActivityRelations = new ArrayList<>();
        for (int i = 0; i < activityIds.length; i++) {
            ContactActivityRelation contactActivityRelation = new ContactActivityRelation();
            contactActivityRelation.setId(UUIDUtil.getUUID());
            contactActivityRelation.setContactId(contactId);
            contactActivityRelation.setActivityId(activityIds[i]);
            contactActivityRelations.add(contactActivityRelation);
        }

        try {
            //执行添加数据到联系人市场活动关联关系表中
            contactActivityRelationDao.addContactAndActivityRelation(contactActivityRelations);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 解除联系人与市场活动关联
     * @param contactId
     * @param activityId
     * @return
     */
    @Override
    public boolean deleteContactWithActivityRelation(String contactId, String activityId) {
        try {
            contactActivityRelationDao.deleteContactWithActivityRelation(contactId, activityId);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
