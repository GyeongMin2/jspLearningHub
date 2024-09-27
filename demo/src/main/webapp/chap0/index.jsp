<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
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
<style>
    .toJSP {
        border: solid 1px black;
        margin: 10px;
        text-align: center;
        padding: 5px;
        font-size: large;
        font-weight: bold;
        width: 200px;
    }

    .toJSP > a, .toJSP > a:link {
        text-decoration: none;
        color: black;
    }

    a:hover {
        background-color: black;
        color: white;
    }

    #mainCont {
        /*display: flex;*/
        /*align-items: center;*/
    }
</style>
<%
    Connection connection = DatabaseConnectionManager.getConnection();
    String sql;
    PreparedStatement statement = null;
    sql = "";
    statement = connection.prepareStatement(sql);
//    statement.setInt(1, limitPage);
//    statement.setString(2, userId);
    ResultSet resultSet = statement.executeQuery();
    if (resultSet.next()) {
        int a = resultSet.getInt(0);
    }
%>
<div id="mainCont">
    <div class="toJSP"><a href="app.jsp">app.jsp</a></div>
    <div class="toJSP"><a href="app2.jsp">app2.jsp</a></div>
    <div class="toJSP"><a href="idx.jsp">idx.jsp</a></div>
    <div class="toJSP"><a href="index.jsp">index.jsp</a></div>
    <div class="toJSP"><a href="login.jsp">login.jsp</a></div>
    <div class="toJSP"><a href="loginok.jsp">loginok.jsp</a></div>
    <div class="toJSP"><a href="loginVal.jsp">loginVal.jsp</a></div>
    <div class="toJSP"><a href="out.jsp">out.jsp</a></div>
    <div class="toJSP"><a href="page_include.jsp">page_include.jsp</a></div>
    <div class="toJSP"><a href="pc2.jsp">pc2.jsp</a></div>
    <div class="toJSP"><a href="registerPage.jsp">registerPage.jsp</a></div>
    <div class="toJSP"><a href="req.jsp">req.jsp</a></div>
    <div class="toJSP"><a href="req2.jsp">req2.jsp</a></div>
    <div class="toJSP"><a href="session.jsp">session.jsp</a></div>
    <div class="toJSP"><a href="session2.jsp">session2.jsp</a></div>
    <div class="toJSP"><a href="test.jsp">test.jsp</a></div>
    <div class="toJSP"><a href="test2.jsp">test2.jsp</a></div>
    <div class="toJSP"><a href="pC1.jsp">pC1.jsp</a></div>
    <div class="toJSP"><a href="cookie.jsp">cookie.jsp</a></div>
</div>
<script>
</script>
</body>
</html>