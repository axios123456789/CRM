package com.example.CRM_system.workbench.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CustomerRemark {
    private String id;
    private String noteContent;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String editFlag;
    private String customerId;
}
