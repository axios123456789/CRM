<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/20
  Time: 20:10
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
    <title>系统设置</title>
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
    <div style="width: 900px; height: 600px; margin-left: 300px; margin-top: 80px">
        <h3>系统设置</h3>
        <div style="width: 300px; height: 300px; float: left">
            <ul>
                常规
                <li style="list-style-type: none; margin-top: 10px"><a
                        href="companyLogin/setting/systemSet/personSet/personInformation.jsp"
                        style="text-decoration: none">个人设置</a></li>
            </ul>
        </div>
        <div style="width: 300px; height: 300px;  float: left">
            <ul>
                定制
                <li style="list-style-type: none; margin-top: 10px"><a href="" style="text-decoration: none">模块</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">模板</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">定制内容复刻</a></li>
            </ul>
        </div>
        <div style="width: 300px; height: 300px;  float: left">
            <ul>
                扩展及API
                <li style="list-style-type: none; margin-top: 10px"><a href="" style="text-decoration: none">API</a>
                </li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">其他的</a></li>
            </ul>
        </div>
        <div style="width: 300px; height: 300px;  float: left">
            <ul>
                安全控制
                <li style="list-style-type: none; margin-top: 10px"><a href="" style="text-decoration: none">部门管理</a>
                </li>
                <li style="list-style-type: none"><a class="myHref" href="javascript:void(0)" onclick="power()" style="text-decoration: none">权限管理</a></li>
            </ul>
        </div>
        <div style="width: 300px; height: 300px;  float: left">
            <ul>
                自动化
                <li style="list-style-type: none; margin-top: 10px"><a href="" style="text-decoration: none">工作流自动化</a>
                </li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">计划</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">Web表单</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">分配规则</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">服务支持升级规则</a></li>
            </ul>
        </div>
        <div style="width: 300px; height: 300px;  float: left">
            <ul>
                数据管理
                <li style="list-style-type: none; margin-top: 10px"><a
                        href="companyLogin/setting/systemSet/dataDic/dataType.jsp"
                        style="text-decoration: none">数据字典表</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">导入</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">导出</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">存储</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">回收站</a></li>
                <li style="list-style-type: none"><a href="" style="text-decoration: none">审计日志</a></li>
            </ul>
        </div>
    </div>
</nav>
<footer>

</footer>
</body>
<script>
    //进入权限管理操作
    function power(){
        if ("${user.lockState}" == "2"){
            //跳转
            window.location.href = "companyLogin/setting/systemSet/power/powerManage.jsp";
        }else {
            alert("非管理员，不能进行该操作！");
        }
    }
</script>
</html>
