<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-20
  Time: 오후 2:42
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
    String userId = request.getParameter("userId");
    String pwd = request.getParameter("userPwd");
    if (userId.equals("thisIsAId") && pwd.equals("thisIsAPWD")) {
        response.sendRedirect("loginok.jsp");
    } else request.getRequestDispatcher("login.jsp?loginErr=1").forward(request, response);
%>
</body>
</html>
