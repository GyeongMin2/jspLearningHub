<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: PM 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="registerProcess.jsp" method="get">
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
