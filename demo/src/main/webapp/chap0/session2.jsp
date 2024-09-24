<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>세션투</h2>
<%
    //    List<?> testList2 = (List<?>) session.getAttribute("lst");
    List<?> testList2 = session.getAttribute("lst") != null ? (List<?>) session.getAttribute("lst") : null;
    if (testList2 != null) {
        for (int i = 0; i < testList2.size(); i++) {
            out.println("이름 : " + testList2.get(i) + "<br>");
        }
    } else out.println("null임");

%>
<a href="session.jsp">뒤로.</a>
</body>
</html>
