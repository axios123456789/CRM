<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login</title>
  <base href="<%=basePath%>">
  <script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    html {
      height: 100%;
      width: 100%;
      overflow: hidden;
      margin: 0;
      padding: 0;
      background-image: url(img/login.png);
      background-repeat: no-repeat;
      background-size: 100% 100%;
      -moz-background-size: 100% 100%;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
    }

    #loginDiv {
      width: 400px;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 400px;
      background-color: rgba(75, 81, 95, 0.3);
      box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
      border-radius: 250px;
    }


    p {
      margin-top: 30px;
      margin-left: 20px;
      color: azure;
    }

    #msg {
      color: red;
      text-align: center;
    }

    input {
      margin-left: 15px;
      border-radius: 5px;
      border-style: hidden;
      height: 30px;
      width: 140px;
      background-color: rgba(216, 191, 216, 0.5);
      outline: none;
      color: #f0edf3;
      padding-left: 10px;
    }

    .button {
      border-color: cornsilk;
      background-color: rgba(100, 149, 237, .7);
      color: aliceblue;
      border-style: hidden;
      border-radius: 5px;
      width: 100px;
      height: 31px;
      font-size: 16px;
    }
  </style>
  <style type="text/css">
    input::-ms-input-placeholder {
      text-align: center;
    }

    input::-webkit-input-placeholder {
      text-align: center;
    }
  </style>
</head>

<body>
<div id="loginDiv">
  <form action="" id="form" method="post">
    <h1 style="text-align: center;color: aliceblue;">立即登录</h1>
    <p>用户名:<input id="loginAct" type="text"></p>

    <p>密&nbsp;&nbsp;&nbsp;码:<input id="password" type="password" placeholder=""></p>
    <!--<p style="text-align: center;color: darkgray;"><a href="#">忘记密码?</a></p>-->
    <p id="msg"></p>
    <div style="text-align: center;margin-top: 30px;">
      <input type="button" class="button" value="登录">
      <!-- <input type="button" class="button" value="注册" onclick="register_click()">-->
    </div>
  </form>

  <script type="text/javascript">
    $(function () {
      //页面加载完毕后让用户文本框自动获得焦点
      $("#loginAct").focus();

      //为登录按钮绑定事件，执行登录操作
      $(".button").click(function () {
        login();
      })

      //为当前登录窗口绑定敲键盘事件
      //event：这个参数可以取得我们敲得是哪个键
      $(window).keydown(function (event) {
        //alert(event.keyCode);

        if (event.keyCode == 13) {
          login();
        }
      })
    })

    //登录的操作
    function login() {
      /*
       1.验证账号密码不能为空
       2.取得账号密码
       3.将文本中的左右空格去掉 使用$.trim(文本)
      */
      let loginAct = $.trim($("#loginAct").val());
      let password = $.trim($("#password").val());

      if (loginAct == "" || password == "") {
        $("#msg").html("账号密码不能为空");

        //如果账号密码为空，则需要及时强制终止该方法
        return false;
      }

      //去后台验证相关登录操作
      $.ajax({
        url: "settings/user/login.do",
        data: {
          "loginAct" : loginAct,
          "loginPwd" : password
        },
        type: "post",
        dataType: "json",
        success: function (data){
          if (data.code == "200"){
            window.location.href = "companyLogin/menu/workstation.jsp";
            console.log("数据",data);
          }else {
            $("#msg").html(data.message);
          }
        }
      })
    }

  </script>
</div>

</body>
</html>