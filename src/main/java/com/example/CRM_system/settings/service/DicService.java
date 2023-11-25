package com.example.CRM_system.settings.service;

import com.example.CRM_system.settings.pojo.DicType;
import com.example.CRM_system.settings.pojo.DicValue;

import java.util.List;
import java.util.Map;

public interface DicService {
    Map<String, List<DicValue>> getAll();

    List<DicType> getTypeList();

    boolean save(DicType dicType);

    DicType getTypeByCode(String code);

    boolean deleteTypeByIds(String[] codes);

    List<DicValue> getValueByCondition(String code);

    DicValue getValueById(String id);

    boolean saveValue(DicValue dicValue);

    boolean deleteValueByIds(String[] ids);
}
