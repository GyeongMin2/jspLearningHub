<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" import="dto.StudentDTO" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>req2</h2>

<h2>req2 조회</h2>
<%
    Object reqStd = request.getAttribute("reqStd") != null ? request.getAttribute("reqStd") : null;
%>
<%= reqStd.toString() %>
<br>
<%= request.getParameter("pwd")%>
<%= request.getParameter("user_id")%>
</body>
</html>
