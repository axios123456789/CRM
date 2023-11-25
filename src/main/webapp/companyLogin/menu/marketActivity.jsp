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
    <title>市场活动</title>
    <base href="<%=basePath%>">

    <link rel="stylesheet" type="text/css" href="css/work.css"/>
<%--    <script type="text/javascript" src="js/jquery-3.7.1.min.js"></script>--%>
<%--    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="js/jquery-1.9.1.min.js"></script>

    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <%--<link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
--%>

    <link rel="stylesheet" type="text/css" href="css/jquery.bs_pagination.min.css"/>
    <script type="text/javascript" src="js/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="js/en.js"></script>
<%--    <link rel="stylesheet" type="text/css" href="plug-ins/layui-v2.7.6/layui/css/layui.css"/>--%>

    <script type="text/javascript" src="plug-ins/layDate-v5.3.1/laydate/laydate.js"></script>

<%--    <script type="text/javascript" src="plug-ins/layui-v2.7.6/layui/layui.js"></script>--%>
</head>
<body>
<%--隐藏域 用于条件查询--%>
<input type="hidden" id="hidden-name">
<input type="hidden" id="hidden-owner">
<input type="hidden" id="hidden-startDate">
<input type="hidden" id="hidden-endDate">

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

    <%--  工作区内容  --%>
    <div id="workplace">
        <h3>市场活动列表</h3><br />
        <div style="width: 1290px; float: left;">
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
                    <span class="input-group-addon" id="basic-addon3">开始日期</span>
                    <input type="text" class="form-control" id="search-startDate" aria-describedby="basic-addon3"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon4">结束日期</span>
                    <input type="text" class="form-control" id="search-endDate" aria-describedby="basic-addon4"/>
                </div>
                <button type="button" class="btn btn-default" onclick="search()">查询</button>
            </form>
            <br/><br/>

            <%--      增删改查按钮          --%>
            <div style="width: 1290px; float: left;">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png" style="width: 20px;"/>创建</button>
                <button type="button" class="btn btn-default" onclick="upData()"><img src="img/pencil-fill.svg" />修改</button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png" style="width: 20px;"/>删除</button>
            </div>

            <%--     市场活动列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="activity-list">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th> <input type="checkbox" /> </th>
                            <th scope="col">名称</th>
                            <th scope="col">所有者</th>
                            <th scope="col">开始日期</th>
                            <th scope="col">结束日期</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>

            <%--       分页         --%>
            <div id="pagination"></div>

            <%--     点击创建时的模块modal fade       --%>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">创建</h1>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body" style="height: 300px">
                            <form id="create-u">
                                <%--      隐藏域， 修改时获取修改的id                          --%>
                                <input type="hidden" id="hidden-id">

                                <div style="width: 400px; height: 40px; float: left">
                                    <label style="width: 80px; line-height: 40px; float: left">所有者<span style="color: red">*</span></label>
                                    <select class="form-control" id="create-owner" style="width: 200px; float: left">

                                    </select>
                                </div>

                                <div style="width: 350px; height: 40px; float: left;">
                                    <label style="width: 80px; line-height: 40px; float: left">名称<span style="color: red">*</span></label>
                                    <input type="text" class="form-control" id="create-name" style="width: 200px; float: left" />
                                </div>

                                <div style="width: 400px; height: 40px; float: left; margin-top: 20px">
                                    <label style="width: 80px; line-height: 30px; float: left">开始日期</label>
                                    <input type="text" class="form-control" id="create-startDate" style="width: 200px; float: left" readonly />
                                </div>

                                <div style="width: 350px; height: 40px; float: left; margin-top: 20px;">
                                    <label style="width: 80px; line-height: 30px; float: left">结束日期</label>
                                    <input type="text" class="form-control" id="create-endDate" style="width: 200px; float: left" readonly />
                                </div>

                                <div style="width: 750px; height: 40px; float: left; margin-top: 20px">
                                    <label style="width: 80px; line-height: 40px; float: left">成本</label>
                                    <input type="text" class="form-control" id="create-cost" style="width: 200px; float: left" />
                                </div>

                                <div style="width: 750px; height: 150px; float: left; margin-top: 20px;">
                                    <label style="width: 80px;  float: left">描述</label>
                                    <textarea class="form-control" rows="3" id="create-description" style="width: 670px; float: left"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button"  class="btn btn-default" data-dismiss="modal">取消</button>
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
        elem: '#create-startDate'
        // ,type: 'datetime'
    });
    laydate.render({
        elem: '#create-endDate'
        // ,type: 'datetime'
    })
    laydate.render({
        elem: "#search-startDate"
    })
    laydate.render({
        elem: "#search-endDate"
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
        $("#menu ul li:eq(4)").css({"background-color": "blue"});

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

        //显示市场活动的列表
        pageSelectActivityList(1, 3);

        //点击市场活动列表头部的复选框 头部以下的复选框都默认选中
        $("#activity-list thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#activity-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#activity-list tbody").on("click", $("#activity-list tbody input[type='checkbox']"), function (){
            $("#activity-list thead input[type='checkbox']").prop("checked", $("#activity-list tbody input[type='checkbox']").length == $("#activity-list tbody input[type='checkbox']:checked").length);
        })

    })

    //条件查询
    function search(){
        //将条件查询的语句保存到隐藏域中
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-owner").val($.trim($("#search-owner").val()));
        $("#hidden-startDate").val($.trim($("#search-startDate").val()));
        $("#hidden-endDate").val($.trim($("#search-endDate").val()));

        pageSelectActivityList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
    }

    //查询市场活动表
    function pageSelectActivityList(pageNo, pageSize){
        //每次查询市场活动列表时 先将表格清空一下和复选框
        $("#activity-list table tbody").html("");
        $("#activity-list thead input[type='checkbox']").prop('checked', false);

        //查询之前 将隐藏域中的值赋到条件查询框中去
        $("#search-name").val($.trim($("#hidden-name").val()));
        $("#search-owner").val($.trim($("#hidden-owner").val()));
        $("#search-startDate").val($.trim($("#hidden-startDate").val()));
        $("#search-endDate").val($.trim($("#hidden-endDate").val()));

        //市场活动列表显示 发送ajax请求 向后端拿到市场活动列表数据
        // $("#activity-list table tbody").append("<tr> <th>1</th> <td>Mark</td> <td>Otto</td> <td>@mdo</td> </tr>");
        $.ajax({
            url : "workbench/activity/getActivityList.do",
            data : {
                "pageNoStr" : pageNo,
                "pageSizeStr" : pageSize,
                "name" : $.trim($("#search-name").val()),
                "owner" : $.trim($("#search-owner").val()),
                "startDate" : $.trim($("#search-startDate").val()),
                "endDate" : $.trim($("#search-endDate").val())
            },
            type : "get",
            dataType : "json",
            success : function (data){
                //console.log(data);
                let html = "";

                $.each(data.data.dataList, function (i, n){
                    html += "<tr> <td> <input type='checkbox' value='"+n.id+"'/> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/activity/detail.do?id="+n.id+"\";'>"+n.name+"</a></td> <td>"+n.owner+"</td> <td>"+n.startDate+"</td> <td>"+n.endDate+"</td> </tr>";
                });

                //显示市场活动列表
                $("#activity-list table tbody").html(html);

                //计算总页数
                var totalPages = data.data.total % pageSize == 0 ? data.data.total / pageSize : parseInt(data.data.total / pageSize) + 1;

                //分页
                /*layui.use(['laypage', 'layer'], function (){
                    var laypage = layui.laypage
                        ,layer = layui.layer;
                    laypage.render({
                        elem: 'pagination'
                        ,count: data.total
                        ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
                        ,jump: function(obj, first){
                            console.log(obj)
                            //obj.limit = 1
                            //obj.limits = [1,2,3,4,5]
                            //pageSelectActivityList(obj.curr, obj.limit)
                            if (!first) {
                                $("#activity-list table tbody").html("")
                                pageSelectActivityList(obj.curr, obj.limit)
                            }
                        },
                    });
                });*/

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
                        pageSelectActivityList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });

            }
        })
    }

    //拿到user的名字数据 作为下拉列表的值
    function getUserData(){
        //打开模态窗口前 先将模态窗口中各数据清空
        $("#create-owner").html("");
        /*$("#create-name").val("");
        $("#create-startDate").val("");
        $("#create-endDate").val("");
        $("#create-cost").val("");
        $("#create-description").val("");*/
        $("#create-u")[0].reset();

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

    //点击添加按钮的操作
    function add(){
        //将模态窗的标题改为添加
        $("#exampleModalLabel").text("添加");

        getUserData();

        //获取当前登录用户的id
        //在js中使用el表达式，el表达式一定要套用在字符串中
        let id = "${user.id}";
        $("#create-owner").val(id);

        //打开模态窗口
        $('#myModal').modal('show');
    }

    //点击修改按钮后触发
    function upData(){
        var $checked = $("#activity-list tbody input[type='checkbox']:checked");
        if ($checked.length == 0){
            alert("请选择要修改的记录");
        }else if ($checked.length > 1){
            alert("一次只能修改一条数据");
        }else {
            //将模态窗的标题改为修改
            $("#exampleModalLabel").text("修改");

            getUserData();

            //拿到id
            var id = $checked.val();

            //发送ajax请求 拿到该id对应的数据
            $.ajax({
                url : "workbench/activity/getActivityById.do",
                data: {
                    "id" : id
                },
                type: "get",
                dataType: "json",
                success: function (data){
                    $("#hidden-id").val(data.data.id)
                    $("#create-owner").val(data.data.owner);
                    $("#create-name").val(data.data.name);
                    $("#create-startDate").val(data.data.startDate);
                    $("#create-endDate").val(data.data.endDate);
                    $("#create-cost").val(data.data.cost);
                    $("#create-description").val(data.data.description);
               }
            })

        $('#myModal').modal('show')
    }
}

//点击删除按钮后触发
function del(){
    var $checkedAll = $("#activity-list tbody input[type='checkbox']:checked");
    if ($checkedAll.length == 0){
        alert("请选择需要删除的记录");
    }else {
        if (confirm("确定删除所选中的记录吗?")){
            //拼接参数
            var param = "";

            //取得需要删除记录的id
            for (let i = 0; i < $checkedAll.length; i++) {
                param += $($checkedAll[i]).val();

                //如果不是最后一个元素 需要在后面加一个&符
                if (i < $checkedAll.length - 1){
                    param += ",";
                }
            }

            //发送ajax请求 删除选中的对象
            $.ajax({
                url: "workbench/activity/del.do",
                data: {
                    "ids": param
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        pageSelectActivityList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }
}

//点击模态窗口中的确定按钮后触发
function save(){
    //点击确定后 向后端发送ajax请求 添加市场活动数据到activity表中
    $.ajax({
        url: "workbench/activity/save.do",
        data: {
            "id" : $.trim($("#hidden-id").val()),
            "owner" : $.trim($("#create-owner").val()),
            "name" : $.trim($("#create-name").val()),
            "startDate" : $.trim($("#create-startDate").val()),
            "endDate" : $.trim($("#create-endDate").val()),
            "cost" : $.trim($("#create-cost").val()),
            "description" : $.trim($("#create-description").val())
        },
        type: "post",
        dataType: "json",
        success: function (data){
            if (data.code == "200"){//添加成功
                //判断修改还是添加点击的确定按钮
                var id = $.trim($("#hidden-id").val())
                if (id == null || id == ""){//添加
                    pageSelectActivityList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                }else {//修改
                    pageSelectActivityList($("#pagination").bs_pagination('getOption', 'currentPage'), $("#pagination").bs_pagination('getOption', 'rowsPerPage'));

                    //清空id隐藏域
                    $("#hidden-id").val("");
                }

                //关闭模态窗口
                $('#myModal').modal('hide');
            }else {//添加失败
                alert(data.message);
            }
        }
    })
}
</script>
</html>
