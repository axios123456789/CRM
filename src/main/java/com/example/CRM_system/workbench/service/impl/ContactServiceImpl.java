package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.dao.ContactDao;
import com.example.CRM_system.workbench.dao.ContactRemarkDao;
import com.example.CRM_system.workbench.dao.CustomerDao;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service("contact")
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDao contactDao;

    @Autowired
    private CustomerDao customerDao;

    @Autowired
    private ContactRemarkDao contactRemarkDao;

    @Autowired
    private PlatformTransactionManager transactionManager;

    /**
     * 条件和分页查询联系人列表
     * @param contactReq
     * @return
     */
    @Override
    public PaginationVO<Contact> getContactListByCondition(ContactReq contactReq) {
        //条件查询联系人总记录数
        int total = contactDao.getContactTotalByCondition(contactReq);

        //条件查询联系人列表
        List<Contact> contacts = contactDao.getContactListByCondition(contactReq);

        //创建返回给前端的vo对象，将查到的总记录数和列表存入其中
        PaginationVO<Contact> paginationVO = new PaginationVO<>();
        paginationVO.setTotal(total);
        paginationVO.setDataList(contacts);

        return paginationVO;
    }

    /**
     * 根据id拿到对应联系人数据
     * @param id
     * @return
     */
    @Override
    public Contact getContactById(String id) {
        Contact contact = contactDao.getContactById(id);

        return contact;
    }

    /**
     * 根据id拿到对应联系人数据，并将联系人所有者渲染成中文
     * @param id
     * @return
     */
    @Override
    public Contact getContactMakeChineseOwnerById(String id) {
        Contact contact = contactDao.getContactMakeChineseOwnerById(id);

        return contact;
    }

    /**
     * 添加或修改联系人
     * @param contact
     * @param customerName
     * @return
     */
    @Transactional
    @Override
    public boolean saveContact(Contact contact, String customerName) {
        //开启一个新事务，并获取其状态
        TransactionStatus status = transactionManager.getTransaction(com.example.CRM_system.commons.utils.TransactionStatus.getTransactionStatus());

        try {
            if (customerName != null && customerName != "") {
                //根据客户名称到客户列表中查询客户信息，如果查到了则将id保存为concat中的customerId， 没查到则创建客户并保存到客户表中
                Customer customerByName = customerDao.getCustomerByAllName(customerName);
                if (customerByName != null && !("".equals(customerByName)) && !("[]".equals(customerByName))){
                    //设置客户id设为concat的customerId
                    contact.setCustomerId(customerByName.getId());
                }else {
                    //创建一个客户
                    Customer customer = new Customer();
                    customer.setId(UUIDUtil.getUUID());
                    customer.setOwner(contact.getOwner());
                    customer.setName(customerName);
                    customer.setCreateBy(contact.getCreateBy());
                    customer.setCreateTime(contact.getCreateTime());

                    //保存该客户到客户表中
                    customerDao.addCustomer(customer);

                    //将新创建的客户id作为contact的customerId
                    contact.setCustomerId(customer.getId());
                }
            }

            //根据联系人id到联系人表中查询，若查到了数据则为修改操作，否则为添加操作
            Contact contactById = contactDao.getContactById(contact.getId());
            if (contactById == null || "".equals(contactById) || "[]".equals(contactById)){//添加
                contactDao.addContact(contact);
            }else {//修改
                contactDao.updateContact(contact);
            }
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
    }

    /**
     * 根据ids删除联系人
     *
     * 在这个示例中，我们通过注入 PlatformTransactionManager来手动控制事务。
     * 首先，我们创建了一个新的事务定义 def，设置了事务传播行为为 PROPAGATION_REQUIRES_NEW，以便开启一个新的事务。
     * 接着，我们利用 transactionManager.getTransaction(def)来获取事务状态 status。
     * 在方法内部，我们首先执行 contactRemarkDao.deleteContactRemarkByContactIds(ids)操作，
     * 然后执行 contactDao.deleteContactByIds(ids)操作。
     * 如果任何一个操作抛出异常，我们就会调用 transactionManager.rollback(status)，手动回滚事务。
     * 通过这种方式，我们可以确保当 contactDao.deleteContactByIds(ids)失败时，
     * 已经提交成功的 contactRemarkDao.deleteContactRemarkByContactIds(ids)也会回滚。这样就能够保证数据的一致性。
     *
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public boolean deleteContactByIds(String[] ids) {
        /*DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRES_NEW);*/
        TransactionStatus status = transactionManager.getTransaction(com.example.CRM_system.commons.utils.TransactionStatus.getTransactionStatus());
        try {
            //根据ids删除联系人备注信息
            contactRemarkDao.deleteContactRemarkByContactIds(ids);

            //根据ids删除联系人
            contactDao.deleteContactByIds(ids);
        } catch (Exception e) {
            e.printStackTrace();
            transactionManager.rollback(status);
            return false;
        }
        transactionManager.commit(status);

        return true;
    }
}
