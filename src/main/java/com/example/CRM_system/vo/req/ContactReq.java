package com.example.CRM_system.vo.req;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ContactReq extends Pagination{
    String owner;
    String name;
    String company;
    String source;
    String birthday;
}
