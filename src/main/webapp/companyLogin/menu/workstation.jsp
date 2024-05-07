<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/1
  Time: 12:45
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
    <title>工作界面</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/echarts5.4.3.js"></script>
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

    <%--工作区内容--%>
    <div id="workplace">
        <div style="width: 600px; float: left">
            <%--  客户信息列表      --%>
            <div style="width: 600px; height: 500px; float: left">
                <h3>北京客户</h3>
                <br><br>
                <table class="table" id="customer-list">
                    <thead>
                    <tr>
                        <th scope="col">客户名称</th>
                        <th scope="col">城市</th>
                        <th scope="col">行业</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

            <%--     客户成交排名       --%>
            <div style="width: 600px; float: left; margin-top: 20px">
                <h3>客户成交排名</h3>
                <br><br>
                <table class="table" id="order-list">
                    <thead>
                    <tr>
                        <th scope="col">客户名称</th>
                        <th scope="col">成交数</th>
                        <th scope="col">排名</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>

        <div style="width: 679px; float: left">
            <%--    销售漏斗管理        --%>
            <div style="width: 679px; height: 500px; float: left; margin-left: 20px">
                <h3>销售漏斗管理</h3>
                <div id="main" style="width: 679px;height:450px;float: left; margin-top: 40px;"></div>
            </div>

            <%--    行业分析       --%>
            <div style="width: 679px; float:left; margin-left: 20px; margin-top: 20px">
                <h3>行情分析</h3>
                <div style="width: 100%; margin-top: 50px;">
                    <span style="color: #3e8f3e; font-size: 20px; font-family: 华文新魏">
                        近年来，随着客户越来越多，企业与客户建立的交易也越来越多，现企业已与多家大公司合作，公司因该致力于维护好大公司的关系。
                    </span>
                </div>
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
        $("#menu ul li:eq(0)").css({"background-color": "blue"});

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

        showTradeCharts();
        getCustomerList();
        getCustomerOrder();
    })

    //显示图表
    function showTradeCharts(){
        //发送Ajax请求，查询各阶段交易数量
        $.ajax({
            url: "workbench/trade/showTradeCharts.do",
            data: {

            },
            type: "get",
            dataType: "json",
            success: function (data){
                //console.log("data",data)
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '交易统计图表',
                        subtext: '交易表中各个阶段的数量'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c}'
                    },
                    toolbox: {
                        feature: {
                            dataView: { readOnly: false },
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    legend: {
                        data: data.data
                    },
                    series: [
                        {
                            name: '数据量',
                            type: 'funnel',
                            left: '10%',
                            width: '80%',
                            label: {
                                formatter: '{b}'
                            },
                            labelLine: {
                                show: true
                            },
                            itemStyle: {
                                opacity: 0.7
                            },
                            emphasis: {
                                label: {
                                    position: 'inside',
                                    formatter: '{b}: {c}'
                                }
                            },
                            data: data.data
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        })
    }

    //查询客户相关信息
    function getCustomerList(){
        //发送Ajax请求，拿到对应数据
        $.ajax({
            url: "workbench/customer/getCustomerByDetailAddress.do",
            data: {
                detailAddress: "北京"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data, function (i,n){
                    html += "<tr><td>"+n.name+"</td><td>"+n.detailAddress+"</td><td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/customer/detail.do?id=" + n.id + "\";'>查看详细信息</a></td></tr>"
                });

                $("#customer-list tbody").html(html);
            }
        })
    }

    //查询客户排名
    function getCustomerOrder(){
        //发送Ajax请求，查询相关数据
        $.ajax({
            url: "workbench/customer/getCustomerSaleOrder.do",
            data: {

            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data, function (i,n){
                   html += "<tr><td>"+n.name+"</td><td>"+n.amount+"</td><td>"+n.orderNo+"</td></tr>"
                });

                $("#order-list tbody").html(html);
            }
        })
    }
</script>
</html>
