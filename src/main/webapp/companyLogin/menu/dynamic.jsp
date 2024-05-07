<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/1
  Time: 16:38
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
    <title>动态</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>

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
                    <a href="companyLogin/menu/statistical_charts/tradeChart.jsp">交易统计图表</a>
                </div>
            </div>
            <%--<li>
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
            </li>--%>
        </ul>
    </div>

    <div id="workplace">
        <div style="width: 620px; float: left; text-align: center">
            <span style="font-size: 40px; font-family: 华文新魏">最近成交的客户</span>
            <div id="recentlyTradeCustomer" style="width: 100%; float: left; margin-top: 20px">
                <%--<div style="width: 100%; height: 400px; float: left;">
                    <span style="font-size: 30px; font-family: 华文新魏; color: rebeccapurple">百度</span>
                    <img src="img/customer1.png" style="width: 100%; height: 250px">
                    <div style="text-align: left; font-size: 20px; font-family: 华文仿宋">
                         &nbsp; &nbsp; 百度最早在xxxx年与我们企业建立联系，该客户位于xxxx，百度的官网是
                         <a>xxxx</a>，我们可以访问该网站查看百度的详细信息以及最新动态，如有疑问可以拨
                         打xxxx解决疑惑。该客户最近与我们企业成交的交易是在xxxx年与我们完成
                         了一笔叫做xxxx的交易。
                    </div>
                </div>--%>
            </div>
        </div>
        <div style="width: 620px;float: left ;margin-left: 50px; text-align: center">
            <span style="font-size: 40px; font-family: 华文新魏">最近创建的交易</span>
            <div id="recentlyCreateTrade" style="width: 100%; float: left; margin-top: 20px">

            </div>
        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
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
        $("#menu ul li:eq(1)").css({"background-color": "blue"});

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

        //显示最近客户
        searchRecentlyCustomer();

        //显示最近创建的交易
        recentlyCreateTrade();
    })

    //最近客户
    function searchRecentlyCustomer(){
        //发送ajax请求，拿到数据
        $.ajax({
            url: "workbench/dynamic/getRecentlyCustomer",
            data: {

            },
            type: 'get',
            dataType: 'json',
            success: function (data){
                var html = '';
                var k = 0

                $.each(data.data, function (i,n){
                   k = k+1;
                   html += ' <div style="width: 100%; height: 500px; float: left">'
                   html += '     <span style="font-size: 30px; font-family: 华文新魏; color: rebeccapurple">'+n.customerName+'</span>'
                   html += '     <img src="img/customer'+k+'.png" style="width: 100%; height: 250px">'
                   html += '         <div style="text-align: left; font-size: 20px; font-family: 华文仿宋">'
                   html += '             &nbsp; &nbsp; '+n.customerName+'最早在'+n.customerCreateTime+'与我们企业建立联系，该客户位于'+(n.detailAddress == null ? '全国各处':n.detailAddress)+'，'+n.customerName+'的官网是'
                   html += '             <a>'+(n.companyWebsite == null ? 'https://baidu.com':n.companyWebsite)+'</a>，我们可以访问该网站查看'+n.customerName+'的详细信息以及最新动态，如有疑问可以拨'
                   html += '             打'+(n.companyExtension == null ? '111-3232-1111':n.companyExtension)+'解决疑惑。该客户最近与我们企业成交的交易是在'+n.tradeEditTime+'与我们完成'
                   html += '             了一笔叫做'+n.tradeName+'的交易。'
                   html += '         </div>'
                   html += ' </div>'
                });

                $("#recentlyTradeCustomer").html(html);
            }
        })
    }

    //最近创建的交易
    function recentlyCreateTrade(){
        //发送ajax请求，拿到数据
        $.ajax({
            url: "workbench/dynamic/getRecentlyCreateTrade",
            data: {

            },
            type: 'get',
            dataType: 'json',
            success: function (data){
                var html = '';
                var k = 0;

                $.each(data.data, function (i,n){
                    k = k+1;
                    html += ' <div style="width: 100%; height: 500px; float: left">'
                    html += '     <span style="font-size: 30px; font-family: 华文新魏; color: rebeccapurple">'+n.name+'</span>'
                    html += '     <img src="img/recentTrade'+k+'.png" style="width: 100%; height: 250px">'
                    html += '         <div style="text-align: left; font-size: 20px; font-family: 华文仿宋">'
                    html += '             &nbsp; &nbsp; 我们公司在'+n.createTime+'与'+n.customerId+'的企业人员'+n.contactId+''
                    html += '             创建了一笔叫做'+n.name+'的类型为'+n.type+'的交易，'
                    html += '             现该交易已近达到了'+n.stage+'阶段。'
                    html += '             该交易来源于'+n.source+',我们企业往后要更多关注于'+n.source+'这方面的活动。'
                    html += '         </div>'
                    html += ' </div>'
                });

                $("#recentlyCreateTrade").html(html);
            }
        })
    }
</script>
</html>
