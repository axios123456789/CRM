package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.TransactionStatus;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.dao.*;
import com.example.CRM_system.workbench.pojo.*;
import com.example.CRM_system.workbench.service.ClueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    private CustomerDao customerDao;

    @Autowired
    private CustomerRemarkDao customerRemarkDao;

    @Autowired
    private ContactDao contactDao;

    @Autowired
    private ContactRemarkDao contactRemarkDao;

    @Autowired
    private ContactActivityRelationDao contactActivityRelationDao;

    @Autowired
    private TradeDao tradeDao;

    @Autowired
    private TradeRemarkDao tradeRemarkDao;

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
     * 核心，进行线索转换操作
     * @param clueMap
     * @return
     */
    @Transactional
    @Override
    public boolean clueChange(Map<String, String> clueMap) {
        org.springframework.transaction.TransactionStatus status = transactionManager.getTransaction(TransactionStatus.getTransactionStatus());
        try {
            //线索转换
            //前置步骤
            //a.根据线索id查询线索信息
            Clue clue = clueDao.getClueById02(clueMap.get("id"));

            //b.根据线索id查询线索备注信息
            List<ClueRemark> clueRemarks = clueRemarkDao.getClueRemarkByClueId(clueMap.get("id"));

            //c.根据线索id查询与之关联的市场活动
            List<ClueActivityRelation> clueActivityRelations = clueActivityRelationDao.getWithClueRelationActivityListByClueId(clueMap.get("id"));

            //1.将该线索下的客户信息转换到客户表中
            //1.1根据clue.getCompany()在客户表中进行查询，判断客户是否存在
            Customer customerByAllName = customerDao.getCustomerByAllName(clue.getCompany());
            String customerId;
            if (customerByAllName == null || "".equals(customerByAllName) || "[]".equals(customerByAllName)) {//进行转换
                Customer customer = new Customer();
                customer.setId(UUIDUtil.getUUID());
                customer.setOwner(clueMap.get("owner"));
                customer.setName(clue.getCompany());
                customer.setCompanyWebsite(clue.getCompanyWebsite());
                customer.setCompanyExtension(clue.getCompanyExtension());
                customer.setCreateBy(clueMap.get("createBy"));
                customer.setCreateTime(DateTimeUtil.getSysTime());

                //1.2将该线索转换的客户添加到客户表中
                customerDao.addCustomer(customer);

                customerId = customer.getId();
            }else {//更新原有信息
                customerByAllName.setName(clue.getCompany());
                customerByAllName.setCompanyWebsite(clue.getCompanyWebsite());
                customerByAllName.setCompanyExtension(clue.getCompanyExtension());
                customerByAllName.setEditBy(clueMap.get("createBy"));
                customerByAllName.setEditTime(DateTimeUtil.getSysTime());

                //1.3.跟新该客户信息
                customerDao.editCustomer(customerByAllName);

                customerId = customerByAllName.getId();
            }

            //2.将该线索下的备注信息转换到客户备注表中
            //2.1.准备好数据
            List<CustomerRemark> customerRemarks = new ArrayList<>();
            for (int i = 0; i < clueRemarks.size(); i++) {
                CustomerRemark customerRemark = new CustomerRemark();
                customerRemark.setId(UUIDUtil.getUUID());
                customerRemark.setNoteContent(clueRemarks.get(i).getNoteContent());
                customerRemark.setCreateBy(clueRemarks.get(i).getCreateBy());
                customerRemark.setCreateTime(clueRemarks.get(i).getCreateTime());
                customerRemark.setEditBy(clueRemarks.get(i).getEditBy());
                customerRemark.setEditTime(clueRemarks.get(i).getEditTime());
                customerRemark.setEditFlag(clueRemarks.get(i).getEditFlag());
                customerRemark.setCustomerId(customerId);
                customerRemarks.add(customerRemark);
            }
            //2.2一次添加多条记录到客户备注表中去
            if (customerRemarks.size() > 0){
                customerRemarkDao.addCustomerRemarks(customerRemarks);
            }

            //3.将该线索下的个人信息转换到联系人表中
            //3.1.根据clue.getName()在联系人表中进行全名查询，判断联系人是否存在
            Contact contactByAllName = contactDao.getContactByAllName(clue.getName());
            String contactId;
            if (contactByAllName == null || "".equals(contactByAllName) || "[]".equals(contactByAllName)){//进行转换
                Contact contact = new Contact();
                contact.setId(UUIDUtil.getUUID());
                contact.setOwner(clueMap.get("owner"));
                contact.setSource(clue.getClueSource());
                contact.setName(clue.getName());
                contact.setSalutation(clue.getSalutation());
                contact.setEmail(clue.getEmail());
                contact.setPhone(clue.getPhone());
                contact.setPosition(clue.getPosition());
                contact.setCreateBy(clueMap.get("createBy"));
                contact.setCreateTime(DateTimeUtil.getSysTime());
                contact.setDescription(clue.getDescription());
                contact.setContactMinute(clue.getContactMinute());
                contact.setNextContactTime(clue.getNextContactTime());
                contact.setDetailAddress(clue.getDetailAddress());
                contact.setCustomerId(customerId);

                //3.2.将该线索转换的联系人添加到联系人列表中
                contactDao.addContact(contact);

                contactId = contact.getId();
            }else {//跟新原有数据
                contactByAllName.setSource(clue.getClueSource());
                contactByAllName.setName(clue.getName());
                contactByAllName.setSalutation(clue.getSalutation());
                contactByAllName.setEmail(clue.getEmail());
                contactByAllName.setPhone(clue.getPhone());
                contactByAllName.setPosition(clue.getPosition());
                contactByAllName.setEditBy(clueMap.get("createBy"));
                contactByAllName.setEditTime(DateTimeUtil.getSysTime());
                contactByAllName.setDescription(clue.getDescription());
                contactByAllName.setContactMinute(clue.getContactMinute());
                contactByAllName.setNextContactTime(clue.getNextContactTime());
                contactByAllName.setDetailAddress(clue.getDetailAddress());
                contactByAllName.setCustomerId(customerId);

                //3.3.跟新该联系人信息
                contactDao.updateContact(contactByAllName);

                contactId = contactByAllName.getId();
            }

            //4.将该线索下的备注信息转换到联系人备注表中
            //4.1.准备好数据
            List<ContactRemark> contactRemarks = new ArrayList<>();
            for (int i = 0; i < clueRemarks.size(); i++) {
                ContactRemark contactRemark = new ContactRemark();
                contactRemark.setId(UUIDUtil.getUUID());
                contactRemark.setNoteContent(clueRemarks.get(i).getNoteContent());
                contactRemark.setCreateBy(clueRemarks.get(i).getCreateBy());
                contactRemark.setCreateTime(clueRemarks.get(i).getCreateTime());
                contactRemark.setEditBy(clueRemarks.get(i).getEditBy());
                contactRemark.setEditTime(clueRemarks.get(i).getEditTime());
                contactRemark.setEditFlag(clueRemarks.get(i).getEditFlag());
                contactRemark.setContactId(contactId);
                contactRemarks.add(contactRemark);
            }
            //4.2.一次添加多条备注到联系人备注表中
            if (contactRemarks.size() > 0) {
                contactRemarkDao.addContactRemarks(contactRemarks);
            }

            //5.将线索与市场活动的关联关系转换到联系人市场活动关联关系表中
            //5.1.准备数据
            List<ContactActivityRelation> contactActivityRelations = new ArrayList<>();
            for (int i = 0; i < clueActivityRelations.size(); i++) {
                ContactActivityRelation contactActivityRelation = new ContactActivityRelation();
                contactActivityRelation.setId(UUIDUtil.getUUID());
                contactActivityRelation.setContactId(contactId);
                contactActivityRelation.setActivityId(clueActivityRelations.get(i).getActivityId());
                contactActivityRelations.add(contactActivityRelation);
            }
            //5.2.一次添加多条记录到联系人市场活动关联关系表中
            if (contactActivityRelations.size() > 1){
                contactActivityRelationDao.addContactAndActivityRelation(contactActivityRelations);
            }

            //入果创建了交易即
            System.out.println("isCreateTrade"+clueMap.get("isCreateTrade"));
            if ("1".equals(clueMap.get("isCreateTrade"))){
                System.out.println("执行力");
                //6.交易信息保存到交易表中
                Trade trade = new Trade();
                trade.setId(UUIDUtil.getUUID());
                trade.setOwner(clueMap.get("owner"));
                trade.setAmount(clueMap.get("amount"));
                trade.setName(clueMap.get("tradeName"));
                trade.setExpectedTradeDate(clueMap.get("expectedTradeDate"));
                trade.setStage(clueMap.get("stage"));
                trade.setType("新业务");
                trade.setSource(clue.getClueSource());
                trade.setCreateBy(clueMap.get("createBy"));
                trade.setCreateTime(DateTimeUtil.getSysTime());
                trade.setCustomerId(customerId);
                trade.setContactId(contactId);
                trade.setActivityId(clueMap.get("activityId"));
                tradeDao.addTrade(trade);

                //7.将线索下的备注信息转换到交易备注表中
                //7.1.准备数据
                List<TradeRemark> tradeRemarks = new ArrayList<>();
                for (int i = 0; i < clueRemarks.size(); i++) {
                    TradeRemark tradeRemark = new TradeRemark();
                    tradeRemark.setId(UUIDUtil.getUUID());
                    tradeRemark.setNoteContent(clueRemarks.get(i).getNoteContent());
                    tradeRemark.setCreateBy(clueRemarks.get(i).getCreateBy());
                    tradeRemark.setCreateTime(clueRemarks.get(i).getCreateTime());
                    tradeRemark.setEditBy(clueRemarks.get(i).getEditBy());
                    tradeRemark.setEditTime(clueRemarks.get(i).getEditTime());
                    tradeRemark.setEditFlag(clueRemarks.get(i).getEditFlag());
                    tradeRemark.setTradeId(trade.getId());
                    tradeRemarks.add(tradeRemark);
                }
                //7.2.添加一条或多条备注到交易备注表中
                if (tradeRemarks.size() > 1){
                    tradeRemarkDao.addTradeRemarks(tradeRemarks);
                }
            }

            String[] clueIds = {clueMap.get("id")};

            //8.删除该线索的备注
            clueRemarkDao.deleteClueRemarkByClueIds(clueIds);

            //9.删除该线索与市场活动的关联关系
            clueActivityRelationDao.deleteClueAndActivityRelationByClueId(clueIds);

            //10.删除该线索
            clueDao.deleteClueByIds(clueIds);

        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
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
