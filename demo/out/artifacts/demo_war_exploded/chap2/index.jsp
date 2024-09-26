<%--
Created by IntelliJ IDEA.
User: full5-8
Date: 2024-09-26
Time: AM 9:28
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dbModule.MySqlDbModule" %>
<%@ page import="java.util.*" %>
<%
    String sql = "SELECT * FROM tbl_member";
    List<Map<String, Object>> resList = null;
    try {
        MySqlDbModule mySqlDbModule = new MySqlDbModule();
        resList = mySqlDbModule.getQueryResultList(sql);
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="delPage.jsp" method="get">
    <table border="1px">
        <%
            out.println("<tr>");
            if (resList != null && !resList.isEmpty()) {
                Map<String, Object> firstRow = resList.get(0);
                for (String columnName : firstRow.keySet()) {
                    out.println("<th>" + columnName + "</th>");
                }
                out.println("</tr>");
            }
            for (Map<String, Object> map : resList) {
                out.println("<tr>");
                for (Map.Entry<String, Object> entry : map.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    if ("userId".equals(key)) {
                        out.println("<td><input id='delCheckBox' type='checkbox' name='userId' value='" + (value != null ? value.toString() : "") + "' />" + (value != null ? value.toString() : "") + "</td>");
                    } else {
                        out.println("<td>" + (value != null ? value.toString() : "") + "</td>");
                    }
                }
                out.println("</tr>");
            }
        %>
    </table>
    <button type="submit">체크 삭제~</button>
</form>
<!--
	`userId` VARCHAR(20) not null,
	`name` varchar(20) null default null,
	`pwd` varchar(300) not null,
	`ssn` varchar(300) not null,
	`addr1` varchar(100) not null,
	`addr2` varchar(100) not null,
	`birthday` char(10) not null comment'YYYY-MM-DD',
	`jobCode` char(2) not null,
-->
<br><br><br>
<form action="registePage.jsp" method="post">
    <table border="1px">
        <tr>
            <th>userid</th>
            <th>userName</th>
            <th>pwd</th>
            <th>ssn</th>
            <th>addr1</th>
            <th>addr2</th>
            <th>birthDay</th>
            <th>jobCode</th>
        </tr>
        <tr>
            <td><input type="text" name="userId" id="userId"></td>
            <td><input type="text" name="name" id="name"></td>
            <td><input type="password" name="pwd" id="pwd"></td>
            <td><input type="text" name="ssn" id="ssn"></td>
            <td><input type="text" name="addr1" id="addr1"></td>
            <td><input type="text" name="addr2" id="addr2"></td>
            <td><input type="date" name="birthday" id="birthDay"></td>
            <td><input type="text" name="jobCode" id="jobCode"></td>
        </tr>
    </table>
    <br>
    <button type="submit">등록~</button>
</form>
</body>
</html>