<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    Integer rowsPerPage = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize")) : 5;
    session.setAttribute("pageSize", rowsPerPage);
    response.sendRedirect("paging.jsp?page=1"); // 설정 변경 후 첫 페이지로 이동
%>