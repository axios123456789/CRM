package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ContactReq;
import com.example.CRM_system.workbench.dao.ContactDao;
import com.example.CRM_system.workbench.pojo.Contact;
import com.example.CRM_system.workbench.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("contact")
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDao contactDao;

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
}
