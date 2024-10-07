<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-10-07
  Time: AM 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="formProcess.jsp" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="name">아이디:</label>
    <input type="text" id="userId" name="userId" required><br><br>

    <label>성별:</label>
    <input type="radio" id="male" name="gender" value="male" required>
    <label for="male">남성</label>
    <input type="radio" id="female" name="gender" value="female" required>
    <label for="female">여성</label><br><br>

    <label for="school">학교:</label>
    <select id="school" name="school" required>
        <option value="elementary">초등학교</option>
        <option value="middle">중학교</option>
        <option value="high">고등학교</option>
        <option value="university">대학교</option>
    </select><br><br>

    <label>취미:</label><br>
    <input type="checkbox" id="soccer" name="hobbies" value="soccer">
    <label for="soccer">축구</label><br>
    <input type="checkbox" id="basketball" name="hobbies" value="basketball">
    <label for="basketball">농구</label><br>
    <input type="checkbox" id="baseball" name="hobbies" value="baseball">
    <label for="baseball">야구</label><br>
    <input type="checkbox" id="volleyball" name="hobbies" value="volleyball">
    <label for="volleyball">배구</label><br><br>

    <input type="submit" value="Submit">
</form>


</body>
</html>
