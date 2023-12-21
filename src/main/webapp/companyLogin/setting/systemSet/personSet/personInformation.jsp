<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/20
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>个人设置</title>
    <base href="<%=basePath%>">

    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script src="js/jquery-1.9.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="plug-ins/layDate-v5.3.1/laydate/laydate.js"></script>
</head>
<body>
<header>
    <h1>CRM</h1>
    <img src="img/logo.png" style="height: 60px; "/>
    <div style="width: 200px; height: 60px; float: right;">
        <img src="img/person.svg" style="height: 40px; margin-top: 10px; float: left"/>
        <div class="dropdown" style="margin-top: 20px; float: left; width: 150px">
            <button id="dLabel" type="button" data-toggle="dropdown" style="background-color: #CCCCCC; border: 0px">
                ${user.name}
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dLabel">
                <li><a href="companyLogin/menu/workstation.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;工作台</a>
                </li>
                <li><a href="companyLogin/setting/setSystem.jsp"><span class="glyphicon glyphicon-wrench"></span>&nbsp;系统设置</a>
                </li>
                <li><a href="companyLogin/setting/personInformation.jsp"><span class="glyphicon glyphicon-file"></span>&nbsp;我的资料</a>
                </li>
                <li><a href="companyLogin/setting/pwdEdit.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a>
                </li>
                <li><a href="settings/user/outLogin.do"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</header>
<nav>
    <div style="width: 900px; height: 600px; margin-left: 300px; margin-top: 50px;">
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <h2 style="float: left">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp个人信息</h2>
        </div>
        <div style="width: 700px; height: 50px; float:left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.loginAct}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">名字：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.name}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">邮箱：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.email}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号过期时间：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.expireTime}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号状态：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">
                <c:if test="${user.lockState == '0'}">
                    被锁定的账号
                </c:if>
                <c:if test="${user.lockState == '1'}">
                    普通账号
                </c:if>
                <c:if test="${user.lockState == '2'}">
                    管理员账号
                </c:if>
            </small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">部门编号：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.deptno}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号允许的IP：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">${user.allowIps}</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号创建信息：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">在&nbsp${user.createTime}&nbsp由${user.createBy}创建</small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px;">
            <div style="width: 250px; height: 50px; float: left"><h3 style="float: right">账号修改信息：&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</h3></div>
            <small style="float:left; line-height: 70px; font-size: 18px">
                <c:if test="${(user.editTime == null or user.editTime == '') and (user.editBy == null or user.editBy == '')}">
                    暂无修改记录
                </c:if>
                <c:if test="${(user.editTime != null and user.editTime != '') and (user.editBy != null and user.editBy != '')}">
                    在&nbsp${user.editTime}&nbsp由${user.editBy}修改
                </c:if>
            </small>
        </div>
        <div style="width: 700px; height: 50px; float: left; margin-left: 100px; margin-top: 30px">
            <button style="width: 100px;height: 40px; float: left; margin-left: 150px; font-size: 20px; color: #051b11" onclick="edit_person()">修改</button>
        </div>
    </div>

<%--    修改个人信息模态窗口--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="update-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改个人信息</h4>
                </div>
                <div class="modal-body" style="width: 100%; height: 250px">
                    <div style="width: 100%; float: left;">
                        <label style="width: 100px; line-height: 35px; float: left;">账号:</label>
                        <input class="form-control" style="width: 250px; float: left" id="loginAct">
                        <label style="width: 100px; float: left; line-height: 35px; margin-left: 50px">名字:</label>
                        <input class="form-control" style="width: 250px; float:left;" id="name">
                    </div>
                    <div style="width: 100%; float: left; margin-top: 50px">
                        <label style="width: 100px; line-height: 35px; float: left;">邮箱:</label>
                        <input class="form-control" style="width: 250px; float: left" id="email">
                        <label style="width: 100px; float: left; line-height: 35px; margin-left: 50px">部门编号:</label>
                        <input class="form-control" style="width: 250px; float:left;" id="deptno">
                    </div>
                    <div style="width: 100%; float: left; margin-top: 50px; display: none" id="specal-input">
                        <label style="width: 100px; line-height: 30px; float: left;">账号过期时间:</label>
                        <input class="form-control" style="width: 250px; float: left" id="expireTime" readonly>
                        <label style="width: 100px; float: left; line-height: 30px; margin-left: 50px">账号允许的IP:</label>
                        <input class="form-control" style="width: 250px; float:left;" id="allowIps" placeholder="填入允许的IP，用逗号分隔！">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="update_person()">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</nav>
<footer></footer>
</body>
<script>
    laydate.render({
        elem: "#expireTime",
        type: "datetime"
    })

    $(document).ready(function (){
        //判断登录人等级，确定模态窗口中的内容
        if ("${user.lockState}" == "2"){//管理员登录
            $("#specal-input").show();
        }
    })

    //修改个人信息
    function edit_person(){
        //设置模态窗口中的值
        $("#loginAct").val("${user.loginAct}");
        $("#name").val("${user.name}");
        $("#email").val("${user.email}");
        $("#deptno").val("${user.deptno}");
        $("#expireTime").val("${user.expireTime}");
        $("#allowIps").val("${user.allowIps}");
        $("#update-modal").modal("show");
    }

    //点击模态框中的确认按钮后触发
    function update_person(){
        //发送Ajax请求，进行修改个人信息操作
        $.ajax({
            url: "settings/user/updatePersonInformation.do",
            data: {
                id: "${user.id}",
                loginAct: $.trim($("#loginAct").val()),
                name: $.trim($("#name").val()),
                email: $.trim($("#email").val()),
                deptno: $.trim($("#deptno").val()),
                expireTime: $.trim($("#expireTime").val()),
                allowIps: $.trim($("#allowIps").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    $("#update-modal").modal("hide");
                    window.location.reload();
                }else {
                    alert(data.message);
                }
            }
        })
    }
</script>
</html>
