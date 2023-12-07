package com.example.CRM_system.vo.req;

import lombok.Data;

@Data
public class TradeReq extends Pagination{
    private String name;
    private String owner;
    private String customerName;
    private String stage;
    private String type;
    private String source;
    private String contactName;
}
