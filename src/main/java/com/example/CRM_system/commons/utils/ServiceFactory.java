package com.example.CRM_system.commons.utils;

/**
 * 动态代理可以提高系统的可维护性，可扩展性和性能
 */
public class ServiceFactory {
    //传递张三对象，得到李四对象的过程

    public static Object getService(Object service){
        return new TransactionInvocationHandler(service).getProxy();
    }
}
