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
    <title>联系人</title>
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
        <h3>联系人列表</h3>
        <hr>
        <div style="width: 1290px; float: left;">
            <%--    隐藏域，用来保存条件查询信息        --%>
            <input type="hidden" id="hidden-name"/>
            <input type="hidden" id="hidden-company"/>
            <input type="hidden" id="hidden-birthday"/>
            <input type="hidden" id="hidden-source"/>
            <input type="hidden" id="hidden-owner"/>

            <%--    条件查询联系人信息        --%>
            <form id="clue-search" style="width: 1000px; float: left;">
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon5">所有者</span>
                    <input type="text" class="form-control" id="search-owner" aria-describedby="basic-addon5"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon1">姓名</span>
                    <input type="text" class="form-control" id="search-name" aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon2">客户名称</span>
                    <input type="text" class="form-control" id="search-company" aria-describedby="basic-addon2"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon">来源</span>
                    <select class="form-control" id="search-source">
                        <option></option>
                        <c:forEach items="${sourceList}" var="source">
                            <option value="${source.value}">${source.text}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon6">生日</span>
                    <input type="text" class="form-control" id="search-birthday" aria-describedby="basic-addon6"/>
                </div>
                <button type="button" class="btn btn-default" style="margin-left: 10px; float: left" onclick="search()">
                    查询
                </button>
            </form>

            <%--      增删改查按钮          --%>
            <div style="width: 1290px; margin-button: 40px; margin-top: 50px; float: left;">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png"
                                                                                   style="width: 20px;"/>创建
                </button>
                <button type="button" class="btn btn-default" onclick="update()"><img src="img/pencil-fill.svg"/>修改
                </button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png"
                                                                                  style="width: 20px;"/>删除
                </button>
            </div>

            <%--     联系人列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="contact-list">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox"/></th>
                        <th scope="col">姓名</th>
                        <th scope="col">客户名称</th>
                        <th scope="col">所有者</th>
                        <th scope="col">来源</th>
                        <th scope="col">生日</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>

            <%--       分页         --%>
            <div id="pagination"></div>

            <%--       添加或修改联系人时打开该模态窗口         --%>
            <div class="modal fade" id="save-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">创建</h1>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body" style="height: 670px">
                            <form id="save-u">
                                <%--      隐藏域， 修改时获取修改的id                          --%>
                                <input type="hidden" id="hidden-id">

                                <div style="width: 400px; float: left">
                                    <label style="width: 100px; line-height: 40px; float: left">所有者<span
                                            style="color: red">*</span></label>
                                    <select class="form-control" id="save-owner" style="width: 250px; float: left">

                                    </select>
                                </div>

                                <div style="width: 350px; float: left;">
                                    <label style="width: 80px; line-height: 40px; float: left">名称<span
                                            style="color: red">*</span></label>
                                    <input type="text" class="form-control" id="save-name"
                                           style="width: 250px; float: left"/>
                                </div>

                                <div style="width: 400px; float: left; margin-top: 20px">
                                    <label style="width: 100px; line-height: 30px; float: left">来源</label>
                                    <select class="form-control" id="save-source" style="width: 250px; float: left">
                                        <option></option>
                                        <c:forEach items="${sourceList}" var="source">
                                            <option value="${source.value}">${source.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div style="width: 350px; float: left; margin-top: 20px;">
                                    <label style="width: 80px; line-height: 30px; float: left">称呼</label>
                                    <select class="form-control" id="save-salutation" style="width: 250px; float: left">
                                        <option></option>
                                        <c:forEach items="${appellationList}" var="appellation">
                                            <option value="${appellation.value}">${appellation.text}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div style="width: 400px; float: left; margin-top: 20px;">
                                    <label style="width: 100px; line-height: 40px; float: left">邮箱</label>
                                    <input type="text" class="form-control" id="save-email"
                                           style="width: 250px; float: left"/>
                                </div>

                                <div style="width: 350px; float: left; margin-top: 20px;">
                                    <label style="width: 80px; line-height: 40px; float: left">手机</label>
                                    <input type="text" class="form-control" id="save-phone"
                                           style="width: 250px; float: left"/>
                                </div>

                                <div style="width: 400px; float: left; margin-top: 20px;">
                                    <label style="width: 100px; line-height: 40px; float: left">职位</label>
                                    <input type="text" class="form-control" id="save-position"
                                           style="width: 250px; float: left"/>
                                </div>

                                <div style="width: 350px; float: left; margin-top: 20px;">
                                    <label style="width: 80px; line-height: 40px; float: left">生日</label>
                                    <input type="text" class="form-control" id="save-birthday"
                                           style="width: 250px; float: left" readonly />
                                </div>

                                <div style="width: 400px; float: left; margin-top: 20px">
                                    <label style="width: 100px; line-height: 40px; float: left">下次联系时间</label>
                                    <input type="text" class="form-control" id="save-nextContactTime"
                                           style="width: 250px; float: left" readonly/>
                                </div>

                                <div style="width: 350px; float: left; margin-top: 20px;">
                                    <label style="width: 80px; line-height: 40px; float: left">客户名称</label>
                                    <input type="text" class="form-control" id="save-customerName"
                                           style="width: 250px; float: left" placeholder="支持自动补全，客户不存在则新建" />
                                </div>

                                <div style="width: 750px; height: 120px; float: left; margin-top: 20px">
                                    <label style="width: 100px;  float: left">描述</label>
                                    <textarea class="form-control" rows="3" id="save-description"
                                              style="width: 650px; float: left"></textarea>
                                </div>

                                <div style="width: 750px; height: 120px; float: left;">
                                    <label style="width: 100px;  float: left">联系纪要</label>
                                    <textarea class="form-control" rows="3" id="save-contactMinute"
                                              style="width: 650px; float: left"></textarea>
                                </div>

                                <div style="width: 750px; height: 120px; float: left;">
                                    <label style="width: 100px;  float: left">详细地址</label>
                                    <textarea class="form-control" rows="3" id="save-detailAddress"
                                              style="width: 650px; float: left"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="save()">确定</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    //时间选择器
    laydate.render({
        elem: "#search-birthday"
    })
    laydate.render({
        elem: "#save-birthday"
    })
    laydate.render({
        elem: "#save-nextContactTime"
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
        $("#menu ul li:eq(7)").css({"background-color": "blue"});

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

        //显示联系人列表
        getContactList(1, 3);

        //点击联系人列表头部的复选框 头部以下的复选框都默认选中
        $("#contact-list thead input[type='checkbox']").click(function () {
            /*if (this.checked) {
                $("#contact-list tbody input[type='checkbox']").prop('checked', true);
                //$("#contact-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#contact-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#contact-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#contact-list tbody").on("click", $("#contact-list tbody input[type='checkbox']"), function () {
            $("#contact-list thead input[type='checkbox']").prop("checked", $("#contact-list tbody input[type='checkbox']").length == $("#contact-list tbody input[type='checkbox']:checked").length);
        })
    })

    //点击查询时进行条件查询
    function search() {
        $("#hidden-owner").val($.trim($("#search-owner").val()));
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-company").val($.trim($("#search-company").val()));
        $("#hidden-source").val($.trim($("#search-source").val()));
        $("#hidden-birthday").val($.trim($("#search-birthday").val()));

        //查询联系人列表
        getContactList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
    }

    //查询联系人列表
    function getContactList(pageNo, pageSize) {
        //初始化工作
        $("#contact-list thead input[type='checkbox']").prop('checked', false);
        $("#search-owner").val($.trim($("#hidden-owner").val()));
        $("#search-name").val($.trim($("#hidden-name").val()));
        $("#search-company").val($.trim($("#hidden-company").val()));
        $("#search-source").val($.trim($("#hidden-source").val()));
        $("#search-birthday").val($.trim($("#hidden-birthday").val()));

        //发送Ajax请求，拿到联系人对应数据
        $.ajax({
            url: "workbench/contact/getContactListByCondition.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                owner: $("#search-owner").val(),
                name: $("#search-name").val(),
                company: $("#search-company").val(),
                source: $("#search-source").val(),
                birthday: $("#search-birthday").val()
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                var html = "";

                //console.log("data",data.data.dataList[0].customer)
                $.each(data.data.dataList, function (i, n) {
                    html += "<tr> <td> <input type='checkbox' value='" + n.id + "' /> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/contact/detail.do?id=" + n.id + "\";'>" + n.name + n.salutation + "</a></td> <td>" + (n.customer == null ? "" : n.customer.name) + "</td> <td>" + n.owner + "</td> <td>" + n.source + "</td> <td>" + n.birthday + "</td> </tr>";
                });

                //显示客户列表
                $("#contact-list tbody").html(html);

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
                        getContactList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });
            }
        })
    }

    //拿到用户的名字作为模态窗口中所有者的下拉列表值
    function getUser(){
        //初始化工作
        //$("#save-owner").html("");
        $("#save-u")[0].reset();

        //发送Ajax请求，拿到user列表的数据
        $.ajax({
            url: "workbench/activity/getUserList.do",
            data: {

            },
            type: "get",
            dataType: "json",
            async: false,
            success: function (data){
                let html = "";

                //n用来遍历data的， i是接收data的
                $.each(data.data, function (i, n){
                    html += "<option value='"+n.id+"'>"+n.name+"</option>";
                })

                $("#save-owner").html(html);
            }
        })
    }

    //光标移到模态窗口中的客户名称输入框时触发键盘弹起事件
    $("#save-customerName").keyup(function (event) {
        if ($("#save-customerName").val() != '' && event.keyCode != 8) {
            //发送Ajax请求，拿到客户名字
            $.ajax({
                url: "workbench/contact/getCustomerByName.do",
                data: {
                    name: $.trim($("#save-customerName").val())
                },
                type: "get",
                dataType: "json",
                success: function (data) {
                    //console.log("data",data)
                    if (data.data != null && data.data != '') {
                        $("#save-customerName").val(data.data.name);
                    }
                }
            })
        }
    })

    //点击创建按钮后触发
    function add(){
        //初始化工作
        $("#exampleModalLabel").text("添加");
        getUser();

        //所有者默认为当前登录者
        var id = "${user.id}"
        $("#save-owner").val(id);

        $("#save-modal").modal("show");
    }

    //修改联系人信息
    function update(){
        var $checked = $("#contact-list tbody input[type='checkbox']:checked");
        if ($checked.length == 0){
            alert("请选择要修改的记录");
        }else if($checked.length > 1){
            alert("每次只能修改一条记录");
        }else {
            //初始化工作
            $("#exampleModalLabel").text("修改");
            getUser();

            var id = $checked.val();

            //console.log("id",id)
            //发送Ajax请求，拿到对应数据填入模态框对应位置
            $.ajax({
                url: "workbench/contact/getContactById.do",
                data: {
                    id: id
                },
                type: "get",
                dataType: "json",
                success: function (data){
                    //console.log("data",data)
                    $("#hidden-id").val(data.data.id);
                    $("#save-name").val(data.data.name);
                    $("#save-owner").val(data.data.owner);
                    $("#save-source").val(data.data.source);
                    $("#save-salutation").val(data.data.salutation);
                    $("#save-email").val(data.data.email);
                    $("#save-phone").val(data.data.phone);
                    $("#save-position").val(data.data.position);
                    $("#save-birthday").val(data.data.birthday);
                    $("#save-description").val(data.data.description);
                    $("#save-contactMinute").val(data.data.contactMinute);
                    $("#save-nextContactTime").val(data.data.nextContactTime);
                    $("#save-detailAddress").val(data.data.detailAddress);
                    $("#save-customerName").val((data.data.customer==null?"":data.data.customer.name));

                    //打开模态窗口1
                    $("#save-modal").modal("show");
                }
            })
        }
    }

    //点击模态窗口中的确认按钮后触发
    function save(){
        //发送Ajax请求，保存联系人数据到后端
        $.ajax({
            url: "workbench/contact/saveContact.do",
            data: {
                id :$("#hidden-id").val(),
                name :$.trim($("#save-name").val()),
                owner :$.trim($("#save-owner").val()),
                source :$.trim($("#save-source").val()),
                salutation :$.trim($("#save-salutation").val()),
                email :$.trim($("#save-email").val()),
                phone :$.trim($("#save-phone").val()),
                position :$.trim($("#save-position").val()),
                birthday :$.trim($("#save-birthday").val()),
                description :$.trim($("#save-description").val()),
                contactMinute :$.trim($("#save-contactMinute").val()),
                nextContactTime :$.trim($("#save-nextContactTime").val()),
                detailAddress :$.trim($("#save-detailAddress").val()),
                customerName :$.trim($("#save-customerName").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200") {
                    if ($("#hidden-id").val() == null || $("#hidden-id").val() == '') {//添加
                        getContactList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                    }else {//修改
                        getContactList($("#pagination").bs_pagination('getOption', 'currentPage'), $("#pagination").bs_pagination('getOption', 'rowsPerPage'));

                        //清空隐藏域
                        $("#hidden-id").val("");
                    }

                    //关闭模态窗口
                    $("#save-modal").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }

    //删除联系人操作按钮
    function del(){
        var $checks = $("#contact-list tbody input[type='checkbox']:checked");
        if ($checks.length == 0){
            alert("请选择要删除的联系人记录!");
        }else {
            if (confirm("确定要删除选中的记录吗？")) {
                var ids = "";

                for (let i = 0; i < $checks.length; i++) {
                    ids += $($checks[i]).val();

                    if (i < $checks.length - 1){
                        ids += ",";
                    }
                }

                //console.log("ids", ids);
                //发送Ajax请求，执行删除操作
                $.ajax({
                    url: "workbench/contact/deleteContactByIds.do",
                    data: {
                        ids: ids
                    },
                    type: "post",
                    dataType: "json",
                    success: function (data){
                        if (data.code == "200"){
                            getContactList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                        }else {
                            alert(data.message)
                        }
                    }
                })
            }
        }
    }
</script>
</html>
