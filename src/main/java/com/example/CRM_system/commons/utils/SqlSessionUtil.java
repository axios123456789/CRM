package com.example.CRM_system.commons.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class SqlSessionUtil {
    private SqlSessionUtil(){}
    private static SqlSessionFactory sqlSessionFactory;

    static {
        String resource = "mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (Exception e) {
            e.printStackTrace();
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    private static ThreadLocal<SqlSession> t = new ThreadLocal<>();

    //取得sqlSession对象
    public static SqlSession getSession(){
        SqlSession session = t.get();
        if (session == null) {
            session = sqlSessionFactory.openSession();

            t.set(session);
        }

        return session;
    }

    //关闭sqlSession对象
    public static void myClose(SqlSession session){
        if (session != null){
            session.close();

            t.remove();
        }
    }
}
