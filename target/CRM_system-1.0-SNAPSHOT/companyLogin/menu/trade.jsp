<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 17:54
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
    <title>交易</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/jquery.bs_pagination.min.css"/>
    <script type="text/javascript" src="js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="js/en.js"></script>
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
        <div>
            <div style="position: relative; left: 10px; top: -10px;">
                <div class="page-header">
                    <h3>交易列表</h3>
                </div>
            </div>
        </div>

<%--        条件查询--%>
        <div style="position: relative; left: 10px; top: -20px; width: 1290px; height: 80px;">
            <form id="trade-search" style="position: relative; top: 5px;">
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon1">名称</span>
                    <input type="text" class="form-control" id="search-name" aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon2">所有者</span>
                    <input type="text" class="form-control" id="search-owner" aria-describedby="basic-addon2"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon3">客户名称</span>
                    <input type="text" class="form-control" id="search-customerName" aria-describedby="basic-addon3"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon4">阶段</span>
                    <select class="form-control" id="search-stage">
                        <option></option>
                        <c:forEach items="${stageList}" var="stage">
                            <option value="${stage.value}">${stage.text}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon5">类型</span>
                    <select class="form-control" id="search-transactionType">
                        <option></option>
                        <c:forEach items="${transactionTypeList}" var="transactionType">
                            <option value="${transactionType.value}">${transactionType.text}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon6">来源</span>
                    <select class="form-control" id="search-source">
                        <option></option>
                        <c:forEach items="${sourceList}" var="source">
                            <option value="${source.value}">${source.text}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon7">联系人名称</span>
                    <input type="text" class="form-control" id="search-contactName" aria-describedby="basic-addon7"/>
                </div>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="search()">查询</button>
            </form>

