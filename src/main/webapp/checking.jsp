<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2021/3/20
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <%
      //先拿到注册传过来的用户值
      String name = request.getParameter("username");
      String password = request.getParameter("password");
      //验证信息是否正确，如果不正确返回之前的注册页面，如果正确就显示注册成功，并且返回到登录页
      if (name.matches("\\w{5,10}") && password.matches("\\w{6,10}") && (!name.equals(password))){
        Cookie cooname = new Cookie(name,password);     //将用户名和密码传入cookie ，用作下次判断

        response.addCookie(cooname);

    %>
        <h4>注册成功！3秒后转到登录页面。。。</h4>
    <%
        response.setHeader("refresh","3;URL=login.jsp");
      }else {
    %>
        <h4>您输入的注册信息有误，账号是5到10位，密码是6到10位，请输入完整</h4><br/>
        <h4>3秒后转到注册页</h4>
    <%
          response.setHeader("refresh","3;URL=register.jsp");
        }
    %>

  </head>
  <body>
  
  </body>
</html>
