<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="dto.StudentDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<String> resLst = (List<String>) application.getAttribute("lst");
    Map<String, StudentDTO> resMaps = (Map<String, StudentDTO>) application.getAttribute("maps");
    Set<String> keys = resMaps.keySet();
    if (resMaps != null) {
        for (String key : keys) {
            StudentDTO std = resMaps.get(key);
            out.println(key + " : " + std.toString() + "<br>");
        }
    }
    if (resLst != null) {
        for (String value : resLst) {
            out.println(value + "<br>");
        }
    }
%>
</body>
</html>
