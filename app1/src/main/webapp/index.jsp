<%--
  Created by IntelliJ IDEA.
  User: yulu
  Date: 2020/10/22
  Time: 21:51 晚上
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>A</title>
</head>
<body>
<h1>app1</h1>
<h1>hello! This is System AAA</h1>
<%
    String username = "尚未登录";
    Cookie[] cookies = request.getCookies();
    if (null!=cookies && cookies.length != 0){
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")){
                username = cookie.getValue();
                break;
            }
        }
    }
%>
<br>
<span>当前用户：<%=username %></span>
<a href="/logout">退出登录</a>
</body>
</html>
