package com.example.CRM_system.vo;

public class TradeChartsVo {
    private Integer value;
    private String name;


    public TradeChartsVo() {
    }

    public TradeChartsVo(Integer value, String name) {
        this.value = value;
        this.name = name;
    }

    /**
     * 获取
     * @return value
     */
    public Integer getValue() {
        return value;
    }

    /**
     * 设置
     * @param value
     */
    public void setValue(Integer value) {
        this.value = value;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    public String toString() {
        return "TradeChartsVo{value = " + value + ", name = " + name + "}";
    }
}
