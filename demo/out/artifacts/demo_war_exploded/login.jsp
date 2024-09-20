<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-20
  Time: 오후 2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<%
    String loginErr = request.getParameter("loginErr");
%>
<form method="post" action="loginVal.jsp">
    <input type="text" name="userId" id="userId" value="thisIsAId">
    <br>
    <input type="password" name="userPwd" id="userPwd" value="thisIsAPWD">
    <button type="submit">전송~!</button>
</form>
<%
    if (loginErr != null) {
        out.println("<br>" + "로그인하샘" + "<br>");
    }
%>
</body>
</html>
