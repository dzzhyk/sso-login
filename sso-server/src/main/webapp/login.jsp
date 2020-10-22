<%--
  Created by IntelliJ IDEA.
  User: Altale
  Date: 2020/10/13
  Time: 5:13 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>sso登录</title>
</head>
<body>
    <form action="/login" method="post">
        <label>用户名：
            <input type="text" name="username"/>
        </label>
        <input type="hidden" name="clientUrl" value="${requestScope.clientUrl}"/>
        <button type="submit">登录</button>
    </form>
</body>
</html>
