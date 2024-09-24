<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
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
    pageContext.setAttribute("pageStNo", "20240101");
    pageContext.setAttribute("pageStName", "강경민");
    pageContext.setAttribute("pageStDept", "컴퓨터공학");
    pageContext.setAttribute("pageStGrade", 2);
    pageContext.setAttribute("pageStAge", 24);
    pageContext.setAttribute("pageStudent", new StudentDTO("20210101", "호날두", 1, 19, "문과"));
%>

<%@include file="page_include.jsp" %>


<script>
</script>
</body>
</html>