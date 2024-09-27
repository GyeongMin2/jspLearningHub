<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: AM 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="fullstack7.member.*" %>

<!--로그인 처리 페이지-->

<%
    String userId = request.getParameter("userId");
    String pwd = request.getParameter("pwd");

    if (userId != null && !userId.isEmpty() && pwd != null && !pwd.isEmpty()) {
        try {
            MemberDAO memberDAO = new MemberDAO();
            MemberDTO member = memberDAO.getMemberInfo(userId, pwd);
            member.setAutoLoginFlag(request.getParameter("autoLogin"));

            if (member != null) {
                session.setAttribute("member", member);
                session.setAttribute("logInFlag", "true");

                //체크빡스 체크되면 쿠키에userid저장
                String rememberMe = request.getParameter("rememberMe");
                if (rememberMe != null && "on".equals(rememberMe)) {
                    Cookie cookie = new Cookie("savedUserId", member.getUserId());
                    cookie.setMaxAge(60 * 60);  //1시간임
                    response.addCookie(cookie);
                } else {
                    //선택안하면 쿠키삭제
                    Cookie cookie = new Cookie("savedUserId", null);
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }

                response.sendRedirect("index.jsp"); //로그인되면 메인페이지로 리다이렉트
            } else {
                //실패하면 alert창
                out.println("<script>alert('떙'); location.href='login.jsp';</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('문제가 있음ㅇㅇ" + e.getMessage() + "'); location.href='login.jsp';</script>");
        }
    } else {
        out.println("<script>alert('똑바로 적으샘'); location.href='login.jsp';</script>");
    }
%>
