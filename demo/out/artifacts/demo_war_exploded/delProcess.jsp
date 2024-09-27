<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: PM 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="fullstack7.member.*" %>
<%
    String[] userIds = request.getParameterValues("userId");
    System.out.println(userIds.length);
    if (userIds != null && userIds.length > 0) {
        try {
//            int res = new MemberDAO().deleteMember(userIds);
            int res = new MemberDAO().deleteMemberWithIn(userIds);
            if (res >= 0) {
                out.println("<script>alert('" + res + "개 삭제됨ㅅㄱ'); location.href='getMemberPage.jsp';</script>");
            } else if (res == 0) {
                out.println("<script>alert('삭제된 데이터가 없다는데요?'); location.href='getMemberPage.jsp';</script>");
            } else {
                out.println("<script>alert('삭제 실패'); history.back();</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('안됨 오류남;;" + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('선택하샘'); history.back();</script>");
    }

%>
