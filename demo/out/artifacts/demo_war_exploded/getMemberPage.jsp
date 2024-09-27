<%@ page import="java.util.List" %>
<%@ page import="fullstack7.member.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-27
  Time: PM 1:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="delProcess.jsp">
    <%
        List<Map<String, Object>> memberMapList = new MemberDAO().getAllMemberInfo();

        if (memberMapList != null && !memberMapList.isEmpty()) {
            List<Object> columnNames = new ArrayList<>(memberMapList.get(0).keySet());

            out.println("<table  border='1px';><tr>");
            for (Object columnName : columnNames) {
                //                memberDTOList.get(0).keySet().forEach((a) -> {
                //                    out.println("<td>" + (a != null ? a.toString() : "") + "</td>");
                //                });
                out.println("<th>" + (columnName != null ? columnName.toString() : "") + "</th>");
            }
            out.println("</tr>");

            for (Map<String, Object> map : memberMapList) {
                out.println("<tr>");
                int a = 0;
                for (Object value : map.values()) {
                    if (a == 0) {
                        out.println("<td><input class='delCheckBox' type='checkbox' name='userId' value='" + (value != null ? value.toString() : "") + "' />" + (value != null ? value.toString() : "") + "</td>");
                        a++;
                    } else {
                        out.println("<td>" + (value != null ? value.toString() : "") + "</td>");
                    }
                }
                out.println("</tr>");
            }
            out.println("</table>");
        } else out.println("<p>데이터 없는데요 ㅋㅋ</p>");
    %>
    <button type="submit">삭제뿅</button>
    <input type="checkbox" id="selectAll"> 전체 선택
    <script>
        // "전체 선택" 체크박스를 선택/해제할 때마다 실행
        document.querySelector('#selectAll').addEventListener('change', function () {
            const checkboxes = document.querySelectorAll('.delCheckBox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        const itemCheckboxes = document.querySelectorAll('.delCheckBox');
        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = document.querySelectorAll('.delCheckBox:checked').length === itemCheckboxes.length;
                document.getElementById('selectAll').checked = allChecked;
            });
        });
    </script>
</form>
<br><br>

<%--    <%--%>
<%--        List<MemberDTO> memberDTOList = new MemberDAO().getAllMemberInfoToDTO();--%>
<%--        if (memberDTOList != null && !memberDTOList.isEmpty()) {--%>
<%--            for (MemberDTO memberDTO : memberDTOList) {--%>
<%--                out.println("<tr>");--%>
<%--                out.println("<td>" + memberDTO.getUserId() + "</td>");--%>
<%--                out.println("<td>" + memberDTO.getName() + "</td>");--%>
<%--                out.println("<td>" + memberDTO.getPwd() + "</td>");--%>
<%--                out.println("</tr>");--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>
<br><br><br>
<a href="regPage.jsp">회원가입페이지</a>
</body>
</html>
