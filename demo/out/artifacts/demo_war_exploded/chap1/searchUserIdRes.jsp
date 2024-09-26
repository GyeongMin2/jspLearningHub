<%@ page import="DBConnection.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-25
  Time: PM 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    try {
        if (request.getParameter("userId") != null) {
            String userId = request.getParameter("userId");
            String sql = "SELECT * FROM TBL_MEMBER WHERE USERID=?";

            try (DbConnection dbConnection = DbConnection.getInstance("mysql");
                 Connection connection = dbConnection.connectDirect();
                 PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, userId);
                try (ResultSet result = statement.executeQuery()) {
                    if (result.next()) {
                        out.println("<p>비번 : " + result.getString("pwd") + "</p>");
                    } else {
                        out.println("그런 아이디 없는데요?");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            out.println("<p>아이디 똑바로 입력하샘</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>오류 발생</p>");
    }

%>
</body>
</html>
