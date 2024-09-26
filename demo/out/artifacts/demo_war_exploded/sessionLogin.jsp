<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-26
  Time: PM 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>로그인 폼</title>
</head>
<style>
    .displayNone {
        display: none;
    }
</style>
<body>
<div class="loginForm displayNone">
    <h2>로그인</h2>
    <form action="loginSession.jsp" method="post">
        <table>
            <tr>
                <td>아이디:</td>
                <td><input type="text" name="userId" required></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="로그인">
                </td>
            </tr>
        </table>
    </form>
</div>
<%
    if ("true".equals(session.getAttribute("logInFlag"))) { // 로그인 상태 확인
        String name = (String) session.getAttribute("name"); // 세션에서 사용자 이름 가져오기
%>
<h2>환영합니다, <%= name %>님</h2>
<form action="logout.jsp" method="post" style="text-align: center;">
    <input type="submit" value="로그아웃">
</form>
<%
    } else {
        out.println("<script>setTimeout(() => {document.querySelector('.loginForm').classList.remove('displayNone')}, 0)</script>");
    }
%>
</body>
</html>
