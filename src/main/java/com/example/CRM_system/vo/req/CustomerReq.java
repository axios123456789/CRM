package com.example.CRM_system.vo.req;

public class CustomerReq extends Pagination{
    private String name;
    private String owner;
    private String companyExtension;
    private String companyWebsite;


    public CustomerReq() {
    }

    public CustomerReq(String name, String owner, String companyExtension, String companyWebsite) {
        this.name = name;
        this.owner = owner;
        this.companyExtension = companyExtension;
        this.companyWebsite = companyWebsite;
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

    public String toString() {
        return "CustomerReq{name = " + name + ", owner = " + owner + ", companyExtension = " + companyExtension + ", companyWebsite = " + companyWebsite + "}";
    }
}
