<%--
  Created by IntelliJ IDEA.
  User: Altale
  Date: 2020/10/13
  Time: 5:03 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单点登录系统</title>
</head>

<body>
    <h1>单点登录系统</h1>
    <a href="/app1">系统A</a>
    <a href="/app2">系统B</a>
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
</body>
</html>