<%--            条件查询用来保存查询条件的隐藏域--%>
            <input type="hidden" id="hidden-name"/>
            <input type="hidden" id="hidden-owner"/>
            <input type="hidden" id="hidden-customerName"/>
            <input type="hidden" id="hidden-stage"/>
            <input type="hidden" id="hidden-transactionType"/>
            <input type="hidden" id="hidden-source"/>
            <input type="hidden" id="hidden-contactName"/>
        </div>

        <div style="width: 1290px; position: relative; left: 10px; top: 30px">
            <%--        增删改操作按钮--%>
            <div style="width: 1290px; float: left">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png"
                                                                                   style="width: 20px;"/>创建
                </button>
                <button type="button" class="btn btn-default" onclick="update()"><img src="img/pencil-fill.svg"/>修改
                </button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png"
                                                                                  style="width: 20px;"/>删除
                </button>
            </div>

            <%--        交易列表--%>
            <div style="width: 1290px; float: left; margin-top: 40px">
                <table class="table table-hover" id="trade-list">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td><input type="checkbox"/></td>
                        <td>名称</td>
                        <td>客户名称</td>
                        <td>阶段</td>
                        <td>类型</td>
                        <td>所有者</td>
                        <td>来源</td>
                        <td>联系人名称</td>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- <tr>
                         <td><input type="checkbox"/></td>
                         <td><a style="text-decoration: none; cursor: pointer;"
                                onclick="window.location.href='workbench/transaction/tranDetail.do?tranId=36be8d3e0c3747eeade2b68402701dcb';">动力节点-交易01</a></td>
                         <td>动力节点</td>
                         <td>谈判/复审</td>
                         <td>新业务</td>
                         <td>zhangsan</td>
                         <td>广告</td>
                         <td>李四</td>
                     </tr>
                     <tr class="active">
                         <td><input type="checkbox"/></td>
                         <td><a style="text-decoration: none; cursor: pointer;"
                                onclick="window.location.href='workbench/transaction/tranDetail.do?tranId=36be8d3e0c3747eeade2b68402701dcb';">动力节点-交易01</a></td>
                         <td>动力节点</td>
                         <td>谈判/复审</td>
                         <td>新业务</td>
                         <td>zhangsan</td>
                         <td>广告</td>
                         <td>李四</td>
                     </tr>--%>
                    </tbody>
                </table>
            </div>

            <%--       分页         --%>
            <div id="pagination"></div>
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
        $("#menu ul li:eq(8)").css({"background-color": "blue"});

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

        //显示交易列表
        getTradeList(1, 3);

        //点击交易列表头部的复选框 头部以下的复选框都默认选中
        $("#trade-list thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#trade-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#trade-list tbody").on("click", $("#trade-list tbody input[type='checkbox']"), function (){
            $("#trade-list thead input[type='checkbox']").prop("checked", $("#trade-list tbody input[type='checkbox']").length == $("#trade-list tbody input[type='checkbox']:checked").length);
        })
    })

    //条件查询交易列表
    function search(){
        //将查询输入框中的内容赋到隐藏框中
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-owner").val($.trim($("#search-owner").val()));
        $("#hidden-customerName").val($.trim($("#search-customerName").val()));
        $("#hidden-stage").val($.trim($("#search-stage").val()));
        $("#hidden-transactionType").val($.trim($("#search-transactionType").val()));
        $("#hidden-source").val($.trim($("#search-source").val()));
        $("#hidden-contactName").val($.trim($("#search-contactName").val()));

        //查询交易列表信息
        getTradeList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'))
    }

    //分页及条件查询交易列表
    function getTradeList(pageNo, pageSize){
        //初始化工作
        $("#trade-list thead input[type='checkbox']").prop('checked', false);
        $("#search-name").val($("#hidden-name").val());
        $("#search-owner").val($("#hidden-owner").val());
        $("#search-customerName").val($("#hidden-customerName").val());
        $("#search-stage").val($("#hidden-stage").val());
        $("#search-transactionType").val($("#hidden-transactionType").val());
        $("#search-source").val($("#hidden-source").val());
        $("#search-contactName").val($("#hidden-contactName").val());

        //发送Ajax请求，拿到交易列表的数据
        $.ajax({
            url: "workbench/trade/getTradeListByCondition.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                name: $("#search-name").val(),
                owner: $("#search-owner").val(),
                customerName: $("#search-customerName").val(),
                stage: $("#search-stage").val(),
                type: $("#search-transactionType").val(),
                source: $("#search-source").val(),
                contactName: $("#search-contactName").val(),
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data.dataList, function (i, n) {
                    html += "<tr> <td> <input type='checkbox' value='" + n.id + "'/> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/trade/detail.do?id=" + n.id + "\";'>" + n.name + "</a></td> <td>" + n.customerId + "</td> <td>" + n.stage + "</td> <td>" + n.type + "</td> <td>" + n.owner + "</td> <td>" + n.source + "</td> <td>" + n.contactId + "</td> </tr>";
                });

                //显示客户列表
                $("#trade-list tbody").html(html);

                //计算总页数
                var totalPages = data.data.total % pageSize == 0 ? data.data.total / pageSize : parseInt(data.data.total / pageSize) + 1;

                //分页
                $("#pagination").bs_pagination({
                    currentPage: pageNo, //打开时显示到第几页，默认显示首页
                    rowsPerPage: pageSize, //每页显示的数据条数，默认为10条
                    maxRowsPerPage: 20,     //每页最多显示的记录条数
                    totalPages: totalPages, //必须填，默认为100，表示显示多少页，应该自己算好再填
                    totalRows: data.data.total, //数据总条数，默认1000
                    visiblePageLinks: 3, //设置显示多少个按钮，默认为5
                    showGoToPage: true,//是否显示“跳转到”部分，默认为true，表示显示
                    showRowsInfo: true, //是否显示记录的信息，默认是true
                    showRowsPerPage: true, //是否显示“每页显示条数”的部分，默认是true
                    showRowsDefaultInfo: true,
                    //用户每次切换页号都会执行本函数
                    //该函数每次返回切换页号之后的pageNo和pageSize
                    onChangePage: function (event, pageObj) {
                        /*alert(event);
                           alert(pageObj.currentPage);//当前页面
                           alert(pageObj.rowsPerPage);//当前页面的数据条数*/
                        getTradeList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });
            }
        })
    }

    //创建交易
    function add(){
        window.location.href = "companyLogin/menu/trade/addTrade.jsp"
    }

    //修改交易相关信息
    function update(){

    }

    //删除一笔或多笔交易
    function del(){

    }
</script>
</html>
