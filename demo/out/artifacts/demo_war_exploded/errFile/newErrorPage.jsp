<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-19
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" isErrorPage="true" %>
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
<h2>page 지시어 - errorPage, isErrorPage 속성</h2>
<h2>오류</h2>
<p>
    오류명 : <%=exception.getClass().getName()%><br>
    오류메시지 : <%=exception.getMessage()%>
</p>
</body>
</html>