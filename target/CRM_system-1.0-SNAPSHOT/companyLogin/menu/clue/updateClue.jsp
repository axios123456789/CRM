<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 17:38
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
    <title>修改线索</title>
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
            <h3>修改线索</h3>
            <br/>
            <div style="width: 500px; float: left">
                <label style="width: 90px; line-height: 35px; float: left">所有者<span style="color: red">*</span></label>
                <select class="form-control" id="update-owner" style="width: 350px; float: left">

                </select>
            </div>
            <div style="width: 450px; float: left;">
                <label style="width: 90px; line-height: 40px; float: left">公司<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="update-company" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">称呼</label>
                <select class="form-control" id="update-appellation" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${appellationList}" var="appellation">
                        <option value="${appellation.value}">${appellation.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">姓名<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="update-name" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">职位</label>
                <input type="text" class="form-control" id="update-position" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">邮箱</label>
                <input type="text" class="form-control" id="update-email" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">公司座机</label>
                <input type="text" class="form-control" id="update-companyExtension" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">公司网站</label>
                <input type="text" class="form-control" id="update-companyWebsite" style="width: 350px; float: left" />
            </div>
            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">手机</label>
                <input type="text" class="form-control" id="update-phone" style="width: 350px; float: left" />
            </div>
            <div style="width: 450px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">线索状态</label>
                <select class="form-control" id="update-clueStatus" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${clueStateList}" var="clueState">
                        <option value="${clueState.value}">${clueState.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">线索来源</label>
                <select class="form-control" id="update-clueSource" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${sourceList}" var="clueSource">
                        <option value="${clueSource.value}">${clueSource.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">线索描述</label>
                <textarea class="form-control" rows="4" id="update-description" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">联系纪要</label>
                <textarea class="form-control" rows="4" id="update-contactMinute" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px">
                <label style="width: 90px; line-height: 40px; float: left">下次联系时间</label>
                <input type="text" class="form-control" id="update-nextContactTime" style="width: 300px; float: left" readonly/>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 90px;  float: left">详细地址</label>
                <textarea class="form-control" rows="4" id="update-detailAddress" style="width: 900px; float: left"></textarea>
            </div>
            <div style="width: 1000px; float: left; margin-top: 50px; margin-bottom: 100px">
                <button type="button" class="btn btn-default" onclick="cancel()" style="width: 400px; float: right">取消</button>
                <button type="button" class="btn btn-primary" onclick="update()" style="width: 400px; float: left">修改</button>
            </div>

        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    //时间选择器
    laydate.render({
        elem: "#update-nextContactTime"
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

        //设好其他文本框中的值
        $("#update-owner").val('${clue.owner}');
        $("#update-company").val('${clue.company}');
        $("#update-appellation").val('${clue.salutation}');
        $("#update-name").val('${clue.name}');
        $("#update-position").val('${clue.position}');
        $("#update-email").val('${clue.email}');
        $("#update-companyExtension").val('${clue.companyExtension}');
        $("#update-companyWebsite").val('${clue.companyWebsite}');
        $("#update-phone").val('${clue.phone}');
        $("#update-clueStatus").val('${clue.clueStatus}');
        $("#update-clueSource").val('${clue.clueSource}');
        $("#update-description").val('${clue.description}');
        $("#update-contactMinute").val('${clue.contactMinute}');
        $("#update-nextContactTime").val('${clue.nextContactTime}');
        $("#update-detailAddress").val('${clue.detailAddress}');

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

                $("#update-owner").append(html);
            }
        })
    }

    //取消
    function cancel(){
        window.location.href = "companyLogin/menu/clue.jsp";
        //window.history.back();
    }

    //修改
    function update(){
        //发送ajax请求，修改线索
        $.ajax({
            url: "workbench/clue/updateClue.do",
            data: {
                "id": '${clue.id}',
                "owner": $.trim($("#update-owner").val()),
                "company": $.trim($("#update-company").val()),
                "salutation": $.trim($("#update-appellation").val()),
                "name": $.trim($("#update-name").val()),
                "position": $.trim($("#update-position").val()),
                "email": $.trim($("#update-email").val()),
                "companyExtension": $.trim($("#update-companyExtension").val()),
                "companyWebsite":$.trim($("#update-companyWebsite").val()),
                "phone": $.trim($("#update-phone").val()),
                "clueStatus": $.trim($("#update-clueStatus").val()),
                "clueSource": $.trim($("#update-clueSource").val()),
                "description": $.trim($("#update-description").val()),
                "contactMinute": $.trim($("#update-contactMinute").val()),
                "nextContactTime": $.trim($("#update-nextContactTime").val()),
                "detailAddress": $.trim($("#update-detailAddress").val())
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
