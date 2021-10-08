<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/19
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>用户信息管理系统</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .table_head{
            background: #deb887;
        }
        th{
            height: 40px;
            font-max-size: large;
        }
        .my_span1{
            float: left;
            width: 80%;
        }
        .search_head{
            width: 200px;
            height: 40px;
        }
        .my_span2{
            float: right;
            width: 20%;
        }
    </style>
    <script type="text/javascript">
        function deleteuser(id) {
            //${pageContext.request.contextPath}/delUserServlet?id=${s.count}
            //给用户安全提
            if (confirm("您确定需要删除嘛？")){
                location.href="${pageContext.request.contextPath}/delUserServlet?id=" +id;
            }
        }
        window.onload = function () {
            //给删除选中按钮田间单击事件
            document.getElementById("delSelect").onclick = function () {
                var cbs = document.getElementsByName("s_id");
                var flag = false;
                for(var i=0;i <cbs.length;i++){
                   //判断是否有选中
                    if(cbs[i].checked){
                        flag = true;
                        break;
                    }
                }
                if (flag){
                    if (confirm("您确定需要删除嘛？")){
                        //表单提交
                        document.getElementById("form").submit();
                    }

                }


            }
            document.getElementById("firstCb").onclick=function () {
                var cbs = document.getElementsByName("s_id");
                for(var i=0;i <cbs.length;i++){
                    //设置 cbs checked 与firstcb一致
                    cbs[i].checked = this.checked;
                }

            }
        }
    </script>
</head>
<body>
<div class="container" align="center">
    <h1 style="" align="center">用户信息列表</h1>
    <div align="center" style="width: 100%">
        <span class="my_span1">
            <form name="search" action="${pageContext.request.contextPath}/findByPageServlet" method="post">

                <label for="inputname">姓名</label>
                <input type="text" name="username" class="search_head" id="inputname" value="${condidtion.username[0]}" placeholder="姓名">


                <label for="inputlocate">籍贯：</label>
                <input type="text" name="userlocate" class="search_head" value="${condidtion.userlocate[0]}" id="inputlocate" placeholder="籍贯">


                <label for="inputemil">邮箱</label>
                <input type="email" name="emil" class="search_head" value="${condidtion.emil[0]}" id="inputemil" placeholder="邮箱">

            <input type="submit"  value="查询">
        </form>
        </span>
        <span class="my_span2">
            <a class="btn btn-primary " href="${pageContext.request.contextPath}/add.jsp">添加联系人</a>&nbsp;
            <a class="btn btn-primary " href="javascript:void(0);" id="delSelect">删除选中</a>
        </span>
    </div>
    <div>
       <form id="form" action="${pageContext.request.contextPath}/delSelectServlet" method="post">
           <table border="1px" class="table table-bordered table-hover" align="center" style="width: 100%">
               <tr>
                   <th class="table_head"><input type="checkbox" id="firstCb"></th>
                   <th class="table_head">编号</th>
                   <th class="table_head">姓名</th>
                   <th class="table_head">年龄</th>
                   <th class="table_head">性别</th>
                   <th class="table_head">籍贯</th>
                   <th class="table_head" style="width: 150px">QQ</th>
                   <th class="table_head" style="width: 200px">邮箱</th>
                   <th class="table_head" style="width: 200px">操作</th>
               </tr>
               <c:forEach items="${pb.list}" var="user" varStatus="s">
                   <tr>
                       <td class="td_head" align="center"><input type="checkbox" name="s_id" value="${user.userid}"></td>
                       <td class="td_head" align="center">${s.count}</td>
                       <td class="td_head" align="center">${user.username}</td>
                       <td class="td_head" align="center">${user.userage}</td>
                       <td class="td_head" align="center">${user.usersex}</td>
                       <td class="td_head" style="width: 150px" align="center">${user.userlocate}</td>
                       <td class="td_head" style="width: 200px" align="center">${user.qq}</td>
                       <td class="td_head" style="width: 200px" align="center">${user.emil}</td>
                       <td class="td_head" style="width: 200px" align="center">
                           <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findUserServlet?userid=${user.userid}">修改</a>&nbsp;
                           <a class="btn btn-default btn-sm" href="javascript:deleteuser(${user.userid})">删除</a>
                       </td>
                   </tr>

               </c:forEach>
               <tr>
               </tr>
           </table>
       </form>
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pb.currentPage == 1}">
                        <li class="disabled">
                    </c:if>
                    <c:if test="${pb.currentPage != 1}">
                        <li>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/findByPageServlet?currentPage=${pb.currentPage - 1}&rows=${pb.rows}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pb.totalPage}" var="i">

                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a href="${pageContext.request.contextPath}/findByPageServlet?currentPage=${i}&rows=${pb.rows}
                                &username=${condition.username[0]}&userlocate=${condition.userlocate[0]}&emil=${condition.emil[0]}">
                                    ${i}</a></li>
                        </c:if>
                        <c:if test="${pb.currentPage != i}">
                            <li><a href="${pageContext.request.contextPath}/findByPageServlet?currentPage=${i}&rows=${pb.rows}
                                &username=${condition.username[0]}&userlocate=${condition.userlocate[0]}&emil=${condition.emil[0]}">
                                    ${i}</a></li>
                        </c:if>
                    </c:forEach>
                        <c:if test="${pb.currentPage == pb.totalPage}">
                        <li class="disabled">
                            </c:if>
                            <c:if test="${pb.currentPage != pb.totalPage}">
                        <li>
                            </c:if>
                                <a href="${pageContext.request.contextPath}/findByPageServlet?currentPage=${pb.currentPage + 1}&rows=${pb.rows}
                                &username=${condition.username[0]}&userlocate=${condition.userlocate[0]}&emil=${condition.emil[0]}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                </ul>
                <span style="font-size: 20px;margin-left: 5px">
                    共${pb.totalPage}页，共${pb.totalCount}条记录

                </span>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
