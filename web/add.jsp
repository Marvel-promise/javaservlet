<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/20
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>用户信息添加</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
    <script>
        function check() {
            var username = document.getElementById("username");
            if(username == null){
                username.innerHTML="用户名不能为空";
            }
            var userage = document.getElementById("userage");
            if (userage == null){
                userage.innerHTML="用户年龄不能为空";
            }
            var qq = document.getElementById("qq");
            if (qq == null){
                qq.innerHTML="用户年龄不能为空";
            }
            var emil = document.getElementById("emil");
            if (emil == null){
                emil.innerHTML="用户年龄不能为空";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <center><h3>添加联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/addUserServlet" method="post">
        <div class="form-group">
            <label for="username">姓名：</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="请输入姓名">
        </div>
        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="usersex"  value="男" checked="checked"/>男
            <input type="radio" name="usersex"  value="女"/>女

        </div>
        <div class="form-group">
            <label for="userage">年龄：</label>
            <input type="text" class="form-control" id="userage" name="userage" placeholder="请输入年龄">
        </div>
        <div class="form-group">
            <label for="userlocate">籍贯：</label>
            <select name="userlocate" class="form-control" id="userlocate">
                <option value="北京">北京</option>
                <option value="天津">天津</option>
                <option value="上海">上海</option>
                <option value="陕西">陕西</option>
                <option value="深圳">深圳</option>
                <option value="安徽">安徽</option>

            </select>
        </div>
        <div class="form-group">
            <label for="qq">qq：</label>
            <input type="text" class="form-control" id="qq" name="qq" placeholder="请输入qq">
        </div>
        <div class="form-group">
            <label for="emil">邮箱：</label>
            <input type="text" class="form-control" id="emil" name="emil" placeholder="请输入qq">
        </div>
        <div>
            <input type="submit" class="btn btn-primary" onclick="check()" value="提交">
            <input type="reset" class="btn btn-default" value="重置">
            <input type="button" class="btn btn-default" value="返回">
        </div>
    </form>

</div>
</body>
</html>
