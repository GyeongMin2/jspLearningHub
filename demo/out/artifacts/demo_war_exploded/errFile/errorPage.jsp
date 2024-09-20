<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-19
  Time: 오후 4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" errorPage="newErrorPage.jsp" %>
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
<%
    try {
        int age = Integer.parseInt(request.getParameter("age"));
        out.print("현재 나이는 " + age + "입니다.");
    } catch (Exception e) {
        out.print(e);
    }
//    int age = Integer.parseInt(request.getParameter("age"));
//    out.print("현재 나이는 " + age + "입니다.");
%>
</body>
</html>
