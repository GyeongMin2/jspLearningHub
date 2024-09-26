<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-26
  Time: PM 4:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>