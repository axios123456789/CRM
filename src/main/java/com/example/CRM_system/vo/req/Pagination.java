package com.example.CRM_system.vo.req;

import lombok.Data;

@Data
public class Pagination {
    private String pageNoStr;
    private String pageSizeStr;
    private int skipCount;  //略过的记录数
    private int pageSize; //每页显示条数
}
