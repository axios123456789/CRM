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
    <title>我的资料</title>
    <base href="<%=basePath%>">

    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script src="js/jquery-1.9.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<header>
    <h1>CRM</h1>
    <img src="img/logo.png" style="height: 60px; "/>
    <div style="width: 100px; height: 60px; margin-right: 50px; float: right;">
        <img src="img/person.svg" style="height: 40px; margin-top: 10px; float: left"/>
        <div class="dropdown" style="margin-top: 20px; float: left;">
            <button id="dLabel" type="button" data-toggle="dropdown" style="background-color: #CCCCCC; border: 0px;">
                ${user.name}
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dLabel">
                <li><a href="companyLogin/menu/workstation.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;工作台</a></li>
                <li><a href="companyLogin/setting/setSystem.jsp"><span class="glyphicon glyphicon-wrench"></span>&nbsp;系统设置</a></li>
                <li><a href="companyLogin/setting/personInformation.jsp"><span class="glyphicon glyphicon-file"></span>&nbsp;我的资料</a></li>
                <li><a href="companyLogin/setting/pwdEdit.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a></li>
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
    </div>
</nav>
<footer></footer>
</body>
</html>
