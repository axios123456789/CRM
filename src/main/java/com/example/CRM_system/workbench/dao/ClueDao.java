package com.example.CRM_system.workbench.dao;

import com.example.CRM_system.vo.TradeChartsVo;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.pojo.Clue;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

public interface ClueDao {
    //根据指定条件clueReq对象中的条件查询线索列表的所有符合条件记录
    List<Clue> getClueListByCondition(ClueReq clueReq);

    //根基clueReq中的条件查询线索的记录数
    int getClueTotalByCondition(ClueReq clueReq);

    //根据id查询线索记录
    Clue getClueById(String id);

    //添加一条线索记录
    int addClue(Clue clue);

    //修改线索
    int updateClue(Clue clue);

    //批量删除线索
    int deleteClueByIds(String[] ids);

    Clue getClueById02(String id);

    //根据线索状态进行分组查询
    List<TradeChartsVo> getClueGroupByClueStatus();

    //根据线索来源进行分组查询
    List<TradeChartsVo> getClueGroupBySource();
}
