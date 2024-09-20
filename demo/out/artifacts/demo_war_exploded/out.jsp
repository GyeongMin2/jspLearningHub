<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-20
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    out.println("부부부부");
    out.clearBuffer();
    out.println("<h2>하이</h2>");
    out.println("출력 버퍼 크기 : " + out.getBufferSize() + "<br>");
    for (int i = 0; i < 1000; i++) {
        out.println("화이팅~");
    }

    out.println("<br>");
    out.println("남은 버퍼 크기 : " + out.getRemaining() + "<br>");
    out.flush();
    out.println("flush후 출력 버퍼 크기 : " + out.getBufferSize() + "<br>");
%>

</body>
</html>