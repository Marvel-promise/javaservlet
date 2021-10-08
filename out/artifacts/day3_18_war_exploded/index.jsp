<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/18
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
  </head>
  <body>
  <div><h2>${user.username}</h2></div>
  <a href="${pageContext.request.contextPath}/findByPageServlet?" style="" align="center"><h1> 查询所有用户信息</h1></a>

  </body>
</html>
