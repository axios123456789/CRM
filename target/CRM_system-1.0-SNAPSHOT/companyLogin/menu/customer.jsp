<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 17:52
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
    <title>客户</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="css/jquery.bs_pagination.min.css"/>
    <script type="text/javascript" src="js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="js/en.js"></script>

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
                <li><a href="companyLogin/menu/workstation.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;工作台</a>
                </li>
                <li><a href="companyLogin/setting/setSystem.jsp"><span class="glyphicon glyphicon-wrench"></span>&nbsp;系统设置</a>
                </li>
                <li><a href="companyLogin/setting/personInformation.jsp"><span class="glyphicon glyphicon-file"></span>&nbsp;我的资料</a>
                </li>
                <li><a href="companyLogin/setting/pwdEdit.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a>
                </li>
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
        <h3>客户列表</h3><br/>
        <div style="width: 1290px; float: left">
            <%--    条件查询        --%>
            <form id="search">
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon1">名称</span>
                    <input type="text" class="form-control" id="search-name" aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon2">所有者</span>
                    <input type="text" class="form-control" id="search-owner" aria-describedby="basic-addon2"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon3">公司座机</span>
                    <input type="text" class="form-control" id="search-companyExtension"
                           aria-describedby="basic-addon3"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon4">公司网站</span>
                    <input type="text" class="form-control" id="search-companyWebsite" aria-describedby="basic-addon4"/>
                </div>
                <button type="button" class="btn btn-default" onclick="search()">查询</button>
            </form>

            <%--   条件查询时隐藏域中的值             --%>
            <input type="hidden" id="hidden-name" />
            <input type="hidden" id="hidden-owner" />
            <input type="hidden" id="hidden-companyExtension" />
            <input type="hidden" id="hidden-companyWebsite" />

            <br/><br/>

            <%--      增删改查按钮          --%>
            <div style="width: 1290px; float: left;">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png"
                                                                                   style="width: 20px;"/>创建
                </button>
                <button type="button" class="btn btn-default" onclick="upData()"><img src="img/pencil-fill.svg"/>修改
                </button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png"
                                                                                  style="width: 20px;"/>删除
                </button>
            </div>

            <%--     客户列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="customer-list">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox"/></th>
                        <th scope="col">名称</th>
                        <th scope="col">所有者</th>
                        <th scope="col">公司座机</th>
                        <th scope="col">公司网站</th>
                    </tr>
                    </thead>
                    <tbody>

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
        $("#menu ul li:eq(6)").css({"background-color": "blue"});

        //点击header中的用户名显示下拉列表进行系统设置 再点击时隐藏
        var flag = false;
        $("#dLabel").click(function () {
            flag = !flag;
            if (flag == true) {
                $(".dropdown-menu").show();
            } else {
                $(".dropdown-menu").hide();
            }
        })

        //显示客户列表
        getCustomerList(1, 3);

        //点击市场活动列表头部的复选框 头部以下的复选框都默认选中
        $("#customer-list thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#customer-list tbody input[type='checkbox']").prop('checked', true);
                //$("#customer-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#customer-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#customer-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#customer-list tbody").on("click", $("#customer-list tbody input[type='checkbox']"), function (){
            $("#customer-list thead input[type='checkbox']").prop("checked", $("#customer-list tbody input[type='checkbox']").length == $("#customer-list tbody input[type='checkbox']:checked").length);
        })

    })

    //条件查询
    function search(){
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-owner").val($.trim($("#search-owner").val()));
        $("#hidden-companyExtension").val($.trim($("#search-companyExtension").val()));
        $("#hidden-companyWebsite").val($.trim($("#search-companyWebsite").val()));
        getCustomerList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
    }

    //查询客户列表
    function getCustomerList(pageNo, pageSize){
        //初始化工作
        $("#customer-list thead input[type='checkbox']").prop('checked', false);
        $("#search-name").val($.trim($("#hidden-name").val()));
        $("#search-owner").val($.trim($("#hidden-owner").val()));
        $("#search-companyExtension").val($.trim($("#hidden-companyExtension").val()));
        $("#search-companyWebsite").val($.trim($("#hidden-companyWebsite").val()));

        //发送Ajax请求，向后端拿到客户列表的数据
        $.ajax({
            url: "workbench/customer/getCustomerListByCondition",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                name: $("#search-name").val(),
                owner: $("#search-owner").val(),
                companyExtension: $("#search-companyExtension").val(),
                companyWebsite: $("#search-companyWebsite").val()
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data.dataList, function (i, n){
                    html += "<tr> <td> <input type='checkbox' value='"+n.id+"'/> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/customer/detail.do?id="+n.id+"\";'>"+n.name+"</a></td> <td>"+n.owner+"</td> <td>"+n.companyExtension+"</td> <td>"+n.companyWebsite+"</td> </tr>";
                });

                //显示客户列表
                $("#customer-list tbody").html(html);

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
                        getCustomerList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });
            }
        })
    }


</script>
</html>
