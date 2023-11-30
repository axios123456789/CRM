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

    /**
     * 根据客户备注id查询客户备注信息
     * @param id
     * @return
     */
    @Override
    public CustomerRemark getCustomerRemarkById(String id) {
        CustomerRemark customerRemark = customerRemarkDao.getCustomerRemarkById(id);

        return customerRemark;
    }

    /**
     * 添加或修改备注信息
     * @param customerRemark
     * @return
     */
    @Override
    public boolean saveCustomerRemark(CustomerRemark customerRemark) {
        boolean flag = true;

        //根据客户备注id查询客户备注信息以此来判断执行添加操作还是修改操作
        CustomerRemark customerRemarkById = customerRemarkDao.getCustomerRemarkById(customerRemark.getId());

        try {
            if (customerRemarkById == null || "".equals(customerRemarkById) || "[]".equals(customerRemarkById)){//添加
                customerRemarkDao.addCustomerRemark(customerRemark);
            }else {//修改
                customerRemarkDao.updateCustomerRemark(customerRemark);
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }

    /**
     * 根据客户备注id删除客户备注信息
     * @param id
     * @return
     */
    @Override
    public boolean deleteCustomerRemark(String id) {
        boolean flag = true;

        try {
            customerRemarkDao.deleteCustomerRemark(id);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }

        return flag;
    }
}
