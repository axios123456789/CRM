package com.example.CRM_system.workbench.pojo;

import lombok.Data;

public class TradeHistory {
    private String id;
    private String stage;
    private String amount;
    private String expectedTradeDate;
    private String createTime;
    private String createBy;
    private String tradeId;


    public TradeHistory() {
    }

    public TradeHistory(String id, String stage, String amount, String expectedTradeDate, String createTime, String createBy, String tradeId) {
        this.id = id;
        this.stage = stage;
        this.amount = amount;
        this.expectedTradeDate = expectedTradeDate;
        this.createTime = createTime;
        this.createBy = createBy;
        this.tradeId = tradeId;
    }

    /**
     * 获取
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 获取
     * @return stage
     */
    public String getStage() {
        return stage;
    }

    /**
     * 设置
     * @param stage
     */
    public void setStage(String stage) {
        this.stage = stage;
    }

    /**
     * 获取
     * @return amount
     */
    public String getAmount() {
        return amount;
    }

    /**
     * 设置
     * @param amount
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * 获取
     * @return expectedTradeDate
     */
    public String getExpectedTradeDate() {
        return expectedTradeDate;
    }

    /**
     * 设置
     * @param expectedTradeDate
     */
    public void setExpectedTradeDate(String expectedTradeDate) {
        this.expectedTradeDate = expectedTradeDate;
    }

    /**
     * 获取
     * @return createTime
     */
    public String getCreateTime() {
        return createTime;
    }

    /**
     * 设置
     * @param createTime
     */
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取
     * @return createBy
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置
     * @param createBy
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取
     * @return tradeId
     */
    public String getTradeId() {
        return tradeId;
    }

    /**
     * 设置
     * @param tradeId
     */
    public void setTradeId(String tradeId) {
        this.tradeId = tradeId;
    }

    public String toString() {
        return "TradeHistory{id = " + id + ", stage = " + stage + ", amount = " + amount + ", expectedTradeDate = " + expectedTradeDate + ", createTime = " + createTime + ", createBy = " + createBy + ", tradeId = " + tradeId + "}";
    }
}
