package com.example.CRM_system.workbench.pojo;

public class Customer {
    private String id;
    private String owner;
    private String name;
    private String companyWebsite;
    private String companyExtension;
    private String createBy;
    private String createTime ;
    private String editBy;
    private String editTime;
    private String contactMinute;
    private String nextContactTime;
    private String description;
    private String detailAddress;


    public Customer() {
    }

    public Customer(String id, String owner, String name, String companyWebsite, String companyExtension, String createBy, String createTime, String editBy, String editTime, String contactMinute, String nextContactTime, String description, String detailAddress) {
        this.id = id;
        this.owner = owner;
        this.name = name;
        this.companyWebsite = companyWebsite;
        this.companyExtension = companyExtension;
        this.createBy = createBy;
        this.createTime = createTime;
        this.editBy = editBy;
        this.editTime = editTime;
        this.contactMinute = contactMinute;
        this.nextContactTime = nextContactTime;
        this.description = description;
        this.detailAddress = detailAddress;
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
     * @return companyWebsite
     */
    public String getCompanyWebsite() {
        return companyWebsite;
    }

    /**
     * 设置
     * @param companyWebsite
     */
    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    /**
     * 获取
     * @return companyExtension
     */
    public String getCompanyExtension() {
        return companyExtension;
    }

    /**
     * 设置
     * @param companyExtension
     */
    public void setCompanyExtension(String companyExtension) {
        this.companyExtension = companyExtension;
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
     * @return contactMinute
     */
    public String getContactMinute() {
        return contactMinute;
    }

    /**
     * 设置
     * @param contactMinute
     */
    public void setContactMinute(String contactMinute) {
        this.contactMinute = contactMinute;
    }

    /**
     * 获取
     * @return nextContactTime
     */
    public String getNextContactTime() {
        return nextContactTime;
    }

    /**
     * 设置
     * @param nextContactTime
     */
    public void setNextContactTime(String nextContactTime) {
        this.nextContactTime = nextContactTime;
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
     * @return detailAddress
     */
    public String getDetailAddress() {
        return detailAddress;
    }

    /**
     * 设置
     * @param detailAddress
     */
    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String toString() {
        return "Customer{id = " + id + ", owner = " + owner + ", name = " + name + ", companyWebsite = " + companyWebsite + ", companyExtension = " + companyExtension + ", createBy = " + createBy + ", createTime = " + createTime + ", editBy = " + editBy + ", editTime = " + editTime + ", contactMinute = " + contactMinute + ", nextContactTime = " + nextContactTime + ", description = " + description + ", detailAddress = " + detailAddress + "}";
    }
}
