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
<h2>req</h2>
<%
    request.setAttribute("req1", "req영역");
    request.setAttribute("reqStd", new StudentDTO("12345", "강겸밈", 4, 21, "이과ㅋㅋ"));
%>
<h2>req 조회</h2>
<%
    Object reqStd = null;
    if (request.getAttribute("reqStd") != null) {
        reqStd = request.getAttribute("reqStd");
    }

//    Object reqStd = pageContext.getAttribute("reqStd") != null ? pageContext.getAttribute("reqStd") : null;
%>
<%= reqStd.toString() %>
<%
    request.getRequestDispatcher("req2.jsp?user_id=user1&pwd=1234").forward(request, response);
%>
</body>
</html>
