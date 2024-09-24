<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="DBConnection.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<%
    PrintWriter sout = response.getWriter();
    Connection connection = DbConnection.getConnection();
    if (connection != null) {
        sout.println("<p>DB 연결 성공</p>");
    } else {
        sout.println("<p>DB 연결 실패</p>");
    }
    sout.println("<p> 하 위 </p>");
%>
<script>
</script>
</body>
</html>