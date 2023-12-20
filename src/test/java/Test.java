import com.example.CRM_system.commons.utils.DateTimeUtil;
import com.example.CRM_system.commons.utils.MD5Util;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.vo.req.TradeReq;
import com.example.CRM_system.workbench.dao.ClueDao;
import com.example.CRM_system.workbench.dao.TradeDao;
import com.example.CRM_system.workbench.dao.TradeHistoryDao;
import com.example.CRM_system.workbench.pojo.Trade;
import com.example.CRM_system.workbench.pojo.TradeHistory;
import com.example.CRM_system.workbench.service.ClueService;
import com.example.CRM_system.workbench.service.TradeHistoryService;
import jdk.jfr.internal.tool.Main;
import org.apache.poi.ss.formula.functions.Replace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.ServletContext;
import javax.xml.soap.Detail;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.Collectors;

public class Test {
    @Autowired
    private ClueService clueService;

    @Autowired
    private TradeHistoryDao historyDao;

    @Autowired
    private TradeDao tradeDao;
    @org.junit.Test
    public void test(){
       /* String a = "你他妈有病";
        String b = a.replace("他妈有病", "****");
        System.out.println(b);*/

        //测试生成id和加密后的密码
        String uuid = UUIDUtil.getUUID();
        System.out.println("id值"+uuid);

        String ps = "1234567";
        String md5 = MD5Util.getMD5(ps);
        System.out.println("密码"+md5);

        //测试将数据处理成List<Map>类型
        /*String clueId = "1";
        String[] activityId = {"1","2","34","5","67","4"};

        List<Map> clueActivityRelation = new ArrayList<>();

        for (int i = 0; i < activityId.length; i++) {
            Map<String, String> map = new HashMap<>();
            map.put("id", UUIDUtil.getUUID());
            map.put("clueId", clueId);
            map.put("activityId", activityId[i]);
            clueActivityRelation.add(map);
        }

        for (int i = 0; i < clueActivityRelation.size(); i++) {
            Object id = clueActivityRelation.get(i).get("id");
            Object clueId1 = clueActivityRelation.get(i).get("clueId");
            Object activityId1 = clueActivityRelation.get(i).get("activityId");
            System.out.println("["+id+","+clueId1+","+activityId1+"]");
        }*/

       /* //使用stream()
        List<String> questionId = new ArrayList<>();
        questionId.add("1");
        questionId.add("2");
        questionId.add("3");
        //System.out.println(questionId);

        String paper = "5";

        List<Map> collect = questionId.stream().map(qid -> {
            Map mp = new HashMap();
            mp.put("paperId", paper);
            mp.put("questionId", qid);
            mp.put("id",UUIDUtil.getUUID());
            return mp;
        }).collect(Collectors.toList());

        System.out.println(collect);*/

        /*ResourceBundle resourceBundle = ResourceBundle.getBundle("poss");
        String res = resourceBundle.getString("需求分析");
        System.out.println(res);*/

        /*Properties properties = new Properties();
        String projectPath = System.getProperty("user.dir");
        projectPath += "\\src\\main\\resources\\poss.properties";
        try (InputStreamReader reader = new InputStreamReader(new FileInputStream("/D:/learnJava/CRM_system/target/classes/poss.properties"), StandardCharsets.UTF_8)) {
            properties.load(reader);

            String chineseKey = "需求分析";
            String chineseValue = properties.getProperty(chineseKey);
            System.out.println(chineseKey + " 对应的值为：" + chineseValue);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //获取资源路径
        ClassLoader classLoader = Test.class.getClassLoader();
        URL resourceUrl = classLoader.getResource("poss.properties");
        if (resourceUrl != null) {
            String configFilePath = resourceUrl.getFile();
            System.out.println("配置文件路径：" + configFilePath);
        } else {
            System.out.println("找不到配置文件");
        }*/

        /*try {
            historyDao.addTradeHistory(new TradeHistory(UUIDUtil.getUUID(),"","","", DateTimeUtil.getSysTime(),"",""));
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        /*List<Trade> tradeListByCondition = tradeDao.getTradeListByCondition(new TradeReq());
        System.out.println(tradeListByCondition);*/
    }
}
