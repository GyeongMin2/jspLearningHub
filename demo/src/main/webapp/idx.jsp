<%--
  Created by IntelliJ IDEA.
  User: kgmms
  Date: 24. 9. 20.
  Time: 오전 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>폼 데이터 확인</title>
</head>
<body>
<ul>
  <li>데이터 전송 방식: <%=request.getMethod()%></li>
  <li>URL: <%=request.getRequestURL()%></li>
  <li>URI: <%=request.getRequestURI()%></li>
  <li>Query String: <%=request.getQueryString()%></li>
  <li>사용자 ID: <%=request.getParameter("userId")%></li>
  <li>비밀번호: <%=request.getParameter("userPwd")%></li>
  <li>주소: <%=request.getParameter("addr")%></li>
  <li>취미: <%=request.getParameter("hobby")%></li>
  <li>관심: <%=request.getParameter("interest")%></li>
  <li>접속 클라이언트 ip : <%=request.getRemoteAddr()%></li>
  <li>접속 로컬 ip : <%=request.getLocalAddr()%></li>
  <li>프로토콜 : <%=request.getProtocol()%></li>
</ul>
</body>
</html>