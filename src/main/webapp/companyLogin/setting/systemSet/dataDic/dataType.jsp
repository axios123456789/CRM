<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/9/21
  Time: 19:04
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
    <title>字典类型</title>
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
                <li><a href="companyLogin/setting/personInformation.jsp"><span class="glyphicon glyphicon-file"></span>&nbsp;我的资料</a></li>
                <li><a href="companyLogin/setting/pwdEdit.jsp"><span class="glyphicon glyphicon-edit"></span>&nbsp;修改密码</a></li>
                <li><a href="settings/user/outLogin.do"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
            </ul>
        </div>
    </div>
</header>
<nav>
    <%--  菜单栏  --%>
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
        <h3>字典类型列表</h3><br /><br />
        <div style="width: 1290px; float:left;">
            <%--    增删改按钮组        --%>
            <div style="width: 1290px; float: left;">
                <button type="button" class="btn btn-primary" onclick="add()"><img src="img/add.png" style="width: 20px;"/>创建</button>
                <button type="button" class="btn btn-default" onclick="upData()"><img src="img/pencil-fill.svg" />修改</button>
                <button type="button" class="btn btn-danger" onclick="del()"><img src="img/delete.png" style="width: 20px;"/>删除</button>
            </div>

            <%--     列表       --%>
            <div style="width: 1290px; float: left; margin-top: 30px" id="type-list">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th> <input type="checkbox" /> </th>
                            <th>序号</th>
                            <th>编码</th>
                            <th>名称</th>
                            <th>描述</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>

            <%--     增改模态窗口       --%>
            <div class="modal fade" id="saveModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 700px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"></h4>
                        </div>
                        <div class="modal-body" style="height: 300px">
                            <form id="saveContent">
                                <div style="width: 330px; float: left;">
                                    <label style="width: 50px; line-height: 35px; float: left">编码<span style="color: red">*</span></label>
                                    <input type="text" class="form-control" id="save-code" style="width: 250px; float: left">
                                </div>

                                <div style="width: 330px; float: left;">
                                    <label style="width: 50px; line-height: 35px; float: left">名字</label>
                                    <input type="text" class="form-control" id="save-name" style="width: 250px; float: left">
                                </div>

                                <div style="width: 650px; margin-top: 20px; float: left">
                                    <label style="width: 50px; ; float: left">描述</label>
                                    <textarea class="form-control" id="save-description" rows="3" style="width: 580px; height: 200px;float: left"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="save()">保存</button>
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
    $(document).ready(function (){
        //使点击的菜单栏背景颜色变为蓝色
        $("#menu ul li:eq(0)").css({"background-color": "blue"});

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

        //显示字典类型列表
        getTypeList();

        //点击市场活动列表头部的复选框 头部以下的复选框都默认选中
        $("#type-list thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#type-list tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#type-list tbody").on("click", $("#type-list tbody input[type='checkbox']"), function (){
            $("#type-list thead input[type='checkbox']").prop("checked", $("#type-list tbody input[type='checkbox']").length == $("#type-list tbody input[type='checkbox']:checked").length);
        })

    })

    //查询字典类型列表
    function getTypeList(){
        //发送ajax请求，查询字典类型列表
        $.ajax({
            url: "settings/dicType/getTypeList.do",
            data: {

            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";
                var order = 1;

                $.each(data.data, function (i, n){
                    html += "<tr> <td> <input type='checkbox' value='"+n.code+"'/> </td> <td>"+order+"</td> <td>"+n.code+"</td> <td>"+n.name+"</td> <td>"+n.description+"</td> </tr>";
                    order += 1;
                })

                $("#type-list tbody").html(html);
            }
        })
    }

    //点击添加按钮后触发
    function add(){
        //将模态框的标题设为添加
        $("#saveModal h4").text("添加字典类型");

        //将模态框中的数据清空
        $("#saveContent")[0].reset();

        //解除code文本框禁用状态
        $("#save-code").prop("disabled", false);

        //打开模态窗口
        $("#saveModal").modal("show");
    }

    //点击修改按钮后触发
    function upData(){
        //将模态框的标题设为修改
        $("#saveModal h4").text("修改字典类型");

        //获取选择复选框对象
        var $checked = $("#type-list tbody input[type='checkbox']:checked");

        if ($checked.length == 0){
            alert("请选择要修改的记录");
        }else if ($checked.length > 1){
            alert("一次只能修改一条记录");
        }else {
            var pCode = $checked.val();
            //发送ajax请求 获取选择复选框的对象
            $.ajax({
                url: "settings/dicType/getTypeByCode.do",
                data: {
                    "code": pCode
                },
                type: "get",
                dataType: "json",
                success: function (data){
                    $("#save-code").val(data.data.code);
                    $("#save-name").val(data.data.name);
                    $("#save-description").val(data.data.description);
                    $("#save-code").prop("disabled", true);

                    //打开模态窗口
                    $("#saveModal").modal("show");
                }
            })
        }
    }

    //点击删除按钮时触发
    function del(){
        var $checkedAll = $("#type-list tbody input[type='checkbox']:checked");
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

                //console.log("param",param);
                //发送ajax请求 删除所选中对象
                $.ajax({
                    url: "settings/dicType/delTypeByIds.do",
                    data: {
                        "codes": param
                    },
                    type: "post",
                    dataType: "json",
                    success: function (data){
                        if (data.code == "200"){
                            getTypeList();
                        }else {
                            alert(data.message);
                        }
                    }
                })
            }
        }
    }

    //点击模态窗口中的保存按钮后触发
    function save(){
        //发送ajax请求 进行添加或修改操作
        $.ajax({
            url: "settings/dicType/save.do",
            data: {
                "code": $.trim($("#save-code").val()),
                "name": $.trim($("#save-name").val()),
                "description": $.trim($("#save-description").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    getTypeList();

                    //关闭模态窗口
                    $("#saveModal").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }
</script>
</html>
