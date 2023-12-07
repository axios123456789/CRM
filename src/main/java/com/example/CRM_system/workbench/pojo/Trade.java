package com.example.CRM_system.workbench.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Trade {
    private String id;
    private String owner;
    private String amount;
    private String name;
    private String expectedTradeDate;
    private String stage;
    private String type;
    private String source;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String description;
    private String contactMinute;
    private String nextContactTime;
    private String customerId;
    private String activityId;
    private String contactId;

}
