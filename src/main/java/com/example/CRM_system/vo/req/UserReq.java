package com.example.CRM_system.vo.req;

import lombok.Data;

@Data
public class UserReq extends Pagination{
    private String id;
    private String name;
    private String deptno;
    private String lockState;
}
