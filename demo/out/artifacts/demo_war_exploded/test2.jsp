<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
<meta charset="UTF-8">
<html xml:lang="en">
<head>
    <title>Title</title>
</head>
<body>
<%
    Date today = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String today2 = sdf.format(today);
%>
<p id="p1">
    <%
        out.print("오늘날짜 " + today + "<br>");
        out.print("오늘날짜 " + today2);
    %>
    <script>

        <%--document.querySelector('#p1').innerHTML = `${}`;--%>
    </script>
</p>
</body>
</html>
