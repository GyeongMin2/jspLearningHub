<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: AM 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="fullstack7.member.MemberDTO" %>
<%
    // 로그인상태체크
    if (!"true".equals(session.getAttribute("logInFlag"))) {
        response.sendRedirect("login.jsp"); //로그인 안되면 login.jsp 로 리다이렉트
    } else {
        MemberDTO member = (MemberDTO) session.getAttribute("member");
%>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
<h2>환영합니다, <%= member.getName() %>님!</h2>
<form action="logout.jsp" method="post" style="text-align: center;">
    <input type="submit" value="로그아웃">
</form>
</body>
</html>
<%
    }
%>
