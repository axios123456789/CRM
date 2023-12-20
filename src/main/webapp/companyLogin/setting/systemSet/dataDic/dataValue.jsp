<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/21
  Time: 19:05
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
    <title>字典值</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
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
                <li><a href="companyLogin/setting/personInformation.jsp"><span class="glyphicon glyphicon-file"></span>&nbsp;我的资料</a>
                </li>
                <li><a href="companyLogin/setting/pwdEdit.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a></li>
                <li><a href="settings/user/outLogin.do"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</header>
<nav>
    <%-- 菜单栏   --%>
    <div id="menu">
        <ul>
            <li>
                <a href="companyLogin/setting/systemSet/dataDic/dataType.jsp">字典类型</a>
            </li>
            <li>
                <a href="companyLogin/setting/systemSet/dataDic/dataValue.jsp">字典值</a>
            </li>
        </ul>
    </div>

    <%--  工作台  --%>
    <div id="workplace">
        <h3>字典值列表</h3><br>
        <div style="width: 1290px; float:left;">
            <%--     添加条件查询       --%>
            <div style="width: 1290px; margin-bottom: 80px">
                <%--       隐藏域 用来保存类型编码        --%>
                <input type="hidden" id="hidden-search-code">

                <span class="input-group-addon"
                      style="width: 80px; height: 34px; line-height: 20px; float: left;">类型编码</span>
                <select class="form-control" id="search-value-code" style="width: 200px; float: left">
                    <option></option>
                </select>

                <button type="button" class="btn btn-default" onclick="search()"
                        style="margin-left: 20px; background-color: #b7b7b7">搜索
                </button>
            </div>

            <%--    增删改按钮组        --%>
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

            <%--     列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="value-list">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox"/></th>
                        <th>序号</th>
                        <th>字典值</th>
                        <th>文本</th>
                        <th>排序号</th>
                        <th>字典类型编码</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>

            <%--     增改字典值的模态窗口       --%>
            <div class="modal fade" id="saveValueModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 700px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body" style="height: 200px">
                            <form id="saveContent">
                                <%--       隐藏域 保存字典值id             --%>
                                <input type="hidden" id="hidden-value-id">

                                <div style="width: 330px; float: left;">
                                    <label style="width: 50px; line-height: 35px; float: left">值<span
                                            style="color: red">*</span></label>
                                    <input type="text" class="form-control" id="save-value"
                                           style="width: 250px; float: left">
                                </div>

                                <div style="width: 330px; float: left;">
                                    <label style="width: 80px; line-height: 35px; float: left">文本内容</label>
                                    <input type="text" class="form-control" id="save-text"
                                           style="width: 250px; float: left">
                                </div>

                                <div style="width: 330px; margin-top: 50px ;float: left;">
                                    <label style="width: 50px; line-height: 35px; float: left">排序号</label>
                                    <input type="text" class="form-control" id="save-orderNo"
                                           style="width: 250px; float: left">
                                </div>

                                <div style="width: 330px; margin-top: 50px ;float: left;">
                                    <label style="width: 80px; line-height: 35px; float: left">类型编码</label>
                                    <select class="form-control" style="width: 250px; float: left" id="save-typeCode">

                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="save_value()">保存</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </div>
    </div>
