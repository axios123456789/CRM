<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/12/22
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>个人设置</title>
    <base href="<%=basePath%>">

    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script src="js/jquery-1.9.1.min.js"></script>

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
    <div style="width: 1100px; margin-left: 250px; margin-top: 50px">
        <h3>管理员专属权限</h3>
        <hr/>
        <div style="width: 100%; float: left">
            <%--        条件查询--%>
            <div style="width: 100%; float: left">
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon1">名称</span>
                    <input type="text" class="form-control" id="search-name" aria-describedby="basic-addon1"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon2">部门编号</span>
                    <input type="text" class="form-control" id="search-deptno" aria-describedby="basic-addon2"/>
                </div>
                <div class="input-group" style="width: 310px; float: left">
                    <span class="input-group-addon" id="basic-addon3">账号级别</span>
                    <select class="form-control" id="search-lockState">
                        <option></option>
                        <option value="0">被锁定的账号</option>
                        <option value="1">普通账号</option>
                        <option value="2">管理员账号</option>
                    </select>
                </div>
                <button type="button" class="btn btn-default" style="margin-left: 10px" onclick="search()">查询</button>
            </div>

            <%--隐藏域，存放查询条件--%>
            <input type="hidden" id="hidden-name">
            <input type="hidden" id="hidden-deptno">
            <input type="hidden" id="hidden-lockState">

            <%--    按钮，添加新账号    --%>
            <div style="width: 100%; float: left; margin-top: 50px">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png"
                                                                                   style="width: 20px;"/>添加账号
                </button>
            </div>

            <%--   除当前账号以外所有账号列表     --%>
            <div style="width: 100%; float: left; margin-top: 30px" id="act-list">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">名字</th>
                        <th scope="col">账号</th>
                        <th scope="col">邮箱</th>
                        <th scope="col">账号过期时间</th>
                        <th scope="col">部门编号</th>
                        <th scope="col">允许IP</th>
                        <th scope="col">账号级别</th>
                        <th scope="col">操作</th>
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

    <%--    添加账号的模态窗口--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="add-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">添加新账号</h4>
                </div>
                <div class="modal-body" style="width: 100%; height: 350px">
                    <form id="add-form">
                        <div style="width: 100%; float: left;">
                            <label style="width: 100px; line-height: 35px; float: left;">账号:</label>
                            <input class="form-control" style="width: 250px; float: left" id="loginAct">
                            <label style="width: 100px; float: left; line-height: 35px; margin-left: 50px">密码:</label>
                            <input class="form-control" style="width: 250px; float:left;" id="loginPwd">
                        </div>
                        <div style="width: 100%; float: left; margin-top: 50px">
                            <label style="width: 100px; line-height: 35px; float: left;">名字:</label>
                            <input class="form-control" style="width: 250px; float: left" id="name">
                            <label style="width: 100px; float: left; line-height: 35px; margin-left: 50px">邮箱:</label>
                            <input class="form-control" style="width: 250px; float:left;" id="email">
                        </div>
                        <div style="width: 100%; float: left; margin-top: 50px" id="specal-input">
                            <label style="width: 100px; line-height: 30px; float: left;">账号过期时间:</label>
                            <input class="form-control" style="width: 250px; float: left" id="expireTime" readonly>
                            <label style="width: 100px; float: left; line-height: 30px; margin-left: 50px">账号允许的IP:</label>
                            <input class="form-control" style="width: 250px; float:left;" id="allowIps"
                                   placeholder="填入允许的IP，用逗号分隔！">
                        </div>
                        <div style="width: 100%; float: left; margin-top: 50px">
                            <label style="width: 100px; line-height: 35px; float: left;">部门编号:</label>
                            <input class="form-control" style="width: 250px; float: left" id="deptno">
                            <label style="width: 100px; float: left; line-height: 35px; margin-left: 50px">账号级别:</label>
                            <select class="form-control" style="width: 250px; float:left;" id="lockState">
                                <option value="1">普通账号</option>
                                <option value="0">被锁定的账号</option>
                                <option value="2">管理员账号</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="add_act()">添加</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <%--    修改账户的模态窗口--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="update-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改账户信息</h4>
                </div>
                <div class="modal-body" style="width: 100%; height: 250px">
                    <input type="hidden" id="hidden-id">
                    <div style="width: 100%; float: left; margin-top: 50px">
                        <label style="width: 100px; line-height: 30px; float: left;">账号过期时间:</label>
                        <input class="form-control" style="width: 250px; float: left" id="edit-expireTime" readonly>
                        <label style="width: 100px; float: left; line-height: 30px; margin-left: 50px">账号允许的IP:</label>
                        <input class="form-control" style="width: 250px; float:left;" id="edit-allowIps" placeholder="填入允许的IP，用逗号分隔！">
                    </div>
                    <div style="width: 100%; float: left; margin-top: 50px">
                        <label style="width: 100px; line-height: 30px; float: left;">账号级别:</label>
                        <select class="form-control" style="width: 250px; float: left" id="edit-lockState">
                            <option value="1">普通账号</option>
                            <option value="0">被锁定的账号</option>
                            <option value="2">管理员账号</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="save()">修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</nav>
