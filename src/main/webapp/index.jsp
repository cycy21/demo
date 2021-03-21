<%@ page import="com.example.demo.Person" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>信息展示</title>
</head>
<body>
<%
    Person per = (Person) application.getAttribute("Person");  //传过来Person对象，用来拿到属性值
    String username =(String) session.getAttribute("username");
    String password =(String) session.getAttribute("password");
    if (per == null){
//        out.println("还没有注册信息，现在去注册");
    }else {
%>

        <h2>您输入的信息为：</h2>
        <h3>用户名：<%= username%></h3>
        <h3>密码：<%= password%></h3>
        <h3>员工编号：<%= per.getId()%></h3>
        <h3>姓名：<%= per.getName()%></h3>
        <h3>年龄：<%= per.getAge()%></h3>
        <h3>性别：<%= per.getSex()%></h3>
        <h3>出生日期：<%= per.getBirthday()%></h3>
<%
    }
%>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="informationCollection.html">欢迎加入XX公司，去信息采集</a>
</body>
</html>