</nav>
<footer></footer>
</body>
<script>
    $(document).ready(function () {
        //使点击的菜单栏背景颜色变为蓝色
        $("#menu ul li:eq(1)").css({"background-color": "blue"});

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

        //设置条件查询中下拉列表的值
        $.ajax({
            url: "settings/dicType/getTypeList.do",
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var html = "";

                $.each(data.data, function (i, n) {
                    html += "<option value=" + n.code + ">" + n.code + "</option>";
                })

                $("#search-value-code").append(html);
            }
        })

        //显示字典值列表
        getValueList();

        //点击市场活动列表头部的复选框 头部以下的复选框都默认选中
        $("#value-list thead input[type='checkbox']").click(function () {
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#value-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#value-list tbody").on("click", $("#value-list tbody input[type='checkbox']"), function () {
            $("#value-list thead input[type='checkbox']").prop("checked", $("#value-list tbody input[type='checkbox']").length == $("#value-list tbody input[type='checkbox']:checked").length);
        })
    })

    //获取字典值的列表
    function getValueList() {
        //将隐藏域中的值赋到下拉框中
        $("#search-value-code").val($("#hidden-search-code").val());
        $("#value-list thead input[type='checkbox']").prop('checked', false);

        //发送ajax请求 拿到字典值列表
        $.ajax({
            url: "settings/dicValue/getValueByCondition.do",
            data: {
                "code": $("#search-value-code").val()
            },
            type: "get",
            dataType: "json",
            success: function (data) {
                var html = "";
                var order = 1;

                $.each(data.data, function (i, n) {
                    html += "<tr> <td> <input type='checkbox' value='" + n.id + "'/> </td> <td>" + order + "</td> <td>" + n.value + "</td> <td>" + n.text + "</td> <td>" + n.orderNo + "</td> <td>" + n.typeCode + "</td> </tr>";
                    order += 1;
                })

                $("#value-list tbody").html(html);
            }
        })
    }

    //点击查询时触发
    function search() {
        //将查询条件保存到隐藏域中
        $("#hidden-search-code").val($("#search-value-code").val());

        getValueList();
    }

    //拿到字典类型中的编码 作为模态窗口中字典类型编码下拉列表的值
    function getTypeCode(){
        //发送ajax请求拿到相关数据
        $.ajax({
            url: "settings/dicType/getTypeList.do",
            data: {},
            type: "get",
            dataType: "json",
            async: false,
            success: function (data) {
                var html = "";

                $.each(data.data, function (i, n) {
                    html += "<option value=" + n.code + ">" + n.code + "</option>";
                })

                $("#save-typeCode").html(html);
            }
        })
    }

    //点击添加按钮后触发
    function add() {
        //设置模态框的标题为添加
        $("#saveValueModal h4").text("添加字典值");

        //拿到下拉列表内容
        getTypeCode();

        //清空模态框中的数据
        $("#saveContent")[0].reset();
        $("#hidden-value-id").val("");

        $("#saveValueModal").modal("show");
    }

    //点击修改按钮后触发
    function upData(){
        //拿到多选框选中的对象
        var $checked = $("#value-list tbody input[type='checkbox']:checked");

        if ($checked.length == 0){
            alert("请选择要修改的记录");
        }else if ($checked.length > 1){
            alert("一次只能修改一条记录");
        }else {
            //设置模态窗口的标题为修改
            $("#saveValueModal h4").text("修改字典值")

            //拿到下拉列表值
            getTypeCode();

            //发送ajax请求 根据id拿到字典值记录 赋值到模态窗口中
            $.ajax({
                url: "settings/dicValue/getValueById.do",
                data: {
                    "id": $checked.val()
                },
                type: "get",
                dataType: "json",
                success: function (data){
                    $("#hidden-value-id").val(data.data.id);
                    $("#save-value").val(data.data.value);
                    $("#save-text").val(data.data.text);
                    $("#save-orderNo").val(data.data.orderNo);
                    $("#save-typeCode").val(data.data.typeCode);

                    $("#saveValueModal").modal("show");
                }
            })
        }
    }

    //点击删除按钮后触发
    function del(){
        var $checkedAll = $("#value-list tbody input[type='checkbox']:checked");
        if ($checkedAll.length == 0){
            alert("请选择要删除的记录");
        }else {
            if (confirm("确定要删除所选中的记录吗")){
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

                //发送ajax请求 删除所选中id的字典值
                $.ajax({
                    url: "settings/dicValue/delValueByIds.do",
                    data: {
                        "ids": param
                    },
                    type: "post",
                    dataType: "json",
                    success: function (data){
                        if (data.code == "200"){
                            getValueList();
                        }else {
                            alert(data.message);
                        }
                    }
                })

            }
        }
    }

    //点击模态框中的保存按钮后触发
    function save_value(){
        //发送ajax请求进行添加或保存操作
        $.ajax({
            url: "settings/dicValue/save.do",
            data: {
                "id": $.trim($("#hidden-value-id").val()),
                "value": $.trim($("#save-value").val()),
                "text": $.trim($("#save-text").val()),
                "orderNo": $.trim($("#save-orderNo").val()),
                "typeCode": $("#save-typeCode").val()
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    getValueList();

                    $("#saveValueModal").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }

</script>
</html>
