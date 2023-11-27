import com.example.CRM_system.commons.utils.MD5Util;
import com.example.CRM_system.commons.utils.UUIDUtil;
import com.example.CRM_system.vo.req.ClueReq;
import org.apache.poi.ss.formula.functions.Replace;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Test {
    @org.junit.Test
    public void test(){
       /* String a = "你他妈有病";
        String b = a.replace("他妈有病", "****");
        System.out.println(b);*/

        //测试生成id和加密后的密码
        /*String uuid = UUIDUtil.getUUID();
        System.out.println("id值"+uuid);

        String ps = "8888888";
        String md5 = MD5Util.getMD5(ps);
        System.out.println("密码"+md5);*/

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

        System.out.println(Integer.valueOf("29"));
    }
}
