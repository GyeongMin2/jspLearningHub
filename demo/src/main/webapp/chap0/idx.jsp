<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>폼 데이터 확인</title>
</head>
<body>
<ul>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    <li>데이터 전송 방식: <%=request.getMethod()%>
    </li>
    <li>URL: <%=request.getRequestURL()%>
    </li>
    <li>URI: <%=request.getRequestURI()%>
    </li>
    <li>Query String: <%=request.getQueryString()%>
    </li>
    <li>사용자 ID: <%=request.getParameter("userId")%>
    </li>
    <li>비밀번호: <%=request.getParameter("userPwd")%>
    </li>
    <li>주소: <%=request.getParameter("addr")%>
    </li>
    <li>취미: <%=request.getParameter("hobby")%>
    </li>
    <li>관심: <%=request.getParameter("interest")%>
    </li>
    <li>접속 클라이언트 ip : <%=request.getRemoteAddr()%>
    </li>
    <li>접속 로컬 ip : <%=request.getLocalAddr()%>
    </li>
    <li>프로토콜 : <%=request.getProtocol()%>
    </li>
    <li>관심2: <%= Arrays.toString(request.getParameterValues("interest"))%>
    </li>
    <li>관심배열: <%
        String[] interestsArray = request.getParameterValues("interest2");
        if (interestsArray != null && interestsArray.length > 0) {
            List<String> interests = Arrays.asList(interestsArray);
            for (int a = 0; a < interests.size(); a++) {
                out.println(interests.get(a));
            }
        }
    %>
    </li>
</ul>
</body>
</html>