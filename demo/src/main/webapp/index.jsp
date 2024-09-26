<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-26
  Time: PM 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

    LinkedHashMap<String, String> sessionInfoMap = new LinkedHashMap<>();
    sessionInfoMap.put("세션최초 요청시간 : ", dateFormat.format(new Date(session.getCreationTime())));
    sessionInfoMap.put("세션마지막 요청시간 : ", dateFormat.format(new Date(session.getLastAccessedTime())));
    sessionInfoMap.put("세션 유지시간 :", String.valueOf(session.getMaxInactiveInterval()));
    sessionInfoMap.put("세션 아이디 : ", session.getId());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>session 설정 확인</h2>
<%
    try {
        out.println("<ul>");
        for (Map.Entry<String, String> entry : sessionInfoMap.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            out.println("<li>" + key + value + "</li>");
        }
        out.println("</ul>");
    } catch (Exception e) {
        out.println("<p>오류남 : " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
