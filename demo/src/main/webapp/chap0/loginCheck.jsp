<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-24
  Time: PM 2:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
    public Cookie setCookie(String key, String value, Integer timeOut, HttpServletRequest request, HttpServletResponse response) {
        Cookie a = new Cookie(key, value);
        a.setPath(request.getContextPath());
        a.setMaxAge(timeOut);
        response.addCookie(a);
        return a;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    
    String autoLogin = request.getParameter("autoLogin") != null ? request.getParameter("autoLogin") : "";
    String userId = request.getParameter("userId") != null ? request.getParameter("userId") : "";

    if (autoLogin.equals("on")) {
        setCookie("autoLoginFlag", "true", 300, request, response);
        setCookie("user_id", userId, 300, request, response);
    } else {
        setCookie("autoLoginFlag", "false", 0, request, response);
        setCookie("user_id", "", 0, request, response);
    }
    response.sendRedirect("login.jsp");

%>
</body>
</html>
