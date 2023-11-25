package com.example.CRM_system.vo;

import java.util.List;

public class PaginationVO<T> {
    private int total;
    private List<T> dataList;


    public PaginationVO() {
    }

    public PaginationVO(int total, List<T> dataList) {
        this.total = total;
        this.dataList = dataList;
    }

    /**
     * 获取
     * @return total
     */
    public int getTotal() {
        return total;
    }

    /**
     * 设置
     * @param total
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * 获取
     * @return dataList
     */
    public List<T> getDataList() {
        return dataList;
    }

    /**
     * 设置
     * @param dataList
     */
    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public String toString() {
        return "PaginationVO{total = " + total + ", dataList = " + dataList + "}";
    }
}
