package com.example.CRM_system.workbench.pojo;

//市场活动备注
public class ActivityRemark {
    private String id;  //主键
    private String noteContent; //备注信息
    private String createTime ; //创建时间
    private String createBy;    //创建人
    private String editTime;    //修改时间
    private String editBy;  //修改人
    private String editFlag;    //是否修改过的标记
    private String activityId;  //外键 关联c_activity表


    public ActivityRemark() {
    }

    public ActivityRemark(String id, String noteContent, String createTime, String createBy, String editTime, String editBy, String editFlag, String activityId) {
        this.id = id;
        this.noteContent = noteContent;
        this.createTime = createTime;
        this.createBy = createBy;
        this.editTime = editTime;
        this.editBy = editBy;
        this.editFlag = editFlag;
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
     * @return noteContent
     */
    public String getNoteContent() {
        return noteContent;
    }

    /**
     * 设置
     * @param noteContent
     */
    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent;
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
     * @return editTime
     */
    public String getEditTime() {
        return editTime;
    }

    /**
     * 设置
     * @param editTime
     */
    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }

    /**
     * 获取
     * @return editBy
     */
    public String getEditBy() {
        return editBy;
    }

    /**
     * 设置
     * @param editBy
     */
    public void setEditBy(String editBy) {
        this.editBy = editBy;
    }

    /**
     * 获取
     * @return editFlag
     */
    public String getEditFlag() {
        return editFlag;
    }

    /**
     * 设置
     * @param editFlag
     */
    public void setEditFlag(String editFlag) {
        this.editFlag = editFlag;
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
        return "ActivityRemark{id = " + id + ", noteContent = " + noteContent + ", createTime = " + createTime + ", createBy = " + createBy + ", editTime = " + editTime + ", editBy = " + editBy + ", editFlag = " + editFlag + ", activityId = " + activityId + "}";
    }
}