<footer></footer>
<script>
    laydate.render({
        elem: "#expireTime",
        type: "datetime"
    });
    laydate.render({
        elem: "#edit-expireTime",
        type: "datetime"
    })

    $(document).ready(function () {
        //显示列表
        getActList(1, 3);
    })

    //条件查询
    function search() {
        //将文本框中的内容保存到隐藏域中
        $("#hidden-name").val($.trim($("#search-name").val()));
        $("#hidden-deptno").val($.trim($("#search-deptno").val()));
        $("#hidden-lockState").val($.trim($("#search-lockState").val()));

        //查询
        getActList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
    }

    //查询除当前账号以外的全部账号
    function getActList(pageNo, pageSize) {
        //初始化
        $("#search-name").val($("#hidden-name").val());
        $("#search-deptno").val($("#hidden-deptno").val());
        $("#search-lockState").val($("#hidden-lockState").val());

        //发送Ajax请求，拿到对应数据
        $.ajax({
            url: "settings/user/getUserListAndNotIncludeCurrentUser.do",
            data: {
                pageNoStr: pageNo,
                pageSizeStr: pageSize,
                id: "${user.id}",
                name: $("#search-name").val(),
                deptno: $("#search-deptno").val(),
                lockState: $("#search-lockState").val()
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                var html = "";

                //console.log("clue",data)
                $.each(data.data.dataList, function (i, n) {
                    html += "<tr><td>" + n.name + "</td> <td>" + n.loginAct + "</td> <td>" + n.email + "</td> <td>" + n.expireTime + "</td> <td>" + n.deptno + "</td> <td>" + n.allowIps + "</td> <td>" + (n.lockState == '0' ? '被锁定的账号' : (n.lockState == '1' ? '普通账号' : '管理员账号')) + "</td> <td><button class='btn btn-default' onclick='update_act(\""+n.id+"\")'>修改</button>&nbsp;<button class='btn btn-danger' onclick='delete_act(\""+ n.id +"\")'>删除</button></td> </tr>";
                });

                //线索列表
                $("#act-list tbody").html(html);

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
                        getActList(pageObj.currentPage, pageObj.rowsPerPage);
                    },
                });
            }
        })
    }

    //添加账号
    function add() {
        //初始化
        $("#add-form")[0].reset();

        $("#add-modal").modal("show");
    }

    //点击添加模态窗口中的添加按钮后触发
    function add_act(){
        //发送Ajax请求，进行添加操作
        $.ajax({
            url: "settings/user/addAct.do",
            data: {
                loginAct: $.trim($("#loginAct").val()),
                loginPwd: $.trim($("#loginPwd").val()),
                name: $.trim($("#name").val()),
                email: $.trim($("#email").val()),
                expireTime: $.trim($("#expireTime").val()),
                lockState: $.trim($("#lockState").val()),
                deptno: $.trim($("#deptno").val()),
                allowIps: $.trim($("#allowIps").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    getActList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                    $("#add-modal").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }

    //修改账户
    function update_act(id){
        //发送ajax请求，拿到对应数据，填充到对应文本框中
        $.ajax({
            url: "settings/user/getUserById.do",
            data: {
                id: id
            },
            type: "get",
            dataType: "json",
            success: function (data){
                //console.log("data",data)
                $("#hidden-id").val(data.data.id);
                $("#edit-expireTime").val(data.data.expireTime);
                $("#edit-allowIps").val(data.data.allowIps);
                $("#edit-lockState").val(data.data.lockState);

                $("#update-modal").modal("show")
            }
        })
    }

    //点击修改账户模态窗口中的修改后触发
    function save(){
        //发送Ajax请求，进行修改操作
        $.ajax({
            url: "settings/user/editActByManage.do",
            data: {
                id: $("#hidden-id").val(),
                expireTime: $.trim($("#edit-expireTime").val()),
                allowIps: $.trim($("#edit-allowIps").val()),
                lockState: $.trim($("#edit-lockState").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    getActList($("#pagination").bs_pagination('getOption', 'currentPage'), $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                    $("#update-modal").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }

    //删除账户
    function delete_act(id){
        //发送Ajax请求，删除账户
        if (confirm("确定删除该账户？")) {
            $.ajax({
                url: "settings/user/deleteAct.do",
                data: {
                    id: id
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        getActList(1, $("#pagination").bs_pagination('getOption', 'rowsPerPage'));
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }

</script>
</body>

