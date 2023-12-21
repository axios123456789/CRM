<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/11/24
  Time: 20:30
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
    <title>线索转换</title>
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
        <div style="width: 100%; float:left; margin-left: 20px">
            <div id="title" class="page-header" style="position: relative; left: 20px;">
                <h4>转换线索 <small>${clue.name}${clue.salutation}-${clue.company}</small></h4>
            </div>
            <div id="create-customer" style="position: relative; left: 40px; height: 35px;">
                新建客户：${clue.company}
            </div>
            <div id="create-contact" style="position: relative; left: 40px; height: 35px;">
                新建联系人：${clue.name}${clue.salutation}
            </div>
            <div id="create-transaction1" style="position: relative; left: 40px; height: 35px; top: 25px;">
                <input type="checkbox" id="isCreateTransaction"/>
                为客户创建交易
            </div>
            <div id="create-transaction2"
                 style="position: relative; left: 40px; top: 20px; width: 80%; background-color: #F7F7F7; display: none;">

                <form>
                    <div class="form-group" style="width: 400px; position: relative; left: 20px;">
                        <label for="amountOfMoney">金额</label>
                        <input type="text" class="form-control" id="amountOfMoney">
                    </div>
                    <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                        <label for="tradeName">交易名称</label>
                        <input type="text" class="form-control" id="tradeName" value="${clue.company}-">
                    </div>
                    <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                        <label for="expectedClosingDate">预计成交日期</label>
                        <input type="text" class="form-control" id="expectedClosingDate" readonly>
                    </div>
                    <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                        <label for="stage">阶段</label>
                        <select id="stage" class="form-control">
                            <option></option>
                            <c:forEach items="${stageList}" var="s">
                                <option value="${s.value}">${s.text}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="width: 400px;position: relative; left: 20px;">
                        <label for="activity">市场活动源&nbsp;&nbsp;<a href="javascript:void(0);" data-toggle="modal"
                                                                  data-target="#searchActivityModal" onclick="searchActivity()"
                                                                  style="text-decoration: none;"><span
                                class="glyphicon glyphicon-search"></span></a></label>
                        <input type="hidden" id="activityId">
                        <input type="text" class="form-control" id="activity" placeholder="点击上面搜索" readonly>
                    </div>
                </form>

            </div>

            <div id="owner" style="position: relative; left: 40px; height: 35px; top: 50px;">
                记录的所有者：<br>
                <b>${clue.owner}</b>
            </div>
            <div id="operation" style="position: relative; left: 40px; height: 35px; top: 100px;">
                <input class="btn btn-primary" id="convertBtn" type="button" value="转换">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input class="btn btn-default" type="button" value="取消">
            </div>

            <%-- 市场活动源的模态窗口          --%>
            <div class="modal fade" tabindex="-1" role="dialog" id="activity-source">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">搜索市场活动</h4>
                        </div>

                        <div class="modal-body">
                            <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                                <div class="form-group has-feedback">
                                    <input type="text" class="form-control" style="width: 300px;"
                                           placeholder="请输入市场活动名称，支持模糊查询"
                                           v-model="name">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </div>

                            <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                                <thead>
                                <tr style="color: #B3B3B3;">
                                    <%--<td><input type="radio"/></td>--%>
                                    <td></td>
                                    <td>名称</td>
                                    <td>开始日期</td>
                                    <td>结束日期</td>
                                    <td>所有者</td>
                                    <td></td>
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
                        </div>

                        <%--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="relation()">关联</button>
                        </div>--%>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    //时间选择器
    laydate.render({
        elem: "#expectedClosingDate"
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

        //交易复选框选中则显示交易信息，未选择则隐藏交易信息
        $("#isCreateTransaction").click(function (){
            if ($("#isCreateTransaction:checked").length == 1){
                //console.log("1")
                $("#create-transaction2").show();
            }else {
                //console.log("0")
                $("#activityId").val("");
                $("#activity").val("");
                $("#create-transaction2").hide();
            }
        })
    })

    //点击交易中的市场活动源旁的搜索图像后触发
    function searchActivity(){
        //发送Ajax请求，根据线索id查询市场活动相关信息
        $.ajax({
            url: "workbench/clueRemark/getActivityListByClueId.do",
            data: {
                clueId: "${clue.id}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data, function (i, n){
                    html += "<tr><th><input type='radio' name='activity' value="+n.id+" activityName="+n.name+"></th><th>"+n.name+"</th><th>"+n.startDate+"</th><th>"+n.endDate+"</th><th>"+n.owner+"</th></tr>";
                });

                $("#activityTable tbody").html(html);

                $("#activity-source").modal("show")
            }
        })
    }

    //添加键盘弹起事件
    $(".btn-group input").keyup(function (){
        //console.log($(".btn-group input").val())
        //每次敲击键盘，就发送Ajax请求，对文本框中的内容进行模糊查询
        $.ajax({
            url: "workbench/activity/getBeRelationActivityListByName.do",
            data: {
                name: $.trim($(".btn-group input").val()),
                clueId: "${clue.id}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data, function (i,n){
                    html += "<tr><td><input type='radio' name='activity' value="+n.id+" activityName="+n.name+"></td><td>"+n.name+"</td><td>"+n.startDate+"</td><td>"+n.endDate+"</td><td>"+n.owner+"</td></tr>"
                });

                $("#activityTable tbody").html(html);
            }
        })
    })

    //点击转换按钮后触发该事件
    $("#convertBtn").click(function (){
        var isCreateTrade = "0"
        if ($("#isCreateTransaction:checked").length == 1){
            isCreateTrade = "1";
        }

        //发送Ajax请求，进行线索转换
        $.ajax({
            url: "workbench/clue/clueChange.do",
            data: {
                id: "${clue.id}",
                owner: "${user.id}",
                createBy: "${user.name}",
                isCreateTrade: isCreateTrade,
                amount: $.trim($("#amountOfMoney").val()),
                tradeName: $.trim($("#tradeName").val()),
                expectedTradeDate: $.trim($("#expectedClosingDate").val()),
                stage: $.trim($("#stage").val()),
                activityId: $("#activityId").val()
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
    })

    //点击取消按钮后触发该事件
    $("#operation input:eq(1)").click(function (){
        window.history.back();
    })

    //给模态窗口中的单选框绑定单击事件
    $("#activityTable tbody").on("click","input[name='activity']",function (){
        var activityId = this.value;
        var activityName = $(this).attr("activityName");

        //console.log("id",activityId,"name",activityName);
        $("#activityId").val(activityId);
        $("#activity").val(activityName);
        $("#activity-source").modal("hide");
    })

</script>
</html>
