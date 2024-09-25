<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="DBConnection.DbConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
</head>
<body>
<%
    String sql = "SELECT userId,name,addr1,addr2 FROM tbl_member";
    try (DbConnection dbConnection = DbConnection.getInstance("mysql");
         Connection connection = dbConnection.connectDirect();
         Statement statement = connection.createStatement();
//         PreparedStatement preparedStatement = connection.prepareStatement(sql);
         ResultSet result = statement.executeQuery(sql)
    ) {
        ResultSetMetaData metaData = result.getMetaData();
        int columnCount = metaData.getColumnCount();
        out.println("<table>");
        out.println("<tr>");

        //
        for (int i = 1; i <= columnCount; i++) {
            out.print("<th>" + metaData.getColumnName(i) + "</th>");
        }
        out.println("</tr>");

        while (result.next()) {
            out.println("<tr>");
            for (int i = 1; i <= columnCount; i++) {
                if (i == 1) {
                    out.print("<td>");
//                    out.print("<form action='memberView.jsp' method='get'>");
//                    out.print("<input type='hidden' name='userId' value='" + result.getString(i) + "'>");
//                    out.print("<input type='submit' value='" + result.getString(i) + "'>");
//                    out.print("</form>");
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

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<br><br><br>
<form action="register.jsp" method="post">
    <table>
        <tr>
            <th>userId</th>
            <th>name</th>
            <th>pwd</th>
            <th>ssn</th>
            <th>addr1</th>
            <th>addr2</th>
            <th>birthday</th>
            <th>jobCode</th>
        </tr>
        <tr>
            <td><input type="text" id="userId" name="userId" required></td>
            <td><input type="text" id="name" name="name"></td>
            <td><input type="password" id="pwd" name="pwd" required></td>
            <td><input type="text" id="ssn" name="ssn"></td>
            <td><input type="text" id=addr1 name="addr1"></td>
            <td><input type="text" id="addr2" name="addr2"></td>
            <td><input type="date" id="birthday" name="birthday" required></td>
            <td><input type="text" id="jobCode" name="jobCode"></td>
        </tr>
    </table>
    <br>
    <button type="submit">전송뿅</button>
</form>
<script>
    // document.querySelector("form").addEventListener("submit", (event) => {
    //     event.preventDefault();
    //     const userInfo = {
    //         userId: document.querySelector("#userId"),
    //         name: document.querySelector("#name"),
    //         pwd: document.querySelector("#pwd"),
    //         ssn: document.querySelector("#ssn"),
    //         addr1: document.querySelector("#addr1"),
    //         addr2: document.querySelector("#addr2"),
    //         birthday: document.querySelector("#birthday"),
    //         jobCode: document.querySelector("#jobCode")
    //     };
    // });
</script>
</body>
</html>
