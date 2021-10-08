<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/18
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息列表</title>
    <style>
        td{
            font-max-size: large;
            align-content: center;
            height: 30px;
        }
        .table_head{
            background: #deb887;

        }
        .td_head{
            border: 1px solid;
        }
        th{
            height: 40px;
            font-max-size: large;
        }
        table{
            width: 1050px;
            height: 40px;
        }
        .search_head{
            width: 250px;
            height: 30px;
        }
    </style>
    <script>
        var id_ = document.getElementsByName("td");
        id_.onclick();
    </script>
</head>
<body>
        <h1 style="color: #00f" align="center" href="/msg.jsp">用户信息列表</h1>
        <ul align="center">
        <form name="search" action="/msg_show" method="post">
            姓名：<input type="text" name="username" class="search_head" placeholder="姓名">
            籍贯：<input type="text" name="locate" class="search_head" placeholder="籍贯">
            邮箱：<input type="email" name="emil" class="search_head" placeholder="邮箱">
            <input type="submit" style="width: 70px; height: 30px" value="查询">
        </form>
        </ul>
        <div align="center">
            <table align="center" frame="box">
                <tr>
                <th class="table_head">
                    <input type="checkbox">
                </th>
                    <th class="table_head">
                    编号
                </th>
                    <th class="table_head">
                    姓名
                </th>
                    <th class="table_head">
                    年龄
                </th>
                    <th class="table_head">

                    </th>
                    <th class="table_head">
                    籍贯
                </th>
                    <th class="table_head" style="width: 150px">
                    QQ
                </th>
                    <th class="table_head" style="width: 200px">
                    邮箱
                </th>
                    <th class="table_head" style="width: 200px">
                    操作
                </th>
                </tr>
<%--                <c:if test="${not empty msg}">--%>
<%--                   <c:forEach items="msg" var=" user">--%>
                       <tr>
                           <td class="td_head" align="center">
                               <input type="checkbox">
                           </td>
                           <td class="td_head" align="center">
                               编号
                           </td>
                           <td class="td_head" align="center">
                               姓名
                           </td>
                           <td class="td_head" align="center">
                               年龄
                           </td>
                           <td class="td_head" align="center">
                               籍贯
                           </td>
                           <td class="td_head" style="width: 150px" align="center">
                               QQ
                           </td>
                           <td class="td_head" style="width: 200px" align="center">
                               邮箱
                           </td>
                           <td class="td_head" style="width: 200px" align="center">
                               <input type="submit" value="修改">
                               <input type="submit" value="删除">
                           </td>
                       </tr>

<%--                   </c:forEach>--%>
<%--                </c:if>--%>

            </table>

        </div>

</body>
</html>
