<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 18:58
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
    <title>线索统计图表</title>
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
           <%-- <li>
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
        <div style="width: 1290px;float: left">
            <div style="width: 850px; height: 400px; float: left; margin-left: 150px;" id="statusCharts"></div>
            <div style="width: 850px; height: 400px; float: left; margin-left: 150px; margin-top: 50px;" id="sourceCharts"></div>
        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    $(document).ready(function () {
        //统计图表部分下拉列表的显示与隐藏
        var count = false;
        $("#statistics div").show();
        $("#statistics span").click(function () {
            if (count == true) {
                $("#statistics div").show();
            } else {
                $("#statistics div").hide();
            }
            count = !count;
        });

        //使点击的菜单栏背景颜色变为蓝色
        $("#statistics  div:eq(1)").css({"background-color": "blue"});

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

        //线索两个对应图表
        showClueStatusAndSourceCharts();
    })

    //显示线索状态和来源图表
    function showClueStatusAndSourceCharts(){
        //发送Ajax请求拿到对应数据
        $.ajax({
            url: "workbench/clue/showClueStatusAndSourceCharts.do",
            data: {

            },
            type: "get",
            dataType: "json",
            success: function (data){
                clueStatus(data.data.clueStatus);
                clueSource(data.data.clueSource);
            }
        })
    }

    //线索状态表显示
    function clueStatus(data){
        var chartDom = document.getElementById('statusCharts');
        var myChart = echarts.init(chartDom);

        var option = {
            title: {
                text: '线索状态统计图',
                left: 'left',
                top: 'bottom'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c}'
            },
            toolbox: {
                orient: 'vertical',
                top: 'center',
                feature: {
                    dataView: { readOnly: false },
                    restore: {},
                    saveAsImage: {}
                }
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series: [
                {
                    name: '线索状态',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '5%',
                    top: '50%',
                    data: data
                },
                {
                    name: '线索状态',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '5%',
                    top: '5%',
                    sort: 'ascending',
                    data: data
                },
                {
                    name: '线索状态',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '55%',
                    top: '5%',
                    label: {
                        position: 'left'
                    },
                    data: data
                },
                {
                    name: '线索状态',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '55%',
                    top: '50%',
                    sort: 'ascending',
                    label: {
                        position: 'left'
                    },
                    data: data
                }
            ]
        };

        option && myChart.setOption(option);
    }

    //线索来源图表显示
    function clueSource(data){
        var chartDom = document.getElementById('sourceCharts');
        var myChart = echarts.init(chartDom);

        var option = {
            title: {
                text: '线索来源统计图',
                left: 'left',
                top: 'bottom'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c}'
            },
            toolbox: {
                orient: 'vertical',
                top: 'center',
                feature: {
                    dataView: { readOnly: false },
                    restore: {},
                    saveAsImage: {}
                }
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series: [
                {
                    name: '线索来源',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '5%',
                    top: '50%',
                    data: data
                },
                {
                    name: '线索来源',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '5%',
                    top: '5%',
                    sort: 'ascending',
                    data: data
                },
                {
                    name: '线索来源',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '55%',
                    top: '5%',
                    label: {
                        position: 'left'
                    },
                    data: data
                },
                {
                    name: '线索来源',
                    type: 'funnel',
                    width: '40%',
                    height: '45%',
                    left: '55%',
                    top: '50%',
                    sort: 'ascending',
                    label: {
                        position: 'left'
                    },
                    data: data
                }
            ]
        };

        option && myChart.setOption(option);
    }
</script>
</html>
