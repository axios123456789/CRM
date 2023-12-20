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
    <title>详情</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/work.css"/>
    <script src="js/jquery-1.9.1.min.js"></script>

    <link rel="stylesheet" type="text/css" href="plug-ins/bootstrap-3.4.1-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="plug-ins/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

    <%-- layui中的日期时间js   --%>
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
        <div style="width: 1290px; float: left">
            <div style="width: 1290px; height: 60px; float: left; border-bottom: 1px solid #b2b2b2">
                <a class="myHref" href="javascript:void(0)" onclick="back()" style="float: left; width: 50px; height: 50px; margin-top: 10px"><img src="img/return-left.png"></a>
                <h3 style="line-height: 10px; float: left">市场活动-${activity.name}</h3>
                <h5 style="line-height: 40px; float: left">&nbsp;&nbsp;${activity.startDate}-${activity.endDate}</h5>
                <div style="width: 400px; margin-top: 10px; float: right">
                    <button type="button" class="btn btn-default" style="float: left" onclick="edit_activity()"><img src="img/pencil-fill.svg" />修改</button>
                    <button type="button" class="btn btn-danger" style="float: left; margin-left: 10px" onclick="del_activity()"><img src="img/delete.png" style="width: 20px;"/>删除</button>
                </div>
            </div>

            <%--      详细信息      --%>
            <div style="width: 1290px; float: left; margin-top: 30px;">
                <div style="width: 1290px; height: 40px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2">所有者</div>
                    <div style="width: 250px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.owner}</b></div>
                    <div style="width: 250px; height: 20px; margin-top: 20px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">名称</div>
                    <div style="width: 250px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.name}</b></div>
                </div>
                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">开始日期</div>
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.startDate}</b></div>
                    <div style="width: 250px; height: 20px; margin-top: 30px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">结束日期</div>
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.endDate}</b></div>
                </div>
                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">成本</div>
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.cost}</b></div>
                </div>
                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">创建者</div>
                    <div style="width: 400px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.createBy}</b><span style="font-size: 10px">&nbsp;&nbsp;${activity.createTime}</span></div>
                </div>
                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">修改者</div>
                    <div style="width: 400px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.editBy}</b><span style="font-size: 10px">&nbsp;&nbsp;${activity.editTime}</span></div>
                </div>
                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 250px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">描述</div>
                    <div style="width: 800px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${activity.description}</b></div>
                </div>
            </div>

            <%--     备注       --%>
            <div style="width: 1290px; float: left; margin-top: 100px;">
                <h4>备注</h4>
                <%--       显示/修改/删除备注         --%>
                <div id="remarkDiv" style="width: 1290px; float: left; margin-top: 20px">
                    <%--<div style="width: 700px; height: 80px; margin-bottom: 20px; float: left;">
                        <img src="img/remark.png" style="width: 50px; height: 50px; margin-top: 10px; float: left">
                        <b style="width: 570px; height: 50px; margin-top: 10px;float: left;">ok开始</b>
                        <div style="width: 80px; height: 50px; margin-top: 10px; float: left;">
                            <img src="img/remark_edit.jpg" style="width: 20px; height: 20px; margin-top: 20px; float: left">
                            <img src="img/remark_delete.webp" style="width: 20px; height: 20px; margin-top: 20px; margin-left: 20px; float: left">
                        </div>
                        <div style="width: 650px; height: 20px; margin-left: 50px; float: left;">
                            市场活动-<b>发传单</b>&nbsp;&nbsp;time由name
                        </div>
                    </div>--%>
                </div>

                <%--       添加备注         --%>
                <div id="remark-add" style="width: 900px; height: 200px; float: left; border:10px solid #b2b2b2">
                    <textarea class="form-control" rows="6" placeholder="添加备注"></textarea>
                    <button type="button" class="btn btn-primary" style="float: right" onclick="add()">发表评论</button>
                </div>
            </div>

            <%--    点击备注中的修改按钮时打开的模态窗口        --%>
            <div class="modal fade" tabindex="-1" role="dialog" id="edit-remark">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 500px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">修改备注</h4>
                        </div>
                        <div class="modal-body">
                            <%--      隐藏框 用来保存修改时要被修改备注的id                  --%>
                            <input type="hidden" id="hidden-remark-id">

                            <div style="height: 150px; width: 500px" id="edit-noteContent">
                                <label style="width: 40px; float: left">内容:</label>
                                <textarea class="form-control" rows="6" style="width: 420px;float: left"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="remark_save()">确定</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%--     点击右上角上的修改按钮时 （即修改详细信息） 打开的模态窗口      --%>
            <div class="modal fade" tabindex="-1" role="dialog" id="edit-activity">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">修改市场活动详细信息</h4>
                        </div>
                        <div class="modal-body" style="height: 300px">
                            <div style="width: 400px; height: 40px; float: left">
                                <label style="width: 80px; line-height: 40px; float: left">所有者<span style="color: red">*</span></label>
                                <select class="form-control" id="edit-owner" style="width: 200px; float: left">

                                </select>
                            </div>

                            <div style="width: 350px; height: 40px; float: left;">
                                <label style="width: 80px; line-height: 40px; float: left">名称<span style="color: red">*</span></label>
                                <input type="text" class="form-control" id="edit-name" style="width: 200px; float: left" />
                            </div>

                            <div style="width: 400px; height: 40px; float: left; margin-top: 20px">
                                <label style="width: 80px; line-height: 30px; float: left">开始日期</label>
                                <input type="text" class="form-control" id="edit-startDate" style="width: 200px; float: left" readonly />
                            </div>

                            <div style="width: 350px; height: 40px; float: left; margin-top: 20px;">
                                <label style="width: 80px; line-height: 30px; float: left">结束日期</label>
                                <input type="text" class="form-control" id="edit-endDate" style="width: 200px; float: left" readonly />
                            </div>

                            <div style="width: 750px; height: 40px; float: left; margin-top: 20px">
                                <label style="width: 80px; line-height: 40px; float: left">成本</label>
                                <input type="text" class="form-control" id="edit-cost" style="width: 200px; float: left" />
                            </div>

                            <div style="width: 750px; height: 150px; float: left; margin-top: 20px;">
                                <label style="width: 80px;  float: left">描述</label>
                                <textarea class="form-control" rows="3" id="edit-description" style="width: 670px; float: left"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="activity_save()">确定</button>
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
    //时间选择器
    laydate.render({
        elem: '#edit-startDate'
    })
    laydate.render({
        elem: '#edit-endDate'
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

        //显示备注信息
        showRemarkList();
        hoverRun()
        //为修改和删除按钮绑定点击事件
        /*$("#remarkDiv div").find("div").find("img:eq(0)").click(function (){
            alert("修改")
        })
        $("#remarkDiv div").find("div").find("img:eq(1)").click(function (){
            alert("删除")
        })*/

    })

    //返回上一张页面
    function back(){
        window.history.back();
    }

    //实现鼠标移动到备注区域时修改删除按钮显示 移出时隐藏的动画效果
    function hoverRun(){
        //鼠标移动到备注区域时修改删除按钮显示 移出时隐藏
        $("#remarkDiv div div img").hide();
        $("#remarkDiv div").hover(
            function(){
                $(this).find("div").find("img").show()
            },
            function(){
                $(this).find("div").find("img").hide()
            }
        );
    }

    //查询市场活动备注信息
    function showRemarkList(){
        //发送ajax请求查询备注信息
        $.ajax({
            url: "workbench/activityRemark/getRemarkByAid.do",
            data: {
                "id" : "${activity.id}"
            },
            type: "get",
            dataType: "json",
            async: false,
            success: function (data){
                var html = "";

                $.each(data.data, function (i, n){
                   html += '<div style="width: 700px; height: 80px; margin-bottom: 20px; float: left;">';
                   html += '<img src="img/remark.png" style="width: 50px; height: 50px; margin-top: 10px; float: left">';
                   html += '<b style="width: 570px; height: 50px; margin-top: 10px;float: left;">'+n.noteContent+'</b>';
                   html += '<div style="width: 80px; height: 50px; margin-top: 10px; float: left;">';
                   html += '<a class="myHref" href="javascript:void(0)" onclick="upData(\''+n.id+'\')"><img src="img/remark_edit.jpg" style="width: 20px; height: 20px; margin-top: 20px; float: left"></a>';
                   html += '<a class="myHref" href="javascript:void(0)" onclick="del_remark(\''+n.id+'\')"><img src="img/remark_delete.webp" style="width: 20px; height: 20px; margin-top: 20px; margin-left: 20px; float: left"></a>';
                   html += '</div>';
                   html += '<div style="width: 650px; height: 20px; margin-left: 50px; float: left;">';
                   html += '市场活动-<b>${activity.name}</b>&nbsp;&nbsp;'+(n.editFlag==0?n.createTime:n.editTime)+'由'+(n.editFlag==0?n.createBy:n.editBy)+''+(n.editFlag==0?'创建':'修改')+'';
                   html += '</div>';
                   html += '</div>';
                });

                $("#remarkDiv").html(html);
                //$("#remarkDiv").html("<div style='width: 1290px; height: 400px; float: left; background-color: red'></div>")
            }
        })
    }

    //添加备注信息
    function add(){
        var noteContent = $("#remark-add textarea").val();
        if (noteContent != null && noteContent != ""){
            //发送ajax请求 执行添加操作
            $.ajax({
                url: "workbench/activityRemark/save.do",
                data: {
                    "noteContent": noteContent,
                    "activityId": "${activity.id}"
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        showRemarkList();
                        hoverRun();

                        //将文本域中的文本清空
                        $("#remark-add textarea").val("");
                    }else {
                        alert(data.message);
                    }
                }
            })
        }else {
            alert("请填上备注信息！");
        }
    }

    //修改备注信息
    function upData(id){
        // //打开模态窗口前先将模态窗口中的内容清空
        // $("#edit-noteContent textarea").val("");
        // $("#hidden-remark-id").val("");

        //发送ajax请求 拿到要修改的备注的原来备注信息
        $.ajax({
            url: "workbench/activityRemark/getRemarkById.do",
            data: {
                "id": id
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-noteContent textarea").val(data.data.noteContent);
                $("#hidden-remark-id").val(data.data.id);

                //打开模态窗口
                $("#edit-remark").modal("show");
            }
        })
    }

    //删除备注信息
    function del_remark(id){
        if (confirm("确定删除这条评论吗？")){
            //发送ajax请求执行删除备注操作
            $.ajax({
                url: "workbench/activityRemark/delete.do",
                data: {
                    "id": id
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        showRemarkList();
                        hoverRun();
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }

    //点击修改备注信息模态窗口中的确认按钮后触发
    function remark_save(){
        //发送ajax请求 保存修改内容
        $.ajax({
            url: "workbench/activityRemark/save.do",
            data: {
                "id": $.trim($("#hidden-remark-id").val()),
                "noteContent": $.trim($("#edit-noteContent textarea").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    showRemarkList();
                    hoverRun();

                    //关闭模态窗口
                    $("#edit-remark").modal("hide");
                }else {
                    alert(data.message);
                }
            }
        })
    }

    //拿到user的名字数据 作为下拉列表的值
    function getUserData(){
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

                $("#edit-owner").html(html);
            }
        })
    }

    //修改详细信息
    function edit_activity(){
        //打开模态窗口前 设置下拉框中的可选值
        getUserData();

        //发送ajax请求将详细信息的各值赋进模态窗口中的对应文本中
        $.ajax({
            url : "workbench/activity/getActivityById.do",
            data: {
                "id" : '${activity.id}'
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-owner").val(data.data.owner);
                $("#edit-name").val(data.data.name);
                $("#edit-startDate").val(data.data.startDate);
                $("#edit-endDate").val(data.data.endDate);
                $("#edit-cost").val(data.data.cost);
                $("#edit-description").val(data.data.description);
            }
        })

        $("#edit-activity").modal("show");
    }

    //删除详细信息
    function del_activity(){
        if (confirm("确定删除该市场活动的所有数据？")){
            var param = "";
            param += '${activity.id}';
            //发送ajax请求 执行删除操作
            $.ajax({
                url: "workbench/activity/del.do",
                data: {
                    "ids": param
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        window.location.href = "companyLogin/menu/marketActivity.jsp";
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }

    //点击详细信息修改模态窗口中的确定后触发
    function activity_save(){
        //点击确认后发送ajax请求进行修改操作
        $.ajax({
            url: "workbench/activity/save.do",
            data: {
                "id" : '${activity.id}',
                "owner" : $.trim($("#edit-owner").val()),
                "name" : $.trim($("#edit-name").val()),
                "startDate" : $.trim($("#edit-startDate").val()),
                "endDate" : $.trim($("#edit-endDate").val()),
                "cost" : $.trim($("#edit-cost").val()),
                "description" : $.trim($("#edit-description").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){//修改成功
                    //关闭模态窗口
                    $("#edit-activity").modal("hide");

                    //刷新当前页面
                    window.location.reload();
                }else {//修改失败
                    alert(data.message);
                }
            }
        })
    }
</script>
</html>
