package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.workbench.dao.CustomerRemarkDao;
import com.example.CRM_system.workbench.pojo.CustomerRemark;
import com.example.CRM_system.workbench.service.CustomerRemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("customerRemark")
public class CustomerRemarkServiceImpl implements CustomerRemarkService {
    @Autowired
    private CustomerRemarkDao customerRemarkDao;

    /**
     * 根据客户id查询客户备注信息列表
     * @param customerId
     * @return
     */
    @Override
    public List<CustomerRemark> getCustomerRemarkListByCustomerId(String customerId) {
        List<CustomerRemark> customerRemarks = customerRemarkDao.getCustomerRemarkListByCustomerId(customerId);

        return customerRemarks;
    }
}
