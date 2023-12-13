package com.example.CRM_system.workbench.service;

import com.example.CRM_system.vo.PaginationVO;
import com.example.CRM_system.vo.req.ClueReq;
import com.example.CRM_system.workbench.pojo.Clue;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface ClueService {
    //条件插叙线索列表
    PaginationVO<Clue> getClueListByCondition(ClueReq clueReq);

    //通过id查询线索列表
    Clue getClueById(String id);

    //添加线索
    boolean addClue(Clue clue);

    //修改线索
    boolean updateClue(Clue clue);

    //批量删除线索
    boolean deleteClue(String[] ids);

    Clue getClueById02(String id);

    //进行线索转换操作
    boolean clueChange(Map<String, String> clueMap);
}
