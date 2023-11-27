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
}
