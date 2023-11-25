package com.example.CRM_system.vo.req;

import lombok.Data;

//显示的查询条件
@Data
public class ClueReq extends Pagination{
    private String name;
    private String company;
    private String companyExtension;
    private String clueSource;
    private String owner;
    private String phone;
    private String clueStatus;
}
