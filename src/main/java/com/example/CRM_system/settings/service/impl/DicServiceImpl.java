package com.example.CRM_system.settings.service.impl;

import com.example.CRM_system.commons.utils.SqlSessionUtil;
import com.example.CRM_system.settings.dao.DicTypeDao;
import com.example.CRM_system.settings.dao.DicValueDao;
import com.example.CRM_system.settings.pojo.DicType;
import com.example.CRM_system.settings.pojo.DicValue;
import com.example.CRM_system.settings.service.DicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("dicService")
public class DicServiceImpl implements DicService {
    @Autowired
    private DicTypeDao dicTypeDao;
    @Autowired
    private DicValueDao dicValueDao;

    @Override
    public Map<String, List<DicValue>> getAll() {
        Map<String, List<DicValue>> map = new HashMap<>();

        //将字典类型列表取出
        List<DicType> dtList = dicTypeDao.getTypeList();

        //遍历dtList
        for (DicType dicType : dtList){
            //取得每一个类型编码
            String code = dicType.getCode();

            //根据类型编码查询字典值
            List<DicValue> dicValues = dicValueDao.getListByCode(code);

            map.put(code+"List", dicValues);
        }

        return map;
    }

    @Override
    public List<DicType> getTypeList() {
        List<DicType> dicTypes = dicTypeDao.getTypeList();

        return dicTypes;
    }

    @Override
    public boolean save(DicType dicType) {
        boolean flag = true;

        //根据code查询 该code的列是否存在
        int countType = dicTypeDao.getTypeCountByCode(dicType.getCode());

        if (countType != 1){//执行添加操作
            int countAddType = dicTypeDao.addType(dicType);
            if (countAddType != 1){
                flag = false;
            }
        }else {//执行修改操作
            int countUpDataType = dicTypeDao.UpDataType(dicType);
            if (countUpDataType != 1){
                flag = false;
            }
        }

        return flag;
    }

    @Override
    public DicType getTypeByCode(String code) {
        DicType dicType = dicTypeDao.getTypeByCode(code);

        return dicType;
    }

    @Override
    public boolean deleteTypeByIds(String[] codes) {
        boolean flag = true;

        //删除id组
        int countDel = dicTypeDao.deleteTypeByIds(codes);
        if (countDel != codes.length){
            flag = false;
        }

        return flag;
    }

    @Override
    public List<DicValue> getValueByCondition(String code) {
        List<DicValue> dicValues = dicValueDao.getValueByCondition(code);

        return dicValues;
    }

    @Override
    public DicValue getValueById(String id) {
        DicValue dicValue = dicValueDao.getValueById(id);

        return dicValue;
    }

    @Override
    public boolean saveValue(DicValue dicValue) {
        boolean flag = true;

        DicValue valueById = dicValueDao.getValueById(dicValue.getId());
        if (valueById == null){//执行添加操作
            int addValue = dicValueDao.addValue(dicValue);
            if (addValue != 1){
                flag = false;
            }
        }else {//执行修改操作
            int upData = dicValueDao.upDataValue(dicValue);
            if (upData != 1){
                flag = false;
            }
        }

        return flag;
    }

    @Override
    public boolean deleteValueByIds(String[] ids) {
        boolean flag = true;

        int delValueCount = dicValueDao.deleteValueByIds(ids);
        if (delValueCount != ids.length){
            flag = false;
        }

        return flag;
    }
}
