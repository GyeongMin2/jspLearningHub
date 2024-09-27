<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: PM 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="fullstack7.member.*" %>
<%--<tr>--%>
<%--    <th>userid</th>--%>
<%--    <th>userName</th>--%>
<%--    <th>pwd</th>--%>
<%--    <th>ssn</th>--%>
<%--    <th>addr1</th>--%>
<%--    <th>addr2</th>--%>
<%--    <th>birthDay</th>--%>
<%--    <th>jobCode</th>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--    <td><input type="text" name="userId" id="userId"></td>--%>
<%--    <td><input type="text" name="name" id="name"></td>--%>
<%--    <td><input type="password" name="pwd" id="pwd"></td>--%>
<%--    <td><input type="text" name="ssn" id="ssn"></td>--%>
<%--    <td><input type="text" name="addr1" id="addr1"></td>--%>
<%--    <td><input type="text" name="addr2" id="addr2"></td>--%>
<%--    <td><input type="date" name="birthday" id="birthDay"></td>--%>
<%--    <td><input type="text" name="jobCode" id="jobCode"></td>--%>
<%--</tr>--%>
<%!
    public MemberDTO checkAndCreateDTO(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String ssn = request.getParameter("ssn");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String birthday = request.getParameter("birthday");
        String jobCode = request.getParameter("jobCode");

        if (userId == null || userId.trim().isEmpty() ||
                name == null || name.trim().isEmpty() ||
                pwd == null || pwd.trim().isEmpty() ||
                ssn == null || ssn.trim().isEmpty() ||
                addr1 == null || addr1.trim().isEmpty() ||
                addr2 == null || addr2.trim().isEmpty() ||
                birthday == null || birthday.trim().isEmpty() ||
                jobCode == null || jobCode.trim().isEmpty()) {
            return null;
        }

        MemberDTO member = new MemberDTO();
        member.setUserId(userId);
        member.setName(name);
        member.setPwd(pwd);
        member.setSsn(ssn);
        member.setAddr1(addr1);
        member.setAddr2(addr2);
        member.setBirthday(birthday);
        member.setJobCode(jobCode);

        return member;
    }
%>

<%
    MemberDTO member = checkAndCreateDTO(request);

    if (member != null) {
        MemberDAO memberDAO = new MemberDAO();
        int res = memberDAO.insertMember(member);

        if (res > 0) {
            out.println("<script>alert('성공'); location.href='index.jsp';</script>");
        } else {
            out.println("<script>alert('실패'); location.href='index.jsp';</script>");
        }
    } else {
        out.println("<script>alert('빈값넣지마라');location.href='index.jsp';</script>");
    }
%>