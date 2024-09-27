<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: AM 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>로그인 폼</title>
</head>
<body>
<%
    // 이전에 저장된 아이디가 쿠키에 있는지 확인
    Cookie[] cookies = request.getCookies();
    String savedUserId = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("savedUserId".equals(cookie.getName())) {
                savedUserId = cookie.getValue();
                break;
            }
        }
    }
%>
<div class="loginForm">
    <h2>로그인</h2>
    <form action="loginProcess.jsp" method="post">
        <table>
            <tr>
                <td>아이디:</td>
                <td><input type="text" name="userId" value="<%= savedUserId %>" required></td>
            </tr>
            <tr>
                <td>비밀번호:</td>
                <td><input type="password" name="pwd" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="checkbox" name="rememberMe" <%= !savedUserId.isEmpty() ? "checked" : "" %>> 아이디 저장
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="로그인">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
