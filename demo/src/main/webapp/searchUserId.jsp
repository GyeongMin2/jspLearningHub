<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-25
  Time: PM 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="searchUserIdRes.jsp" method="get">
    <input type="text" name="userId">
    <button type="submit" id="searchIdBtn">검색</button>
</form>
<script>
    const searchIdBtn = document.querySelector("#searchIdBtn");
    searchIdBtn.addEventListener('click', () => {
        location.href = "searchUserIdRes.jsp";
    });
</script>
</body>
</html>
