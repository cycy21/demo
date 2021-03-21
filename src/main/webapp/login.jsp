<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2021/3/20
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>欢迎登录</title>
  </head>
  <body>
  <form action="checklogin.jsp" method="post">
    <h1>用户名：<input type="text" name="username"/></h1>
    <h1>密 &nbsp;&nbsp;码：<input type="password" name="password"/></h1>
    <input type="submit" value="登录"/>
    <input type="reset" value="清空"/>
  </form>
  </body>
</html>
