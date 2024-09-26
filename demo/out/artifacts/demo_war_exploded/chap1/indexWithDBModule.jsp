<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbModule.MySqlDbModule" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
</head>
<body>
<%
    String sql = "SELECT * FROM tbl_member";
    try {
        MySqlDbModule mySqlDbModule = new MySqlDbModule();
        List<Map<String, Object>> resList = mySqlDbModule.getQueryResultList(sql);

//        resList.forEach(map -> {
//            map.forEach((k, v) -> {
//                System.out.println(k);
//                System.out.println(v);
//            });
//        });

        out.println("<table border='1'>");
        out.println("<tr>");

        if (!resList.isEmpty()) {
            Map<String, Object> firstRow = resList.get(0);
            for (String columnName : firstRow.keySet()) {
                out.println("<th>" + columnName + "</th>");
            }
            out.println("</tr>");
        }

        for (Map<String, Object> map : resList) {
            out.println("<tr>");
            for (Object value : map.values()) {
                out.println("<td>" + (value != null ? value.toString() : "") + "</td>");
            }
            out.println("</tr>");
        }

        out.println("</table>");

    } catch (SQLException e) {
        System.out.println(e.getMessage());
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
