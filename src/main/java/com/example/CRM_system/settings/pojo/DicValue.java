package com.example.CRM_system.settings.pojo;

//字典值
public class DicValue {
    private String id;  //标识
    private String value;   //字典值
    private String text;    //文本内容
    private String orderNo; //序号
    private String typeCode;    //编码类型


    public DicValue() {
    }

    public DicValue(String id, String value, String text, String orderNo, String typeCode) {
        this.id = id;
        this.value = value;
        this.text = text;
        this.orderNo = orderNo;
        this.typeCode = typeCode;
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
     * @return value
     */
    public String getValue() {
        return value;
    }

    /**
     * 设置
     * @param value
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * 获取
     * @return text
     */
    public String getText() {
        return text;
    }

    /**
     * 设置
     * @param text
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * 获取
     * @return orderNo
     */
    public String getOrderNo() {
        return orderNo;
    }

    /**
     * 设置
     * @param orderNo
     */
    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * 获取
     * @return typeCode
     */
    public String getTypeCode() {
        return typeCode;
    }

    /**
     * 设置
     * @param typeCode
     */
    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String toString() {
        return "DicValue{id = " + id + ", value = " + value + ", text = " + text + ", orderNo = " + orderNo + ", typeCode = " + typeCode + "}";
    }
}
