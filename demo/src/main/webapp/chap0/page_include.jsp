<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: AM 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
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
    String no = pageContext.getAttribute("pageStNo").toString();
    String name = pageContext.getAttribute("pageStName").toString();
    String dept = pageContext.getAttribute("pageStDept").toString();
    int grade = (int) pageContext.getAttribute("pageStGrade");
    int age = (int) pageContext.getAttribute("pageStAge");
%>
<form action="pC2.jsp">
    <div style="display: none">
        <input name="name" type="text" value="<%=name%>">
        <input name="no" type="text" value="<%=no%>">
        <input name="dept" type="text" value="<%=dept%>">
        <input name="grade" type="text" value="<%=grade%>">
        <input name="age" type="text" value="<%=age%>">
        <input name="obj" type="text"
               value="<%=((StudentDTO) pageContext.getAttribute("pageStudent")).toJSONObject()%>">
    </div>
    <button type="submit"> dd</button>
</form>
<%=
"학번 : " + no + "<br>" +
        "이름 : " + name + "<br>" +
        "학과 : " + dept + "<br>" +
        "학년 : " + grade + "<br>" +
        "나이 : " + age + "<br>"
%>

<%=pageContext.getAttribute("pageStudent")%>
</body>
</html>