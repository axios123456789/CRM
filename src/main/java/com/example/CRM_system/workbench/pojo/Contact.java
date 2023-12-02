package com.example.CRM_system.workbench.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Contact {
    private String id;
    private String owner;
    private String source;
    private String name;
    private String salutation;
    private String email;
    private String phone;
    private String position;
    private String birthday;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String description;
    private String contactMinute;
    private String nextContactTime;
    private String detailAddress;
    private String customerId;
    Customer customer;
}
