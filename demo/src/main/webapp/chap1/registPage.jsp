<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-25
  Time: PM 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
</body>
</html>
