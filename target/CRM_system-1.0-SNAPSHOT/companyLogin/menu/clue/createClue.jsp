<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>创建线索</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="plug-ins/layDate-v5.3.1/laydate/laydate.js"></script>
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
                <li><a href="login.jsp"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</header>
<nav>
    <div id="menu">
        <ul>
            <li>
                <img src="img/house-fill.svg"/>
                <a href="companyLogin/menu/workstation.jsp">工作台</a>
            </li>
            <li>
                <img src="./img/tag-fill.svg"/>
                <a href="companyLogin/menu/dynamic.jsp">动态</a>
            </li>
            <li>
                <img src="img/check-circle.svg"/>
                <a href="companyLogin/menu/approval.jsp">审批</a>
            </li>
            <li>
                <img src="img/person-fill.svg"/>
                <a href="companyLogin/menu/customerOpenSea.jsp">客户公海</a>
            </li>
            <li>
                <img src="img/record-circle.svg"/>
                <a href="companyLogin/menu/marketActivity.jsp">市场活动</a>
            </li>
            <li>
                <img src="img/search.svg"/>
                <a href="companyLogin/menu/clue.jsp">线索(潜在客户)</a>
            </li>
            <li>
                <img src="img/person-fill.svg"/>
                <a href="companyLogin/menu/customer.jsp">客户</a>
            </li>
            <li>
                <img src="img/telephone.svg"/>
                <a href="companyLogin/menu/relative.jsp">联系人</a>
            </li>
            <li>
                <img src="img/currency-dollar.svg"/>
                <a href="companyLogin/menu/trade.jsp">交易(商机)</a>
            </li>
            <li>
                <img src="img/telephone-inbound-fill.svg"/>
                <a href="companyLogin/menu/salesAfterVisit.jsp">售后回访</a>
            </li>
            <!-- <li>
                <a href="">统计图表</a>
            </li> -->
            <div id="statistics">
                <span>
                    <img src="img/bar-chart-fill.svg"/>
                    统计图表
                </span>
                <div>
                    <img src="img/chevron-right.svg"/>
                    <a href="companyLogin/menu/statistical_charts/activityChart.jsp">市场活动统计图表</a>
                </div>
                <div>
                    <img src="img/chevron-right.svg"/>
                    <a href="companyLogin/menu/statistical_charts/clueChart.jsp">线索统计图表</a>
                </div>
                <div>
                    <img src="img/chevron-right.svg"/>
                    <a href="companyLogin/menu/statistical_charts/customerAndRelativeChart.jsp">客户和联系人图表</a>
                </div>
                <div>
                    <img src="img/chevron-right.svg"/>
                    <a href="companyLogin/menu/statistical_charts/tradeChart.jsp">交易活动统计图表</a>
                </div>
            </div>
            <li>
                <img src="img/file-earmark-fill.svg"/>
                <a href="companyLogin/menu/report.jsp">报表</a>
            </li>
            <li>
                <img src="img/cart-fill.svg"/>
                <a href="companyLogin/menu/salesOrder.jsp">销售订单</a>
            </li>
            <li>
                <img src="img/send-fill.svg"/>
                <a href="companyLogin/menu/shippingOrder.jsp">发货单</a>
            </li>
            <li>
                <img src="img/telephone-fill.svg"/>
                <a href="companyLogin/menu/followUp.jsp">跟进</a>
            </li>
            <li>
                <img src="img/suit-club-fill.svg"/>
                <a href="companyLogin/menu/product.jsp">产品</a>
            </li>
        </ul>
    </div>

    <div id="workplace">
        <div style="width: 1000px; margin-left: 100px">
            <h3>创建线索</h3>
            <br/>
            <div style="width: 500px; float: left">
                <label style="width: 90px; line-height: 35px; float: left">所有者<span style="color: red">*</span></label>
                <select class="form-control" id="create-owner" style="width: 350px; float: left">

                </select>
            </div>
            <div style="width: 450px; float: left;">
                <label style="width: 90px; line-height: 40px; float: left">公司<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="create-company" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">称呼</label>
                <select class="form-control" id="create-appellation" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${appellationList}" var="appellation">
                        <option value="${appellation.value}">${appellation.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">姓名<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="create-name" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">职位</label>
                <input type="text" class="form-control" id="create-position" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">邮箱</label>
                <input type="text" class="form-control" id="create-email" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">公司座机</label>
                <input type="text" class="form-control" id="create-companyExtension" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">公司网站</label>
                <input type="text" class="form-control" id="create-companyWebsite" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">手机</label>
                <input type="text" class="form-control" id="create-phone" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">线索状态</label>
                <select class="form-control" id="create-clueStatus" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${clueStateList}" var="clueState">
                        <option value="${clueState.value}">${clueState.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">线索来源</label>
                <select class="form-control" id="create-clueSource" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${sourceList}" var="clueSource">
                        <option value="${clueSource.value}">${clueSource.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">线索描述</label>
                <textarea class="form-control" rows="4" id="create-description" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">联系纪要</label>
                <textarea class="form-control" rows="4" id="create-contactMinute" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">下次联系时间</label>
                <input type="text" class="form-control" id="create-nextContactTime" style="width: 300px; float: left" readonly/>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">详细地址</label>
                <textarea class="form-control" rows="4" id="create-detailAddress" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px; margin-bottom: 100px">
                <button type="button" class="btn btn-default" onclick="cancel()" style="width: 400px; float: right">取消</button>
                <button type="button" class="btn btn-primary" onclick="add()" style="width: 400px; float: left">创建</button>
            </div>

        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    //时间选择器
    laydate.render({
        elem: "#create-nextContactTime"
    })

    $(document).ready(function () {
        //统计图表部分下拉列表的显示与隐藏
        var count = true;
        $("#statistics div").hide();
        $("#statistics span").click(function () {
            if (count == true) {
                $("#statistics div").show();
            } else {
                $("#statistics div").hide();
            }
            count = !count;
        });

        //使点击的菜单栏背景颜色变为蓝色
        $("#menu ul li:eq(5)").css({"background-color": "blue"});

        //点击header中的用户名显示下拉列表进行系统设置 再点击时隐藏
        var flag = false;
        $("#dLabel").click(function (){
            flag = !flag;
            if (flag == true){
                $(".dropdown-menu").show();
            }else {
                $(".dropdown-menu").hide();
            }
        })

        //设好owner文本框的下拉列表值
        getUserData();
        $("#create-owner").val('${user.id}');

    })

    //拿到user的名字数据 作为下拉列表的值
    function getUserData(){
        //向后端发送ajax请求 拿到user的所有数据
        $.ajax({
            url: "workbench/activity/getUserList.do",
            data: {

            },
            type: "get",
            dataType: "json",
            async: false,   //设置ajax请求同步 即执行完ajax请求后才会继续往下执行 默认情况下为异步
            success: function (data){
                //console.log(data)
                let html = "";

                //n用来遍历data的， i是接收data的
                $.each(data.data, function (i, n){
                    html += "<option value='"+n.id+"'>"+n.name+"</option>";
                })

                $("#create-owner").append(html);
            }
        })
    }

    //取消
    function cancel(){
        window.location.href = "companyLogin/menu/clue.jsp";
    }

    //创建
    function add(){
        //发送ajax请求，进行添加线索操作
        $.ajax({
            url: "workbench/clue/addClue.do",
            data: {
                "owner": $.trim($("#create-owner").val()),
                "company": $.trim($("#create-company").val()),
                "salutation": $.trim($("#create-appellation").val()),
                "name": $.trim($("#create-name").val()),
                "position": $.trim($("#create-position").val()),
                "email": $.trim($("#create-email").val()),
                "companyExtension": $.trim($("#create-companyExtension").val()),
                "companyWebsite":$.trim($("#create-companyWebsite").val()),
                "phone": $.trim($("#create-phone").val()),
                "clueStatus": $.trim($("#create-clueStatus").val()),
                "clueSource": $.trim($("#create-clueSource").val()),
                "description": $.trim($("#create-description").val()),
                "contactMinute": $.trim($("#create-contactMinute").val()),
                "nextContactTime": $.trim($("#create-nextContactTime").val()),
                "detailAddress": $.trim($("#create-detailAddress").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    window.location.href = "companyLogin/menu/clue.jsp";
                }else {
                    alert(data.message);
                }
            }
        })
    }

</script>
</html>
