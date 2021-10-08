<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/21
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>修改联系人</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
</head>
<body>
<div class="container">
    <center><h3>添加联系人页面</h3></center>
    <form action="${pageContext.request.contextPath}/updateUserServlet" method="post">
        <input type="hidden" name="userid" value="${user.userid}">
        <div class="form-group">
            <label for="username">姓名：</label>
            <input type="text" class="form-control" id="username" name="username" value="${user.username}" placeholder="请输入姓名">
        </div>
        <div class="form-group">
            <label>性别：</label>
            <c:if test="${user.usersex == '男'}">
                <input type="radio" name="usersex"  value="男" checked="checked"/>男
                <input type="radio" name="usersex"  value="女"/>女
            </c:if>
            <c:if test="${user.usersex == '女'}">
                <input type="radio" name="usersex"  value="男" />男
                <input type="radio" name="usersex"  value="女" checked="checked"/>女
            </c:if>

        </div>
        <div class="form-group">
            <label for="userage">年龄：</label>
            <input type="text" class="form-control" value="${user.userage}" id="userage" name="userage" placeholder="请输入年龄">
        </div>
        <div class="form-group">
            <label for="userlocate">籍贯：</label>
            <select name="userlocate" class="form-control" id="userlocate">
                <c:if test="${user.userlocate == '北京'}">
                <option value="北京" selected="selected">北京</option>
                <option value="天津">天津</option>
                <option value="上海">上海</option>
                <option value="陕西">陕西</option>
                <option value="深圳">深圳</option>>
                <option value="安徽">安徽</option>
            </c:if>
                <c:if test="${user.userlocate == '天津'}">
                    <option value="北京">北京</option>
                    <option value="天津" selected="selected">天津</option>
                    <option value="上海">上海</option>
                    <option value="陕西">陕西</option>
                    <option value="深圳">深圳</option>>
                    <option value="安徽">安徽</option>
                </c:if>
                <c:if test="${user.userlocate == '上海'}">
                    <option value="北京">北京</option>
                    <option value="天津">天津</option>
                    <option value="上海" selected="selected">上海</option>
                    <option value="陕西">陕西</option>
                    <option value="深圳">深圳</option>>
                    <option value="安徽">安徽</option>
                </c:if>
                <c:if test="${user.userlocate == '陕西'}">
                    <option value="北京">北京</option>
                    <option value="天津">天津</option>
                    <option value="上海">上海</option>
                    <option value="陕西" selected="selected">陕西</option>
                    <option value="深圳">深圳</option>>
                    <option value="安徽">安徽</option>
                </c:if>
                <c:if test="${user.userlocate == '深圳'}">
                    <option value="北京">北京</option>
                    <option value="天津">天津</option>
                    <option value="上海">上海</option>
                    <option value="陕西">陕西</option>
                    <option value="深圳" selected="selected">深圳</option>>
                    <option value="安徽">安徽</option>
                </c:if>
                <c:if test="${user.userlocate == '安徽'}">
                    <option value="北京" >北京</option>
                    <option value="天津">天津</option>
                    <option value="上海">上海</option>
                    <option value="陕西">陕西</option>
                    <option value="深圳">深圳</option>>
                    <option value="安徽" selected="selected">安徽</option>
                </c:if>
            </select>
        </div>
        <div class="form-group">
            <label for="qq">qq：</label>
            <input type="text" class="form-control" id="qq" value="${user.qq}" readonly="readonly" name="qq" placeholder="请输入qq">
        </div>
        <div class="form-group">
            <label for="emil">邮箱：</label>
            <input type="text" class="form-control" id="emil" value="${user.emil}" name="emil" placeholder="请输入qq">
        </div>
        <div>
            <input type="submit" class="btn btn-primary" value="提交">
            <input type="reset" class="btn btn-default" value="重置">
            <input type="button" class="btn btn-default" value="返回">
        </div>
    </form>

</div>
</body>
</html>

