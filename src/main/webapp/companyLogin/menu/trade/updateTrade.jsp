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
    <title>修改交易</title>
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
            <h3>修改交易</h3>
            <br/><br/>

            <%--            警告消息--%>
            <div class="alert alert-warning" role="alert" id="massage" style="width: 500px ;position: fixed;left: 600px;top: 100px;display: none">
                <button type="button" class="close" onclick="close_msg()"><span aria-hidden="true">&times;</span></button>
                <span id="msg-text"></span>
            </div>

            <div style="width: 500px; float: left">
                <label style="width: 100px; line-height: 35px; float: left">所有者<span style="color: red">*</span></label>
                <select class="form-control" id="edit-owner" style="width: 350px; float: left">

                </select>
            </div>
            <div style="width: 450px; float: left;">
                <label style="width: 100px; line-height: 40px; float: left">金额<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="edit-amount" style="width: 350px; float: left"/>
            </div>

            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">名称<span style="color: red">*</span></label>
                <input type="text" class="form-control" id="edit-name" style="width: 350px; float: left"/>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">预计成交日期</label>
                <input type="text" class="form-control" id="edit-expectedTradeDate" style="width: 350px; float: left"
                       readonly/>
            </div>

            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">客户名称&nbsp;&nbsp;<a
                        href="javascript:void(0);" data-toggle="modal"
                        data-target="#searchActivityModal" onclick="searchCustomer()"
                        style="text-decoration: none;"><span
                        class="glyphicon glyphicon-search"></span></a></label>
                <input type="hidden" id="edit-customerId">
                <input type="text" class="form-control" id="edit-customerName" placeholder="点击左边图标面搜索"
                       style="width: 350px; float: left" readonly/>
            </div>
            <div style="width: 450px; float: left;margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">阶段</label>
                <select class="form-control" id="edit-stage" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${stageList}" var="stage">
                        <option value="${stage.value}">${stage.text}</option>
                    </c:forEach>
                </select>
            </div>

            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">类型</label>
                <select class="form-control" id="edit-transactionType" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${transactionTypeList}" var="transactionType">
                        <option value="${transactionType.value}">${transactionType.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">可能性</label>
                <input type="text" class="form-control" id="edit-possibility" style="width: 350px; float: left"
                       readonly/>
            </div>

            <div style="width: 500px; float: left;margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">来源</label>
                <select class="form-control" id="edit-source" style="width: 350px; float: left">
                    <option></option>
                    <c:forEach items="${sourceList}" var="clueSource">
                        <option value="${clueSource.value}">${clueSource.text}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">市场活动源&nbsp;&nbsp;<a
                        href="javascript:void(0);" data-toggle="modal"
                        data-target="#searchActivityModal" onclick="searchActivity()"
                        style="text-decoration: none;"><span
                        class="glyphicon glyphicon-search"></span></a></label>
                <input type="hidden" id="edit-activityId">
                <input type="text" class="form-control" id="edit-activityName" placeholder="点击左边图标面搜索"
                       style="width: 350px; float: left" readonly/>
            </div>

            <div style="width: 500px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">联系人名称&nbsp;&nbsp;<a
                        href="javascript:void(0);" data-toggle="modal"
                        data-target="#searchActivityModal" onclick="searchContact()"
                        style="text-decoration: none;"><span
                        class="glyphicon glyphicon-search"></span></a></label>
                <input type="hidden" id="edit-contactId">
                <input type="text" class="form-control" id="edit-contactName" placeholder="点击左边图标面搜索"
                       style="width: 350px; float: left" readonly/>
            </div>
            <div style="width: 450px; float: left; margin-top: 50px">
                <label style="width: 100px; line-height: 40px; float: left">下次联系时间</label>
                <input type="text" class="form-control" id="edit-nextContactTime" style="width: 350px; float: left"
                       readonly/>
            </div>

            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 100px;  float: left">描述</label>
                <textarea class="form-control" rows="4" id="edit-description"
                          style="width: 900px; float: left"></textarea>
            </div>

            <div style="width: 1000px; float: left; margin-top: 50px;">
                <label style="width: 100px;  float: left">联系纪要</label>
                <textarea class="form-control" rows="4" id="edit-contactMinute"
                          style="width: 900px; float: left"></textarea>
            </div>

            <div style="width: 1000px; float: left; margin-top: 50px; margin-bottom: 100px">
                <button type="button" class="btn btn-default" onclick="cancel()" style="width: 400px; float: right">取消
                </button>
                <button type="button" class="btn btn-primary" onclick="update()" style="width: 400px; float: left">修改
                </button>
            </div>

        </div>

        <%--    各文本框中填入内容的模态窗口--%>
        <div class="modal fade" tabindex="-1" role="dialog" id="vary-source">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 800px;">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>

                    <div class="modal-body">
                        <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" style="width: 300px;"
                                       placeholder="请输入名称，支持模糊查询"
                                       v-model="name">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>

                        <table id="varyTable" class="table table-hover"
                               style="width: 900px; position: relative;top: 10px;">
                            <thead>
                            <tr style="color: #B3B3B3;">
                                <%--<td><input type="radio"/></td>--%>
                                <%--<td></td>
                                <td>名称</td>
                                <td>开始日期</td>
                                <td>结束日期</td>
                                <td>所有者</td>
                                <td></td>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <%--<tr v-for="activity in activityList" :key="activity.id">
                                <td><input type="checkbox" v-model="checks" :value="activity.id"/></td>
                                <td>{{activity.name}}</td>
                                <td>{{activity.startDate}}</td>
                                <td>{{activity.endDate}}</td>
                                <td>{{activity.owner}}</td>
                            </tr>--%>
                            </tbody>
                        </table>

                        <%--       分页         --%>
                        <div id="pagination"></div>
                    </div>

                    <%--<div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" onclick="relation()">关联</button>
                    </div>--%>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>
</nav>
<footer></footer>
</body>
<script>
    //时间选择器
    laydate.render({
        elem: "#edit-nextContactTime"
    })
    laydate.render({
        elem: "#edit-expectedTradeDate"
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
        $("#menu ul li:eq(8)").css({"background-color": "blue"});

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

        //设好owner文本框的下拉列表值
        getUserData();
        getCustomerById();
        getActivityById();
        getContactById();
        $("#edit-owner").val('${trade.id}');
        $("#edit-amount").val('${trade.amount}');
        $("#edit-expectedTradeDate").val('${trade.expectedTradeDate}');
        $("#edit-name").val('${trade.name}');
        $("#edit-customerId").val('${trade.customerId}');
        $("#edit-stage").val('${trade.stage}');
        $("#edit-transactionType").val('${trade.type}');
        $("#edit-source").val('${trade.source}');
        $("#edit-activityId").val('${trade.activityId}');
        $("#edit-contactId").val('${trade.contactId}');
        $("#edit-nextContactTime").val('${trade.nextContactTime}');
        $("#edit-description").val('${trade.description}');
        $("#edit-contactMinute").val('${trade.contactMinute}');
        if ($("#edit-stage").val() != "" && $("#edit-stage").val() != null){
            $.ajax({
                url: "workbench/trade/queryPossibility.do",
                type: "post",
                dataType: "json",
                data: {
                    stageName: $("#edit-stage").val()
                },
                success: function (data) {
                    $("#edit-possibility").val("%"+data);
                }
            })
        }

    })

    //根据客户id查询客户信息
    function getCustomerById(){
        $.ajax({
            url: "workbench/customer/getCustomerById.do",
            data: {
                id: "${trade.customerId}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-customerName").val(data.data.name)
            }
        })
    }

    //根据id查询市场活动信息
    function getActivityById(){
        $.ajax({
            url: "workbench/activity/getActivityById.do",
            data: {
                id: "${trade.activityId}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-activityName").val(data.data.name);
            }
        })
    }

    //根据id查询联系人信息
    function getContactById(){
        $.ajax({
            url: "workbench/contact/getContactById.do",
            data: {
                id: "${trade.contactId}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-contactName").val(data.data.name);
            }
        })
    }

    //拿到user的名字数据 作为下拉列表的值
    function getUserData() {
        //向后端发送ajax请求 拿到user的所有数据
        $.ajax({
            url: "workbench/activity/getUserList.do",
            data: {},
            type: "get",
            dataType: "json",
            async: false,   //设置ajax请求同步 即执行完ajax请求后才会继续往下执行 默认情况下为异步
            success: function (data) {
                //console.log(data)
                let html = "";

                //n用来遍历data的， i是接收data的
                $.each(data.data, function (i, n) {
                    html += "<option value='" + n.id + "'>" + n.name + "</option>";
                })

                $("#edit-owner").append(html);
            }
        })
    }

    //添加键盘弹起事件，进行模糊查询
    $(".btn-group input").keyup(function (){
        var name = $(".btn-group input").val();

        if ($("#vary-source .modal-header h4").text() == "客户列表"){
            //console.log("data", $(".btn-group input").val())
            //根据名字条件查询客户列表
            getCustomerList(1, 3, name);
        }

        if ($("#vary-source .modal-header h4").text() == "市场活动源"){
            getActivityList(1, 3, name);
        }

        if ($("#vary-source .modal-header h4").text() == "联系人列表"){
            getContactList(1, 3, name);
        }
    })

    //为模态窗口中的单选框添加点击事件
    $("#varyTable tbody").on("click","input[name='allSource']", function (){
        var id = this.value;
        var name = $(this).attr("allName");

        if ($("#vary-source .modal-header h4").text() == "客户列表"){
            //console.log("data", id, name)
            $("#edit-customerId").val(id);
            $("#edit-customerName").val(name);

        }

        if ($("#vary-source .modal-header h4").text() == "市场活动源"){
            $("#edit-activityId").val(id);
            $("#edit-activityName").val(name);
        }

        if ($("#vary-source .modal-header h4").text() == "联系人列表"){
            $("#edit-contactId").val(id);
            $("#edit-contactName").val(name);
        }

        //隐藏模态窗口
        $("#vary-source").modal("hide");
    })

    //查询客户,拿到对应数据
    function getCustomerList(pageNo, pageSize, customerName) {
        //发送Ajax请求，拿到客户对应的数据
        $.ajax({
            url: "workbench/customer/getCustomerListByCondition.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                name: customerName
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                var html = "";

                $.each(data.data.dataList, function (i, n) {
                    html += "<tr> <td> <input type='radio' name='allSource' value='" + n.id + "' allName='" + n.name + "' /> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/customer/detail.do?id=" + n.id + "\";'>" + n.name + "</a></td> <td>" + n.owner + "</td> <td>" + n.companyExtension + "</td> <td>" + n.companyWebsite + "</td> </tr>";
                });

                //显示客户列表
                $("#varyTable tbody").html(html);

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
                        getCustomerList(pageObj.currentPage, pageObj.rowsPerPage, "");
                    },
                });

                //打开模态窗口
                $("#vary-source").modal("show");
            }
        })
    }

    //点击客户名称右边的搜索图标后触发
    function searchCustomer() {
        //初始化工作
        $(".btn-group input").val("");
        $("#vary-source .modal-header h4").text("客户列表");
        var html = "<td></td><td>名称</td><td>所有者</td><td>公司座机</td><td>公司网站</td>"
        $("#varyTable thead tr").html(html);

        //显示列表
        getCustomerList(1, 3, "");
    }

    //查询市场活动列表，拿到对应数据
    function getActivityList(pageNo, pageSize, activityName){
        //发送Ajax请求，拿到对应数据
        $.ajax({
            url: "workbench/activity/getActivityList.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                name: activityName
            },
            type: "get",
            dataType: "json",
            success: function (data){
                let html = "";

                $.each(data.data.dataList, function (i, n){
                    html += "<tr> <td> <input type='radio' name='allSource' value='" + n.id + "' allName='" + n.name + "' /> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/activity/detail.do?id="+n.id+"\";'>"+n.name+"</a></td> <td>"+n.owner+"</td> <td>"+n.startDate+"</td> <td>"+n.endDate+"</td> </tr>";
                });

                //显示市场活动列表
                $("#varyTable tbody").html(html);

                //计算总页数
                var totalPages = data.data.total % pageSize == 0 ? data.data.total / pageSize : parseInt(data.data.total / pageSize) + 1;


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
                        getActivityList(pageObj.currentPage, pageObj.rowsPerPage, "");
                    },
                });

                //打开模态窗口
                $("#vary-source").modal("show");
            }
        })
    }

    //点击市场活动源左边的搜索图标后触发
    function searchActivity() {
        //初始化工作
        $(".btn-group input").val("");
        $("#vary-source .modal-header h4").text("市场活动源");
        var html = "<td></td><td>名称</td><td>所有者</td><td>开始日期</td><td>结束日期</td>"
        $("#varyTable thead tr").html(html);

        //查询市场活动列表
        getActivityList(1, 3, "");
    }

    //查询联系人列表
    function getContactList(pageNo, pageSize, contactName){
        //发送Ajax请求，拿到对应数据
        $.ajax({
            url: "workbench/contact/getContactListByCondition.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                name: contactName
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                //console.log("data",data.data.dataList[0].customer)
                $.each(data.data.dataList, function (i, n) {
                    html += "<tr> <td> <input type='radio' name='allSource' value='" + n.id + "' allName='" + n.name + "' /> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/contact/detail.do?id=" + n.id + "\";'>" + n.name + n.salutation + "</a></td> <td>" + (n.customer == null ? "" : n.customer.name) + "</td> <td>" + n.owner + "</td> <td>" + n.source + "</td> <td>" + n.birthday + "</td> </tr>";
                });

                //显示客户列表
                $("#varyTable tbody").html(html);

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
                        getContactList(pageObj.currentPage, pageObj.rowsPerPage, "");
                    },
                });

                //打开模态窗口
                $("#vary-source").modal("show");
            }
        })
    }

    //点击联系人名称旁边的搜索图标后触发
    function searchContact() {
        //初始化工作
        $(".btn-group input").val("");
        $("#vary-source .modal-header h4").text("联系人列表");
        var html = "<td></td><td>姓名</td><td>客户名称</td><td>所有者</td><td>来源</td><td>生日</td>"
        $("#varyTable thead tr").html(html);

        //查询联系人列表
        getContactList(1, 3, "");
    }

    // 给阶段下拉列表添加change事件
    $("#edit-stage").change(function () {
        // 获取阶段名称
        var stageName = $("#edit-stage option:selected").text();
        if (stageName == "") {
            $("#edit-possibility").val("");
            return;
        }

        $.ajax({
            url: "workbench/trade/queryPossibility.do",
            type: "post",
            dataType: "json",
            data: {
                stageName: stageName
            },
            success: function (data) {
                $("#edit-possibility").val("%"+data);
            }
        })
    });

    //取消
    function cancel() {
        //window.location.href = "companyLogin/menu/trade.jsp";
        window.history.back();
    }

    //点击警告框中的叉按钮后触发
    function close_msg(){
        $("#massage").hide();
    }

    //修改
    function update() {
        if ($("#edit-customerId").val() == "" || $("#edit-customerId").val() == null){
            $("#msg-text").text("客户名称不能为空！");
            $("#massage").show();
        }else if ($("#edit-activityId").val() == "" || $("#edit-activityId").val() == null){
            $("#msg-text").text("市场活动源不能为空！");
            $("#massage").show();
        }else if ($("#edit-contactId").val() == "" || $("#edit-contactId").val() == null){
            $("#msg-text").text("联系人名字不能为空！");
            $("#massage").show();
        }else {
            //发送ajax请求，进行修改线索操作
            $.ajax({
                url: "workbench/trade/editTrade.do",
                data: {
                    id: "${trade.id}",
                    owner: $.trim($("#edit-owner").val()),
                    amount: $.trim($("#edit-amount").val()),
                    expectedTradeDate: $.trim($("#edit-expectedTradeDate").val()),
                    name: $.trim($("#edit-name").val()),
                    customerId: $.trim($("#edit-customerId").val()),
                    stage: $.trim($("#edit-stage").val()),
                    type: $.trim($("#edit-transactionType").val()),
                    source: $.trim($("#edit-source").val()),
                    activityId: $.trim($("#edit-activityId").val()),
                    contactId: $.trim($("#edit-contactId").val()),
                    nextContactTime: $.trim($("#edit-nextContactTime").val()),
                    description: $.trim($("#edit-description").val()),
                    contactMinute: $.trim($("#edit-contactMinute").val())
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.code == "200") {
                        window.location.href = "companyLogin/menu/trade.jsp";
                    } else {
                        alert(data.message);
                    }
                }
            })
        }
    }

</script>
</html>
