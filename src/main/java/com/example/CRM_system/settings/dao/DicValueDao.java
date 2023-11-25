package com.example.CRM_system.settings.dao;

import com.example.CRM_system.settings.pojo.DicValue;

import java.util.List;

public interface DicValueDao {

    List<DicValue> getListByCode(String code);

    List<DicValue> getValueByCondition(String code);

    DicValue getValueById(String id);

    int addValue(DicValue dicValue);

    int upDataValue(DicValue dicValue);

    int deleteValueByIds(String[] ids);
}
