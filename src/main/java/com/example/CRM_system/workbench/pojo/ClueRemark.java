package com.example.CRM_system.workbench.pojo;

public class ClueRemark {
    private String id;
    private String noteContent;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String editFlag;
    private String clueId;


    public ClueRemark() {
    }

    public ClueRemark(String id, String noteContent, String createBy, String createTime, String editBy, String editTime, String editFlag, String clueId) {
        this.id = id;
        this.noteContent = noteContent;
        this.createBy = createBy;
        this.createTime = createTime;
        this.editBy = editBy;
        this.editTime = editTime;
        this.editFlag = editFlag;
        this.clueId = clueId;
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

    public String toString() {
        return "ClueRemark{id = " + id + ", noteContent = " + noteContent + ", createBy = " + createBy + ", createTime = " + createTime + ", editBy = " + editBy + ", editTime = " + editTime + ", editFlag = " + editFlag + ", clueId = " + clueId + "}";
    }
}
