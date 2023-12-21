<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/1
  Time: 16:38
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
    <title>线索</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script src="js/jquery-1.9.1.min.js"></script>

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

    <%--  工作区内容  --%>
    <div id="workplace">
        <%--<select class="form-control">
            &lt;%&ndash;    用source遍历上下文域数据缓存中的sourceList        &ndash;%&gt;
            <c:forEach items="${sourceList}" var="source">
                <option value="${source.value}">${source.text}</option>
            </c:forEach>
        </select>--%>
        <h3>线索列表</h3>
        <hr>
        <div style="width: 1290px; float: left;">
            <%--    隐藏域，用来保存调价查询信息        --%>
            <input type="hidden" id="hidden-name"/>
            <input type="hidden" id="hidden-company"/>
            <input type="hidden" id="hidden-companyExtension"/>
            <input type="hidden" id="hidden-clueSource"/>
            <input type="hidden" id="hidden-owner"/>
            <input type="hidden" id="hidden-phone"/>
            <input type="hidden" id="hidden-clueStatus"/>

            <%--    条件查询线索信息        --%>
            <form id="clue-search">
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon1">名称</span>
                    <input type="text" class="form-control" id="search-name" aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon2">公司</span>
                    <input type="text" class="form-control" id="search-company" aria-describedby="basic-addon2"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon3">公司座机</span>
                    <input type="text" class="form-control" id="search-companyExtension"
                           aria-describedby="basic-addon3"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon">线索来源</span>
                    <select class="form-control" id="search-clueSource">
                        <option></option>
                        <c:forEach items="${sourceList}" var="source">
                            <option value="${source.value}">${source.text}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon5">所有者</span>
                    <input type="text" class="form-control" id="search-owner" aria-describedby="basic-addon5"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon6">手机</span>
                    <input type="text" class="form-control" id="search-phone" aria-describedby="basic-addon6"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon7">线索状态</span>
                    <select class="form-control" id="search-clueStatus">
                        <option></option>
                        <c:forEach items="${clueStateList}" var="status">
                            <option value="${status.value}">${status.text}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="search()">查询</button>
            </form>
            <br/><br/>

            <%--      增删改查按钮          --%>
            <div style="width: 1290px; margin-button: 40px; float: left;">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png"
                                                                                   style="width: 20px;"/>创建
                </button>
                <button type="button" class="btn btn-default" onclick="update()"><img src="img/pencil-fill.svg"/>修改
                </button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png"
                                                                                  style="width: 20px;"/>删除
                </button>
            </div>

            <%--     市场活动列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="clue-list">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox"/></th>
                        <th scope="col">名称</th>
                        <th scope="col">公司</th>
                        <th scope="col">公司座机</th>
                        <th scope="col">手机</th>
                        <th scope="col">线索来源</th>
                        <th scope="col">所有者</th>
                        <th scope="col">线索状态</th>
                        <th scope="col">职位</th>
                        <th scope="col">邮箱</th>
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
        $("#menu ul li:eq(5)").css({"background-color": "blue"});

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

        //查询线索列表
        getPageClueList(1,3);

        //点击线索列表头部的复选框 头部以下的复选框都默认选中
        $("#clue-list thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#clue-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#clue-list tbody").on("click", $("#clue-list tbody input[type='checkbox']"), function (){
            $("#clue-list thead input[type='checkbox']").prop("checked", $("#clue-list tbody input[type='checkbox']").length == $("#clue-list tbody input[type='checkbox']:checked").length);
        })

    })

    //查询线索列表
    function getPageClueList(pageNo, pageSize){
        //每次查询市场活动列表时 先将表格清空一下和复选框
        $("#clue-list thead input[type='checkbox']").prop('checked', false);
        $("#clue-list table tbody").html("");

        //将隐藏域中的值赋到文本中
        $("#search-name").val($.trim($("#hidden-name").val()));
        $("#search-company").val($.trim($("#hidden-company").val()));
        $("#search-companyExtension").val($.trim($("#hidden-companyExtension").val()));
        $("#search-clueSource").val($.trim($("#hidden-clueSource").val()));
        $("#search-owner").val($.trim($("#hidden-owner").val()));
        $("#search-phone").val($.trim($("#hidden-phone").val()));
        $("#search-clueStatus").val($.trim($("#hidden-clueStatus").val()));

        $.ajax({
            url: "workbench/clue/getClueList.do",
            data: {
                "pageNoStr" : pageNo,
                "pageSizeStr" : pageSize,
                "name": $("#search-name").val(),
                "company": $("#search-company").val(),
                "companyExtension": $("#search-companyExtension").val(),
                "clueSource": $("#search-clueSource").val(),
                "owner": $("#search-owner").val(),
                "phone": $("#search-phone").val(),
                "clueStatus": $("#search-clueStatus").val()
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                //console.log("clue",data)
                $.each(data.data.dataList, function (i, n){
                    html += "<tr> <td> <input type='checkbox' value='"+n.id+"'/> </td> <td><a style='text-decoration: none; cursor: pointer' onclick='window.location.href=\"workbench/clue/detail.do?id="+n.id+"\";'>"+n.name+n.salutation+"</a></td> <td>"+n.company+"</td> <td>"+n.companyExtension+"</td> <td>"+n.phone+"</td> <td>"+n.clueSource+"</td> <td>"+n.owner+"</td> <td>"+n.clueStatus+"</td> <td>"+n.position+"</td> <td>"+n.email+"</td> <td>"+n.companyWebsite+"</td> </tr>";
                });

                //线索列表
                $("#clue-list tbody").html(html);

                //计算总页数
                var totalPages = data.data.total % pageSize == 0 ? data.data.total / pageSize : parseInt(data.data.total / pageSize) + 1;

                //开启分页
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
                        getPageClueList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });
            }
        })
    }

    //点击查询后触发 条件查询
    function search(){
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-company").val($.trim($("#search-company").val()));
        $("#hidden-companyExtension").val($.trim($("#search-companyExtension").val()));
        $("#hidden-clueSource").val($.trim($("#search-clueSource").val()));
        $("#hidden-owner").val($.trim($("#search-owner").val()));
        $("#hidden-phone").val($.trim($("#search-phone").val()));
        $("#hidden-clueStatus").val($.trim($("#search-clueStatus").val()));

        getPageClueList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
    }

    //点击添加按钮后触发
    function add(){
        window.location.href = "companyLogin/menu/clue/createClue.jsp";
    }

    //点击修改按钮后触发
    function update(){
        let $checked = $("#clue-list tbody input[type='checkbox']:checked");
        if ($checked.length == 0){
            alert("请选中要修改的线索！");
        }else if ($checked.length > 1){
            alert("每次只能修改一条线索！");
        }else {
            //发送ajax请求，根据id查询线索信息
            $.ajax({
                url: "workbench/clue/getClueById02.do",
                data: {
                    "id": $checked.val()
                },
                type: "get",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        window.location.href = "companyLogin/menu/clue/updateClue.jsp";
                    }
                }
            })
        }
    }

    //点击删除按钮后触发
    function del(){
        //拿到选中复选框的id
        let $checks = $("#clue-list tbody input[type='checkbox']:checked");

        if ($checks.length == 0){
            alert("请选择要删除的记录！");
        }else{
            if (confirm("确定要删除选中的记录吗？")){
                //存放要删除的id组
                let ids = "";

                //拼接需要删除的id
                for (let i = 0; i < $checks.length; i++) {
                    ids += $($checks[i]).val();

                    if (i < $checks.length - 1){
                        ids += ",";
                    }
                }

                //发送Ajax请求， 删除选中的id
                $.ajax({
                    url: "workbench/clue/delClue.do",
                    data: {
                        "ids": ids
                    },
                    type: "post",
                    dataType: "json",
                    success: function (data){
                        if (data.code == "200"){
                            getPageClueList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                        }else{
                            alert(data.message);
                        }
                    }
                })
            }
        }
    }

</script>
</html>
