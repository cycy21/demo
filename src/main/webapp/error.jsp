<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2021/3/21
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>错误页</title>
  </head>
  <body>
  <h2>您输入的信息有误，请重新输入</h2>
  <%
    response.setHeader("refresh","2;URL=informationCollection.html");
  %>
  </body>
</html>
