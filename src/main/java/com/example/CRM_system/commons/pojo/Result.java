package com.example.CRM_system.commons.pojo;


import lombok.Data;

// 返回给前端的数据类
@Data
public class Result<T> {

    private String code; // 状态码
    private String message; //提示信息
    private T data; // 返回的数据

    // 成功
    public static Result success(){
        Result result = new Result();
        result.setCode("200");
        result.setMessage("成功");
        return result;
    }

    // 成功 并返回数据
    public static <T> Result success(T data){
        Result<T> result = new Result<>();
        result.setCode("200");
        result.setMessage("成功");
        result.setData(data);
        return result;
    }

    // 错误
    public static Result error(String code, String msg){
        Result result = new Result();
        result.setCode(code);
        result.setMessage(msg);
        return result;
    }


}
