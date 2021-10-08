<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/19
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>登录页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        div{
                margin: 5px;
                padding: 5px;

        }
    </style>
    <script type="text/javascript">
       //切换验证码
        function refreshCode() {
            //获得验证码图片对象
            var vcode = document.getElementById("vcode");
            vcode.src="${pageContext.request.contextPath}/checkCodeServlet?time="+ new Date().getTime();

        }
    </script>
</head>
<body>
<div>
    <div align=center>
        <h1>管理员用户登录</h1>
    </div>
    <div align="center">
        <form method="post" action="${pageContext.request.contextPath}/loginServlet">
            <div>
            <strong>
                QQ号：
            </strong>
            <input type="text" name="qq" placeholder="请输入qq号" style="width: 200px;height: 40px">
            <div>
                <strong>密码 &nbsp;：</strong>
            <input type ="password" name="password" placeholder="请输入密码" style="width: 200px;height: 40px">
            </div>
            <div>
                <strong>
                <span>
                    验证码：<input type="text" name="check" placeholder="请输入验证码"style="width: 75px;height: 40px"></span>
                <span style="margin: 5px;padding: 5px;" ><a href="javascript:refreshCode()">
                    <img src="${pageContext.request.contextPath}/checkCodeServlet" title="看不清换一张" id="vcode">
                </a></span>
            </strong>
            </div>
        </div>
            <input type="submit" value="登录" align="center">
        </form>
    </div>
    <div align="center">
        <span style="background: #f5e79e; width: 300px;height: 200px">
            ${login_msg}
        </span>
    </div>
</div>
</body>
</html>
