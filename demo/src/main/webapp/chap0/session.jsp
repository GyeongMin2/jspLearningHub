<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    List<String> testList = new ArrayList<>();
    testList.add("C.Ronaldo");
    testList.add("강경민");
    testList.add("닌자");
    session.setAttribute("lst", testList);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>세션완</h2>
<%
    List<?> testList2 = (List<?>) session.getAttribute("lst");
    for (int i = 0; i < testList2.size(); i++) {
        out.println(testList2.get(i) + "<br>");
    }
%>
<a href="session2.jsp">이동!!!!!!!!!!!!</a>
</body>
</html>
