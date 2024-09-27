<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-25
  Time: PM 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.security.Key" %>
<%@ page import="com.sun.jdi.Value" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String sql = "SELECT userId, name, pwd, ssn, addr1, addr2, birthday, jobCode, mileage, memberState FROM TBL_MEMBER WHERE USERID=?";
    String userId = request.getParameter("userId");
    Map<String, String> userInfoMap = new LinkedHashMap<>();
    try (DatabaseConnectionManager databaseConnectionManager = DatabaseConnectionManager.getInstance("mysql");
         Connection connection = databaseConnectionManager.connectDirect();
         PreparedStatement statement = connection.prepareStatement(sql);
    ) {
        statement.setString(1, userId);
        try (ResultSet result = statement.executeQuery();) {
            ResultSetMetaData metaData = result.getMetaData();
            int columnCount = metaData.getColumnCount();
            out.println("<table>");
            out.println("<tr>");

            for (int i = 1; i <= columnCount; i++) {
                out.println("<th>" + metaData.getColumnName(i) + "</th>");
            }
            out.println("</tr>");

            if (result.next()) {
                do {
                    out.println("<tr>");
                    for (int i = 1; i <= columnCount; i++) {
                        out.print("<td>" + result.getString(i) + "</td>");
                        userInfoMap.put(metaData.getColumnName(i), result.getString(i));
                    }
                    out.println("</tr>");
                } while (result.next());
            } else {
                out.println("<p>값 없음</p>");
            }

            out.println("</table>");
            out.println("<style>");
            out.println("table>th,td{border: 1px solid black; padding : 10px;}");
            out.println("</style>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<a href="javascript:history.back();">
    <button>돌아가기</button>
</a>
<form action="modify.jsp" method="post">
    <input hidden="hidden" type="text" name="userId" value="<%=userId%>">
    <p>수정할거 입력하샘</p>
    <table>
        <tr>
            <%
                for (Map.Entry<String, String> entry : userInfoMap.entrySet()) {
                    String key = entry.getKey();

                    // userId 필드는 제외
                    if (!"userId".equals(key)) {
                        out.print("<td>" + key + "</td>");
                    }
                }
            %>
        </tr>
        <tr>
            <%
                for (Map.Entry<String, String> entry : userInfoMap.entrySet()) {
                    String key = entry.getKey();
                    String value = entry.getValue();

                    // userId 필드는 제외
                    if (!"userId".equals(key)) {
                        out.print("<td><input type='text' id='" + key + "' name='" + key + "' value='" + value + "'></td>");
                    }
                }
            %>
        </tr>
    </table>
    <br>
    <button type="submit">수정뿅</button>
</form>
</body>
</html>
