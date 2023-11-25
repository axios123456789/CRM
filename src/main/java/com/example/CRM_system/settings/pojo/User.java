package com.example.CRM_system.settings.pojo;

//用户类
public class User {
    private String id ; //编号
    private String loginAct;    //登录账号
    private String name;    //用户名
    private String loginPwd;    //登录密码
    private String email;   //邮箱
    private String expireTime;  //失效时间
    private String lockState;   //锁定状态
    private String deptno;  //部门编号
    private String allowIps;    //允许访问的ip地址
    private String createTime;  //创建时间
    private String createBy;    //创建人
    private String editTime;    //修改时间
    private String editBy;  //修改人


    public User() {
    }

    public User(String id, String loginAct, String name, String loginPwd, String email, String expireTime, String lockState, String deptno, String allowIps, String createTime, String createBy, String editTime, String editBy) {
        this.id = id;
        this.loginAct = loginAct;
        this.name = name;
        this.loginPwd = loginPwd;
        this.email = email;
        this.expireTime = expireTime;
        this.lockState = lockState;
        this.deptno = deptno;
        this.allowIps = allowIps;
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
     * @return loginAct
     */
    public String getLoginAct() {
        return loginAct;
    }

    /**
     * 设置
     * @param loginAct
     */
    public void setLoginAct(String loginAct) {
        this.loginAct = loginAct;
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
     * @return loginPwd
     */
    public String getLoginPwd() {
        return loginPwd;
    }

    /**
     * 设置
     * @param loginPwd
     */
    public void setLoginPwd(String loginPwd) {
        this.loginPwd = loginPwd;
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
     * @return expireTime
     */
    public String getExpireTime() {
        return expireTime;
    }

    /**
     * 设置
     * @param expireTime
     */
    public void setExpireTime(String expireTime) {
        this.expireTime = expireTime;
    }

    /**
     * 获取
     * @return lockState
     */
    public String getLockState() {
        return lockState;
    }

    /**
     * 设置
     * @param lockState
     */
    public void setLockState(String lockState) {
        this.lockState = lockState;
    }

    /**
     * 获取
     * @return deptno
     */
    public String getDeptno() {
        return deptno;
    }

    /**
     * 设置
     * @param deptno
     */
    public void setDeptno(String deptno) {
        this.deptno = deptno;
    }

    /**
     * 获取
     * @return allowIps
     */
    public String getAllowIps() {
        return allowIps;
    }

    /**
     * 设置
     * @param allowIps
     */
    public void setAllowIps(String allowIps) {
        this.allowIps = allowIps;
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
        return "User{id = " + id + ", loginAct = " + loginAct + ", name = " + name + ", loginPwd = " + loginPwd + ", email = " + email + ", expireTime = " + expireTime + ", lockState = " + lockState + ", deptno = " + deptno + ", allowIps = " + allowIps + ", createTime = " + createTime + ", createBy = " + createBy + ", editTime = " + editTime + ", editBy = " + editBy + "}";
    }
}
