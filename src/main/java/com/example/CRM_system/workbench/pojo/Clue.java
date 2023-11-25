package com.example.CRM_system.workbench.pojo;

public class Clue {
    private String id;
    private String name;
    private String salutation;  //称呼
    private String owner;
    private String company;
    private String position;
    private String email;
    private String companyExtension;
    private String companyWebsite;
    private String phone;
    private String clueStatus;
    private String clueSource;
    private String createBy;
    private String createTime;
    private String editBy;
    private String editTime;
    private String description;
    private String contactMinute;
    private String nextContactTime;
    private String detailAddress;


    public Clue() {
    }

    public Clue(String id, String name, String salutation, String owner, String company, String position, String email, String companyExtension, String companyWebsite, String phone, String clueStatus, String clueSource, String createBy, String createTime, String editBy, String editTime, String description, String contactMinute, String nextContactTime, String detailAddress) {
        this.id = id;
        this.name = name;
        this.salutation = salutation;
        this.owner = owner;
        this.company = company;
        this.position = position;
        this.email = email;
        this.companyExtension = companyExtension;
        this.companyWebsite = companyWebsite;
        this.phone = phone;
        this.clueStatus = clueStatus;
        this.clueSource = clueSource;
        this.createBy = createBy;
        this.createTime = createTime;
        this.editBy = editBy;
        this.editTime = editTime;
        this.description = description;
        this.contactMinute = contactMinute;
        this.nextContactTime = nextContactTime;
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
     * @return salutation
     */
    public String getSalutation() {
        return salutation;
    }

    /**
     * 设置
     * @param salutation
     */
    public void setSalutation(String salutation) {
        this.salutation = salutation;
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
     * @return company
     */
    public String getCompany() {
        return company;
    }

    /**
     * 设置
     * @param company
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * 获取
     * @return position
     */
    public String getPosition() {
        return position;
    }

    /**
     * 设置
     * @param position
     */
    public void setPosition(String position) {
        this.position = position;
    }

    /**
     * 获取
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
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
     * @return phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * 设置
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * 获取
     * @return clueStatus
     */
    public String getClueStatus() {
        return clueStatus;
    }

    /**
     * 设置
     * @param clueStatus
     */
    public void setClueStatus(String clueStatus) {
        this.clueStatus = clueStatus;
    }

    /**
     * 获取
     * @return clueSource
     */
    public String getClueSource() {
        return clueSource;
    }

    /**
     * 设置
     * @param clueSource
     */
    public void setClueSource(String clueSource) {
        this.clueSource = clueSource;
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
        return "Clue{id = " + id + ", name = " + name + ", salutation = " + salutation + ", owner = " + owner + ", company = " + company + ", position = " + position + ", email = " + email + ", companyExtension = " + companyExtension + ", companyWebsite = " + companyWebsite + ", phone = " + phone + ", clueStatus = " + clueStatus + ", clueSource = " + clueSource + ", createBy = " + createBy + ", createTime = " + createTime + ", editBy = " + editBy + ", editTime = " + editTime + ", description = " + description + ", contactMinute = " + contactMinute + ", nextContactTime = " + nextContactTime + ", detailAddress = " + detailAddress + "}";
    }
}
