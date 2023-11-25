package com.example.CRM_system.settings.dao;

import com.example.CRM_system.settings.pojo.DicType;

import java.util.List;

public interface DicTypeDao {

    List<DicType> getTypeList();

    int getTypeCountByCode(String code);

    int addType(DicType dicType);

    DicType getTypeByCode(String code);

    int UpDataType(DicType dicType);

    int deleteTypeByIds(String[] codes);
}
