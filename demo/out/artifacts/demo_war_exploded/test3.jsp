<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-19
  Time: 오후 5:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page buffer="1kb" autoFlush="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%
        for (int i = 0; i <= 10; i++) {
            out.println(i);
        }
    %>
</head>
<body>

</body>
</html>