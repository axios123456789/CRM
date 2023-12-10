package com.example.CRM_system.workbench.pojo;

import lombok.Data;

@Data
public class TradeRemark {
    private String id;
    private String noteContent;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String editFlag;
    private String tradeId;

}
