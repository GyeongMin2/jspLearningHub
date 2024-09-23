<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
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
<%
    StudentDTO student = new StudentDTO();
    student.setName("홍길동");
    student.setDept("컴퓨터공학");
    student.setGrade(1);
    student.setNo("20010905");
    out.println("이름: " + student.getName() + "<br>");
    out.println("학과: " + student.getDept() + "<br>");
    out.println("학년: " + student.getGrade() + "학년 <br>");
    out.println("학번: " + student.getNo() + "<br>");
%>

<script>
</script>
</body>
</html>