<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
<form action="idx.jsp" method="post">
    <a href="idx.jsp"></a>
    <input type="text" id="userId" name="userId" value="id">
    <br>
    <input type="password" id="userPwd" name="userPwd" value="pwd">
    <br>
    <input type="text" id="addr" name="addr" value="addr">
    <br>
    <p>취미</p>
    <input type="radio" id="hobby_0" name="hobby" value="축구">축구
    <input type="radio" id="hobby_1" name="hobby" value="야구">야구
    <p>관심</p>
    <input type="radio" id="interest_0" name="interest" value="경제">경제
    <input type="radio" id="interest_1" name="interest" value="시사">시사
    <br>
    <input type="submit" value="굳">
</form>
</body>
</html>