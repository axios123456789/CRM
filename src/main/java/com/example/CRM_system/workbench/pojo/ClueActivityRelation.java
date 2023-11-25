package com.example.CRM_system.workbench.pojo;

public class ClueActivityRelation {
    private String id;
    private String clueId;
    private String activityId;


    public ClueActivityRelation() {
    }

    public ClueActivityRelation(String id, String clueId, String activityId) {
        this.id = id;
        this.clueId = clueId;
        this.activityId = activityId;
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
     * @return clueId
     */
    public String getClueId() {
        return clueId;
    }

    /**
     * 设置
     * @param clueId
     */
    public void setClueId(String clueId) {
        this.clueId = clueId;
    }

    /**
     * 获取
     * @return activityId
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 设置
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public String toString() {
        return "ClueActivityRelation{id = " + id + ", clueId = " + clueId + ", activityId = " + activityId + "}";
    }
}
