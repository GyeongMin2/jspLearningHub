<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%!
    // 최대 페이지 수 계산 메서드
    private Integer getMaxPageNum(Integer rowsPerPage) {
        // 페이지 수 계산 쿼리
        String sql = "SELECT CEIL(COUNT(*) /" + rowsPerPage + ") FROM tbl_member";
        try (DatabaseConnectionManager databaseConnectionManager = DatabaseConnectionManager.getInstance("mysql");
             Connection connection = databaseConnectionManager.connectWithConnectionPool();
             Statement statement = connection.createStatement();
             ResultSet result = statement.executeQuery(sql)) {
            if (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
    // 결과가 있으면 페이지 수 반환 없으면 null 반환임 ㅅㄱ
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Paging</title>
</head>
<body>
<%
    // 세션에서 pageSize 가져옴 없으면 기본값 5 설정
    Integer rowsPerPage = session.getAttribute("pageSize") != null ? (Integer) session.getAttribute("pageSize") : 5;
    Integer nowPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int offset = (nowPage - 1) * rowsPerPage;

    String sql = "SELECT userId, name, addr1 FROM tbl_member LIMIT ? OFFSET ?";

    try (DatabaseConnectionManager databaseConnectionManager = DatabaseConnectionManager.getInstance("mysql");
         Connection connection = databaseConnectionManager.connectDirect();
         PreparedStatement statement = connection.prepareStatement(sql)) {

        statement.setInt(1, rowsPerPage);
        statement.setInt(2, offset);

        try (ResultSet result = statement.executeQuery()) {
            ResultSetMetaData metaData = result.getMetaData();
            int columnCount = metaData.getColumnCount();
            out.println("<table>");
            out.println("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                out.print("<th>" + metaData.getColumnName(i) + "</th>");
            }
            out.println("</tr>");

            while (result.next()) {
                out.println("<tr>");
                for (int i = 1; i <= columnCount; i++) {
                    if (i == 1) {
                        out.print("<td>");
                        out.print("<a href='memberView.jsp?userId=" + result.getString(i) + "'>");
                        out.print(result.getString(i));
                        out.print("</a>");
                        out.print("</td>");
                    } else {
                        out.print("<td>" + result.getString(i) + "</td>");
                    }
                }
                out.println("</tr>");
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

<%
    for (int i = 1; i <= getMaxPageNum(rowsPerPage); i++) {
        out.print("<a href='paging.jsp?page=" + i + "'>");
        out.print(i);
        out.print("</a>   ");
    }
%>

<form method="get" action="setSize.jsp" id="pageSizeForm">
    <label for="pageSize">페이지 크기 (5 ~ 20):</label>
    <input type="number" id="pageSize" name="pageSize" value="<%= rowsPerPage %>">
    <button type="submit">뿅</button>
</form>
<script>
    document.querySelector("#pageSizeForm").addEventListener("submit", function (event) {
        const pageSizeInput = document.querySelector("#pageSize");
        const pageSize = parseInt(pageSizeInput.value, 10);

        if (pageSize < 5 || pageSize > 20) {
            alert("5보다 크고 20보다 작게해라");
            event.preventDefault();
        }
    });
</script>
</body>
</html>
