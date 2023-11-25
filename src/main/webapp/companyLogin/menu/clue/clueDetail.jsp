<%--
  Created by IntelliJ IDEA.
  User: 20183
  Date: 2023/10/8
  Time: 17:38
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
    <title>线索详细信息</title>
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
        <div style="width: 1290px; float: left">
            <div style="width: 100%; height: 70px; float: left; margin-bottom: 10px; border-bottom: 1px solid #b2b2b2">
                <a href="companyLogin/menu/clue.jsp" style="margin-top: 18px; margin-right: 15px; float: left"><img src="img/return-left.png"></a>
                <h2 style="float: left">${clue.name}${clue.salutation}</h2>
                <h4 style="float: left; line-height: 60px; margin-left: 10px">${clue.company}</h4>
                <button type="button" style="float: right; margin-right: 300px;margin-top: 10px; width: 80px; height: 40px" onclick="conversion()"><span class=" glyphicon glyphicon-retweet" style="float: left; margin-left: 10px"></span>转换</button>
            </div>

            <%--     详细信息       --%>
            <div style="width: 100%; float: left; margin-left: 20px; margin-top: 80px">
                <div style="width: 1290px; height: 40px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2">名称</div>
                    <div style="width: 300px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.name}</b></div>
                    <div style="width: 200px; height: 20px; margin-top: 20px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">所有者</div>
                    <div style="width: 300px; height: 20px; margin-top: 20px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.owner}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">公司</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.company}</b></div>
                    <div style="width: 200px; height: 20px; margin-top: 30px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">职位</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.position}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">邮箱</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.email}</b></div>
                    <div style="width: 200px; height: 20px; margin-top: 30px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">公司座机</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.companyExtension}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">公司网站</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.companyWebsite}</b></div>
                    <div style="width: 200px; height: 20px; margin-top: 30px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">手机</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.phone}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">线索状态</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.clueStatus}</b></div>
                    <div style="width: 200px; height: 20px; margin-top: 30px; margin-left: 50px; float: left; border-bottom: 2px solid #b2b2b2">线索来源</div>
                    <div style="width: 300px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.clueSource}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">创建者</div>
                    <div style="width: 450px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.createBy}</b><span style="font-size: 10px">&nbsp;&nbsp;${clue.createTime}</span></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">修改者</div>
                    <div style="width: 450px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.editBy}</b><span style="font-size: 10px">&nbsp;&nbsp;${clue.editTime}</span></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">描述</div>
                    <div style="width: 850px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.description}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">联系纪要</div>
                    <div style="width: 850px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.contactMinute}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">下次联系时间</div>
                    <div style="width: 350px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.nextContactTime}</b></div>
                </div>

                <div style="width: 1290px; height: 50px; float: left;">
                    <div style="width: 200px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2">详细地址</div>
                    <div style="width: 850px; height: 20px; margin-top: 30px; float: left; border-bottom: 2px solid #b2b2b2"><b>${clue.detailAddress}</b></div>
                </div>
            </div>

            <%--    备注        --%>
            <div style="width: 100%; float: left; margin-left: 20px; margin-top: 100px;">
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
                    <button type="button" class="btn btn-primary" style="float: right" onclick="add()">添加</button>
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

            <%--   关联市场活动         --%>
            <div style="width: 100%; float: left; margin-top: 80px; margin-bottom: 100px; margin-left: 20px">
                <h4>市场活动</h4>
                <table class="table table-hover" style="margin-top: 50px" id="t-activity">
                    <thead>
                        <tr>
                            <td>名称</td>
                            <td>开始日期</td>
                            <td>结束日期</td>
                            <td>所有者</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%--<tr>
                            <th>1</th>
                            <th>12</th>
                            <th>1</th>
                            <th>12</th>
                        </tr>--%>
                    </tbody>
                </table>
                <a class='myHref' href='javascript:void(0)' onclick="add_relation()" style="font-size: 17px;"><b><span class="glyphicon glyphicon-plus"></span>关联市场活动</b></a>
            </div>

            <%--    点击关联市场活动后弹出该模态窗口        --%>
            <div class="modal fade" tabindex="-1" role="dialog" id="relation-activity">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 800px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">关联市场活动</h4>
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
                                    <td><input type="checkbox"/></td>
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

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="relation()">关联</button>
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

        //点击市场活动列表头部的复选框 头部以下的复选框都默认选中
        $("#activityTable thead input[type='checkbox']").click(function (){
            /*if (this.checked) {
                $("#activity-list tbody input[type='checkbox']").prop('checked', true);
                //$("#activity-list tbody input[type='checkbox']").prop('disabled', false);
            }else {
                $("#activity-list tbody input[type='checkbox']").prop('checked', false);
            }*/
            $("#activityTable tbody input[type='checkbox']").prop('checked', this.checked);
        });

        //头部以下的复选框全选了，则头部的复选框也选上 头部以下的复选框没全选，则头部的复选框不选
        //通过动态生成元素来实现
        /*动态生成的元素， 以on方法的形式来触发事件
            语法：
                $(需要绑定元素的有效的外层元素).on(绑定事件的方式，需要绑定的元素的jQuery对象，回调函数)
        */
        $("#activityTable tbody").on("click", $("#activityTable tbody input[type='checkbox']"), function (){
            $("#activityTable thead input[type='checkbox']").prop("checked", $("#activityTable tbody input[type='checkbox']").length == $("#activityTable tbody input[type='checkbox']:checked").length);
        })

        getClueRemark();
        hoverRun();
        getActivityListByClueId();
    })

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

    //查询线索备注
    function getClueRemark(){
        //发送Ajax请求，查询线索备注信息
        $.ajax({
            url: "workbench/clueRemark/getClueRemark.do",
            data: {
                id: "${clue.id}"
            },
            type: "get",
            dataType: "json",
            async: false,
            success: function (data){
                var html = '';

                $.each(data.data, function (i, n){
                    html += '<div style="width: 700px; height: 80px; margin-bottom: 20px; float: left;">';
                    html += '<img src="img/remark.png" style="width: 50px; height: 50px; margin-top: 10px; float: left">';
                    html += '<b style="width: 570px; height: 50px; margin-top: 10px;float: left;">'+n.noteContent+'</b>';
                    html += '<div style="width: 80px; height: 50px; margin-top: 10px; float: left;">';
                    html += '<a class="myHref" href="javascript:void(0)" onclick="upDate(\''+n.id+'\')"><img src="img/remark_edit.jpg" style="width: 20px; height: 20px; margin-top: 20px; float: left"></a>';
                    html += '<a class="myHref" href="javascript:void(0)" onclick="del_remark(\''+n.id+'\')"><img src="img/remark_delete.webp" style="width: 20px; height: 20px; margin-top: 20px; margin-left: 20px; float: left"></a>';
                    html += '</div>';
                    html += '<div style="width: 650px; height: 20px; margin-left: 50px; float: left;">';
                    html += '线索-<b>${clue.name}${clue.salutation}-${clue.company}</b>&nbsp;&nbsp;'+(n.editFlag==0?n.createTime:n.editTime)+'由'+(n.editFlag==0?n.createBy:n.editBy)+''+(n.editFlag==0?'创建':'修改')+'';
                    html += '</div>';
                    html += '</div>';
                });

                $("#remarkDiv").html(html);
            }
        })
    }

    //添加备注
    function add(){
        let $add = $("#remark-add textarea").val();

        if ($add == null || $add == ''){
            alert("请填写备注信息！");
        }else{
            //发送Ajax请求， 执行添加备注操作
            $.ajax({
                url: "workbench/clueRemark/save.do",
                data: {
                    noteContent: $add,
                    clueId: "${clue.id}"
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        getClueRemark()
                        hoverRun()

                        //清空添加备注的文本域
                        $("#remark-add textarea").val("");
                    }else {
                        alert(data.message)
                    }
                }
            })
        }
    }

    //修改备注
    function upDate(id){
        //发送Ajax请求，根据id拿到要修改的备注信息
        $.ajax({
            url: "workbench/clueRemark/getClueRemarkById.do",
            data: {
                id: id
            },
            type: "get",
            dataType: "json",
            success: function (data){
                $("#edit-noteContent textarea").val(data.data.noteContent);
                $("#hidden-remark-id").val(data.data.id);

                $("#edit-remark").modal("show");
            }
        })
    }

    //删除备注
    function del_remark(id){
        if (confirm("确定要删除这个备注吗？")){
            //发送Ajax请求，删除备注信息
            $.ajax({
                url: "workbench/clueRemark/del.do",
                data: {
                   id: id
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        getClueRemark();
                        hoverRun();
                    }else{
                        alert(data.message)
                    }
                }
            })
        }
    }

    //点击修改模态窗口中的确认按钮后触发
    function remark_save(){
        //发送Ajax请求，修改备注
        $.ajax({
            url: "workbench/clueRemark/save.do",
            data: {
                id: $.trim($("#hidden-remark-id").val()),
                noteContent: $.trim($("#edit-noteContent textarea").val())
            },
            type: "post",
            dataType: "json",
            success: function (data){
                if (data.code == "200"){
                    getClueRemark();
                    hoverRun();

                    //关闭模态窗口
                    $("#edit-remark").modal("hide");
                }else{
                    alert(data.message);
                }
            }
        })
    }

    //根据线索id查询与之关联的市场活动
    function getActivityListByClueId(){
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
                    html += "<tr><th>"+n.name+"</th><th>"+n.startDate+"</th><th>"+n.endDate+"</th><th>"+n.owner+"</th><th><a class='myHref' href='javascript:void(0)' onclick='del_relation(\""+n.id+"\")'><span class='glyphicon glyphicon-remove'></span>解除关联</a></th></tr>";
                });

                $("#t-activity tbody").html(html);
            }
        })
    }

    //添加线索与市场活动的关联
    function add_relation(){
        //初始化工作
        $("#activityTable thead input[type='checkbox']").prop('checked', false);
        $(".btn-group input").val("");

        //发送Ajax请求，拿到没有被关联的市场活动信息列表
        $.ajax({
            url: "workbench/clueRemark/getNotBeRelationActivityByClueId.do",
            data: {
                clueId: "${clue.id}"
            },
            type: "get",
            dataType: "json",
            success: function (data){
                //console.log("数据",data.data)
                var html = "";

                $.each(data.data, function (i,n){
                   html += "<tr><td><input type='checkbox' value="+n.id+" /></td><td>"+n.name+"</td><td>"+n.startDate+"</td><td>"+n.endDate+"</td><td>"+n.owner+"</td></tr>"
                });

                $("#activityTable tbody").html(html);

                //打开模态窗口
                $("#relation-activity").modal("show");
            }
        })
    }

    //光标到搜索框后，触发键盘弹起事件
    $(".btn-group input").keyup(function (){
        //console.log($(".btn-group input").val())
        //每次敲击键盘，就发送Ajax请求，对文本框中的内容进行模糊查询
        $.ajax({
            url: "workbench/activity/getActivityListByName.do",
            data: {
                name: $.trim($(".btn-group input").val())
            },
            type: "get",
            dataType: "json",
            success: function (data){
                var html = "";

                $.each(data.data, function (i,n){
                    html += "<tr><td><input type='checkbox' value="+n.id+" /></td><td>"+n.name+"</td><td>"+n.startDate+"</td><td>"+n.endDate+"</td><td>"+n.owner+"</td></tr>"
                });

                $("#activityTable tbody").html(html);
            }
        })
    })

    //删除线索与市场活动的关联
    function del_relation(id){
        if (confirm("确定解除关联吗？")){
            //发送Ajax请求，解除关联
            $.ajax({
                url: "workbench/clueRemark/delRelation.do",
                data: {
                    clueId: "${clue.id}",
                    activityId: id
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        getActivityListByClueId();
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }

    //点击关联线索与市场活动的模态窗口中的关联按钮后触发
    function relation(){
        let $checkedAll = $("#activityTable tbody input[type='checkbox']:checked");
        if ($checkedAll.length == 0){
            alert("请选择要关联的市场活动")
        } else {
            let activityId = "";

            for (let i = 0; i < $checkedAll.length; i++) {
                activityId += $($checkedAll[i]).val();

                if (i < $checkedAll.length - 1){
                    activityId += ",";
                }
            }

            //console.log(activityId)
            //发送Ajax请求，关联市场活动
            $.ajax({
                url: "workbench/clueRemark/relationActivity.do",
                data: {
                    clueId: "${clue.id}",
                    activityId: activityId
                },
                type: "post",
                dataType: "json",
                success: function (data){
                    if (data.code == "200"){
                        getActivityListByClueId();

                        //关闭模态窗口
                        $("#relation-activity").modal("hide");
                    }else {
                        alert(data.message);
                    }
                }
            })
        }
    }

    //点击转换按钮后触发该事件
    function conversion(){
        window.location.href = "companyLogin/menu/clue/clueDetail/conversion.jsp";
    }
</script>
</html>
