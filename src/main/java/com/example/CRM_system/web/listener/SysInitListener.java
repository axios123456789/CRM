package com.example.CRM_system.web.listener;

import com.example.CRM_system.commons.utils.ServiceFactory;
import com.example.CRM_system.settings.pojo.DicType;
import com.example.CRM_system.settings.pojo.DicValue;
import com.example.CRM_system.settings.service.DicService;
import com.example.CRM_system.settings.service.impl.DicServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SysInitListener implements ServletContextListener {
    @Autowired
    private DicService dicService;

    /**
     * 该方法是用来监听上下文域对象的方法，当服务器启动，上下文域对象创建
     * 对象创建完毕后， 马上执行该方法
     * @param servletContextEvent 该参数能够取得监听的对象
     *                            监听的是什么对象， 就可以通过该参数取得什么对象
     *                            例如我们现在监听的是上下文域对象， 通过该参数就可以取得上下文域对象
     */
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //System.out.println("上下文域对象创建了");

        try {
            System.out.println("服务器缓存处理数据字典开始");

            ServletContext application = servletContextEvent.getServletContext();

            Map<String, List<DicValue>> map = dicService.getAll();

            //将map解析为上下文域对象中保存的键值对
            Set<String> set = map.keySet();
            for (String key : set) {
                application.setAttribute(key, map.get(key));
                System.out.println(application.getAttribute(key));
            }

            System.out.println("服务器缓存处理数据字典结束");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
