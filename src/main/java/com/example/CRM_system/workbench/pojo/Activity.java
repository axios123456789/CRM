package com.example.CRM_system.workbench.pojo;

//市场活动类
public class Activity {
    private String id;  //主键
    private String owner;   //所有者 外键 关联c_user表
    private String name;    //市场活动名称
    private String startDate;   //开始日期 年月日
    private String endDate;     //结束日期 年月日
    private String cost;    //成本
    private String description; //描述
    private String createTime;  //创建时间
    private String createBy;    //创建人
    private String editTime;    //修改时间
    private String editBy;  //修改人


    public Activity() {
    }

    public Activity(String id, String owner, String name, String startDate, String endDate, String cost, String description, String createTime, String createBy, String editTime, String editBy) {
        this.id = id;
        this.owner = owner;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cost = cost;
        this.description = description;
        this.createTime = createTime;
        this.createBy = createBy;
        this.editTime = editTime;
        this.editBy = editBy;
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
     * @return owner
     */
    public String getOwner() {
        return owner;
    }

    /**
     * 设置
     * @param owner
     */
    public void setOwner(String owner) {
        this.owner = owner;
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

    /**
     * 获取
     * @return startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * 设置
     * @param startDate
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * 获取
     * @return endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * 设置
     * @param endDate
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * 获取
     * @return cost
     */
    public String getCost() {
        return cost;
    }

    /**
     * 设置
     * @param cost
     */
    public void setCost(String cost) {
        this.cost = cost;
    }

    /**
     * 获取
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
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

    public String toString() {
        return "Activity{id = " + id + ", owner = " + owner + ", name = " + name + ", startDate = " + startDate + ", endDate = " + endDate + ", cost = " + cost + ", description = " + description + ", createTime = " + createTime + ", createBy = " + createBy + ", editTime = " + editTime + ", editBy = " + editBy + "}";
    }
}
