package com.example.CRM_system.workbench.web.controller;

import com.example.CRM_system.commons.pojo.Result;
import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.service.TradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.provider.ConfigFile;

import javax.security.auth.login.Configuration;
import javax.servlet.ServletContext;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Properties;
import java.util.ResourceBundle;

@Controller
@RequestMapping("/workbench/trade")
public class TradeController {
    @Autowired
    private TradeService tradeService;

    //条件查询交易列表
    @GetMapping("/getTradeListByCondition.do")
    @ResponseBody
    public Result getTradeListByCondition(TradeReq tradeReq){
        System.out.println("进入条件查询交易列表的操作");

        Integer pageNo = Integer.valueOf(tradeReq.getPageNoStr());
        Integer pageSize = Integer.valueOf(tradeReq.getPageSizeStr());

        int skipCount = (pageNo - 1) * pageSize;
        tradeReq.setPageSize(pageSize);
        tradeReq.setSkipCount(skipCount);

        PaginationVO<Trade> tradeListByCondition = tradeService.getTradeListByCondition(tradeReq);

        return Result.success(tradeListByCondition);
    }

    // 实现读取用户配置文件查询可能性
    @RequestMapping("/queryPossibility.do")
    @ResponseBody
    public Object queryPossibility(String stageName) {
        /*ResourceBundle resourceBundle = ResourceBundle.getBundle("poss");
        String res = resourceBundle.getString(stageName);
        return res;*/

        Properties properties = new Properties();
        /*String projectPath = System.getProperty("user.dir");
        projectPath += "\\src\\main\\resources\\poss.properties";
        System.out.println(projectPath);*/

        //获取资源路径
        ClassLoader classLoader = TradeController.class.getClassLoader();
        URL resourceUrl = classLoader.getResource("poss.properties");
        if (resourceUrl != null) {
            String configFilePath = resourceUrl.getFile();

            try (InputStreamReader reader = new InputStreamReader(new FileInputStream(configFilePath), StandardCharsets.UTF_8)) {
                properties.load(reader);

                String chineseValue = properties.getProperty(stageName);
                return chineseValue;
            } catch (IOException e) {
                e.printStackTrace();
                return null;
            }
        } else {
            System.out.println("找不到配置文件");
            return null;
        }
    }


}
