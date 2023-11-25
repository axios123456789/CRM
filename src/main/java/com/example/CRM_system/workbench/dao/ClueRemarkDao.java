package com.example.CRM_system.workbench.dao;


import com.example.CRM_system.workbench.pojo.ClueRemark;

import java.util.List;

public interface ClueRemarkDao {
    //获取线索备注的数量
    int getClueRemarkCountByClueIds(String[] ids);

    //批量删除线索备注
    int deleteClueRemarkByClueIds(String[] ids);

    //根据线索id查询所有线索备注的记录
    List<ClueRemark> getClueRemarkByClueId(String id);

    //根据id查询备注，返回查到的数量
    int getClueRemarkCountById(String id);

    //修改备注信息
    int editClueRemarkById(ClueRemark clueRemark);

    //添加备注信息
    int addClueRemarkById(ClueRemark clueRemark);

    ClueRemark getClueRemarkById(String id);

    //根据id删除对应的线索备注信息记录
    void deleteClueRemarkById(String id);
}
