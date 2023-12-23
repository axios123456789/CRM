<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/20
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>修改密码</title>
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
        <div style="width: 500px; height: 100px; margin-left: 200px; float: left;"><h2>修改密码</h2></div>
        <div style="width: 900px; height: 500px; float: left;">
            <label style="width: 600px; float: left">
                <span style="width: 100px; line-height: 35px; float: left">输入新密码：</span>
                <input type="password" class="form-control" id="newPassword" style="width: 500px;float: left">
            </label>
            <label style="width: 600px; margin-top: 30px; float: left">
                <span style="width: 100px; line-height: 35px; float: left">确认新密码：</span>
                <input type="password" class="form-control" id="enterPassword" style="width: 500px;float: left">
            </label>
            <div style="width: 900px; float: left; margin-top: 50px">
                <input type="submit" id="update" value="修改" style="width: 100px; margin-left: 210px">
            </div>
        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    $("#update").click(function (){
        $.ajax({
            url: "settings/user/editPwd.do",
            data: {
                id: "${user.id}",
                newPassword: $.trim($("#newPassword").val()),
                enterPassword: $.trim($("#enterPassword").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    if (confirm("修改"+data.message+",点击确认返回登录界面！")){
                        window.location.reload();
                    }
                }else {
                    alert(data.message);
                }
            }
        })
    })
</script>
</html>
