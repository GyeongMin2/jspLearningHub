<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-24
  Time: PM 12:56
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
    String popFlag = request.getParameter("hidePopupFlag");
    if (popFlag.equals("true")) {
        setCookie("jspPopUpStatus", "true", 24 * 60 * 60, request, response);
    } else {
        setCookie("jspPopUpStatus", "false", 24 * 60 * 60, request, response);
    }
    response.setContentType("text/plain");
    response.getWriter().write("success");
%>
</body>
</html>
