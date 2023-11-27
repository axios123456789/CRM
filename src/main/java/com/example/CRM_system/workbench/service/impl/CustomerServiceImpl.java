package com.example.CRM_system.workbench.service.impl;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.CustomerReq;
import com.example.CRM_system.workbench.dao.CustomerDao;
import com.example.CRM_system.workbench.pojo.Customer;
import com.example.CRM_system.workbench.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("customer")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    /**
     * 条件查询客户列表数据
     * @param customerReq
     * @return
     */
    @Override
    public PaginationVO<Customer> getCustomerListByCondition(CustomerReq customerReq) {
        //拿到查到的总条数
        int total = customerDao.getCustomerListTotalByCondition(customerReq);

        //拿到查询到的客户列表
        List<Customer> customers = customerDao.getCustomerListByCondition(customerReq);

        //创建vo对象封装数据
        PaginationVO paginationVO = new PaginationVO();
        paginationVO.setTotal(total);
        paginationVO.setDataList(customers);

        return paginationVO;
    }

    /**
     * 根据id查询客户列表
     * @param id
     * @return
     */
    @Override
    public Customer getCustomerById(String id) {
        Customer customer = customerDao.getCustomerById(id);

        return customer;
    }

    /**
     * 添加或修改客户信息
     * @param customer
     * @return
     */
    @Override
    public boolean saveCustomer(Customer customer) {
        boolean flag = true;

        //根据id查询客户信息
        Customer customerById = customerDao.getCustomerById(customer.getId());

        //判断查到的客户信息是否为空，如果为空则执行添加操作，否则执行修改操作
        if (customerById == null || "[]".equals(customerById) || "".equals(customerById)){//添加
            try {
                customerDao.addCustomer(customer);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }else {//修改
            try {
                customerDao.editCustomer(customer);
            } catch (Exception e) {
                e.printStackTrace();
                flag = false;
            }
        }

        return flag;
    }
}