package com.example.CRM_system.commons.utils;

import org.springframework.transaction.support.DefaultTransactionDefinition;

//创建了一个新的事务，设置事务传播行为为 PROPAGATION_REQUIRES_NEW，以便开启一个新的事务
public class TransactionStatus {
    private static DefaultTransactionDefinition def;

    private TransactionStatus(){}

    public static DefaultTransactionDefinition getTransactionStatus(){
        if (def == null){
            def = new DefaultTransactionDefinition();
            def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRES_NEW);
        }
        return def;
    }
}
