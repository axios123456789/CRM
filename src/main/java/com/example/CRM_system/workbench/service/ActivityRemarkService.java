package com.example.CRM_system.workbench.service;

import com.example.CRM_system.workbench.pojo.Activity;
import com.example.CRM_system.workbench.pojo.ActivityRemark;

import java.util.List;

public interface ActivityRemarkService {
    List<ActivityRemark> getRemarkByAid(String id);

    boolean saveRemark(ActivityRemark activityRemark);

    boolean deleteRemark(String id);

    ActivityRemark getRemarkById(String id);
}
