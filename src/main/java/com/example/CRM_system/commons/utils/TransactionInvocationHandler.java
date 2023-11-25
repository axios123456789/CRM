package com.example.CRM_system.commons.utils;

import org.apache.ibatis.session.SqlSession;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

//动态代理
public class TransactionInvocationHandler implements InvocationHandler {
    //代理对象张三
    private Object target;

    public TransactionInvocationHandler(Object target){
        this.target = target;
    }

    //代理类的业务方法
    //李四的表白方法
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        SqlSession session = null;
        Object obj = null;

        try {
            session = SqlSessionUtil.getSession();

            //处理业务逻辑
            //method.invoke: 张三的表白方法
            obj = method.invoke(target, args);

            //处理业务逻辑完毕后，提交事务
            session.commit();
        } catch (Exception e) {
            //回滚事务
            session.rollback();

            e.printStackTrace();

            //处理的是什么异常，就继续往上抛什么异常
            throw e.getCause();
        } finally {
            SqlSessionUtil.myClose(session);
        }

        return obj;
    }

    //获得代理对象 李四
    public Object getProxy(){
        return Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(), this);
    }
}
