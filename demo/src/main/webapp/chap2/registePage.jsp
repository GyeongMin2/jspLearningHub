<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="dbModule.MySqlDbModule" %>
<%@ page import="java.sql.SQLException" %>
<%!
    public LinkedHashMap<String, String> checkNull(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String ssn = request.getParameter("ssn");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String birthday = request.getParameter("birthday");
        String jobCode = request.getParameter("jobCode");

        LinkedHashMap<String, String> infoMap = new LinkedHashMap<>();

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

        infoMap.put("userId", userId);
        infoMap.put("name", name);
        infoMap.put("pwd", pwd);
        infoMap.put("ssn", ssn);
        infoMap.put("addr1", addr1);
        infoMap.put("addr2", addr2);
        infoMap.put("birthday", birthday);
        infoMap.put("jobCode", jobCode);

        return infoMap;
    }
%>
<html>
<head>
    <title>회원 등록 페이지</title>
</head>
<body>
<%
    LinkedHashMap<String, String> originalMap = checkNull(request);
    if (originalMap != null) {
        Map<String, String> infoMap = new LinkedHashMap<>(originalMap);

        String sql = "INSERT INTO FULLSTACK7.tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES (?, ?,sha2(?,256), ?, ?, ?, ?, ?)";
        String[] parameter = infoMap.values().toArray(new String[0]);
        int res = 0;

        try (MySqlDbModule mySqlDbModule = new MySqlDbModule()) {
            res = mySqlDbModule.insertQuery(sql, parameter);
            if (res > 0) {
                out.println("<script>alert('성공'); location.href='index.jsp';</script>");
            } else {
                out.println("<script>alert('실패ㅋㅋ'); history.back();</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('SQL 오류임 " + e.getMessage() + "'); history.back();</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('아무튼 오류 " + e.getMessage() + "'); history.back();</script>");
        }
    } else {
        out.println("<script>alert('똑바로 입력하샘'); history.back();</script>");
    }
%>
</body>
</html>
