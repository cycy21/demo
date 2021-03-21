<%@ page import="java.util.Enumeration,com.example.demo.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%--
  Created by IntelliJ IDEA.
  User: YH
  Date: 2021/3/19
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>信息验证</title>
    <h1>您输入的信息为：</h1>
    <%!
        Person p = null;
    %>
    <form action="register.jsp" method="post">
    <%
        request.setCharacterEncoding("utf-8");
        //取得页面传过来的信息
        Enumeration enu =  request.getParameterNames();
        if (enu != null)
            p = new Person();     // 创建 Person对象
        while (enu.hasMoreElements()){              //判断enu集合中有没有值，有的话就循环打印
            String parametername =(String) enu.nextElement();
    %>
    <%--<%= parametername %>: --%>
    <%
        if (parametername.startsWith("**")){        //证明是传过来多个值
            String[] values = request.getParameterValues("parametername");  //拿到值   进行循环打印
            for (int i = 0; i < values.length; i++) {
    %>
                <%= values[i] %>
    <%
            }

        }else {

            String value = (String) request.getParameter(parametername);
            if (parametername.equals("sex")){
                if (value.equals(0)){
                    value = "男";
                }else
                    value = "女";
            }
            if(parametername.equals("no")){
                if (!p.setId(value)){
                    response.sendRedirect("error.jsp");
                    return;

                }
            }else if (parametername.equals("name")){
                p.setName(value);
            }else if (parametername.equals("sex")){
                p.setSex(value);
            }else if (parametername.equals("age")){
                p.setAge(value);
            }else if (parametername.equals("birthday")){
                Calendar calendar = Calendar.getInstance();
                if (calendar.get(Calendar.YEAR)-Integer.parseInt(value.substring(0,4))!= Integer.parseInt(p.getAge())){
                    response.sendRedirect("error.jsp");
                    return;
                }else {
                    p.setBirthday(value);
                }
            }
        }
        }
        application.setAttribute("Person",p);
        if (p != null){
            Person.arr.add(p);
        }
    %>
        编号：<%=p.getId()%><br/>
        姓名：<%=p.getName()%><br/>
        年龄：<%=p.getAge()%><br/>
        性别：<%=p.getSex()%><br/>
        出生日期：<%= p.getBirthday()%><br/>
    <input type="submit" value="提交">
    <button type="button" value="" onclick="informationCollection.html">重写</button>
    </form>
</head>
<body>

</body>
</html>
