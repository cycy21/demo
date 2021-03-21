<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2021/3/20
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
  </head>
  <body>
  <%
    //先拿到登陆页面传过来的用户值
    String name = request.getParameter("username");
    String password = request.getParameter("password");
    //验证信息是否正确，如果不正确返回之前的注册页面，如果正确就显示注册成功，并且返回到登录页
    if (name.matches("\\w{5,10}") && password.matches("\\w{6,10}")){
      Cookie coovalues[] = request.getCookies();    //得到客户端所有的cookie值，然后开始判断输入的账户是否一致
      //循环遍历所有cookies
      for (int i = 0; i < coovalues.length; i++) {
        if (name.equals(coovalues[i].getName())){       //找到本地cookie中的用户名，然后判断他的密码是否正确
          if (password.equals(coovalues[i].getValue())){
%>

  <h2>登录成功！！3秒后跳转到主页。。。。</h2>
  <%
                session.setAttribute("username",name);
                session.setAttribute("password",password);
                response.setHeader("refresh","3;URL = index.jsp");
                break;
          }else{
  %>
  <h2>您输入的密码不正确</h2>
  <%
            response.setHeader("refresh","2;URL = login.jsp");
          }
        }
      }
    }else {

  %>
      <h2>请您输入正确的用户名!!!</h2>
  <%
    response.setHeader("refresh","3;URL=login.jsp");
    }
  %>
  
  </body>
</html>
