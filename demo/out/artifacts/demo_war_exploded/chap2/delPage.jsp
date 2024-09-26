<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-26
  Time: AM 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dbModule.MySqlDbModule" %>
<%@ page import="java.util.*" %>
<%
    String[] userIds = request.getParameterValues("userId");
    int res = 0;

    if (userIds != null && userIds.length > 0) {
        String sql = "DELETE FROM tbl_member WHERE userId = ?";
        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
            for (String userId : userIds) {
                res = mySqlDbModule.deleteQuery(sql, new String[]{userId});
                if (res > 0) {
                    System.out.println("delete success");
                } else {
                    out.println("<script>alert('삭제 실패'); history.back();</script>");
                }
            }
            out.println("<script>alert('삭제됨ㅅㄱ'); location.href='index.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('안됨" + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('선택하샘'); history.back();</script>");
    }
%>
