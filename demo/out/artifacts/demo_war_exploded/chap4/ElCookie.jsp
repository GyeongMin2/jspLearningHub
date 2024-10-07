<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-10-07
  Time: AM 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="CommonUtils.CommonUtils" %>
<%
    CommonUtils commonUtils = new CommonUtils();
    commonUtils.setCookie("testCookieKey", "values", 60, request, response);

%>
<h2>el쿠키</h2>
<ul>
    <li>host: ${header.host }</li>
    <li>user-agent: ${header["user-agent"] }</li>
    <li>cookie: ${cookie.testCookieKey.value }</li>
    <li>host: <%=request.getHeader("host") %>
    </li>
    <li>user-agent: <%=request.getHeader("user-agent") %>
    </li>
    <li>cookie: <%=request.getHeader("cookie") %>
    </li>
</ul>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        String val = commonUtils.getCookie("testCookieKey", cookies);
        if (val != null) {
            out.print("쿠키 값: " + val);
        } else {
            out.print("그런키 없음");
        }
    } else {
        out.print("쿠키 없음");
    }
%>

