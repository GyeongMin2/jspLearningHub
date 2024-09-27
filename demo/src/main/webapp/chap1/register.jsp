<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-25
  Time: PM 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="DBConnection.DatabaseConnectionManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
    public Map<String, String> checkNull(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String ssn = request.getParameter("ssn");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String birthday = request.getParameter("birthday");
        String jobCode = request.getParameter("jobCode");

        Map<String, String> infoMap = new HashMap<>();

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
    <title>Title</title>
</head>
<body>
<%
    String message = "";
    Map<String, String> userInfoMap = checkNull(request);
    if (userInfoMap != null) {
        //INSERT INTO tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES
        try {
            String sql = "INSERT INTO tbl_member (userId, name, pwd, ssn, addr1, addr2, birthday, jobCode) VALUES(?,?,sha2(?,256),?,?,?,?,?)";
            try (DatabaseConnectionManager databaseConnectionManager = DatabaseConnectionManager.getInstance("mysql");
                 Connection connection = databaseConnectionManager.connectDirect();
                 PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, userInfoMap.get("userId"));
                statement.setString(2, userInfoMap.get("name"));
                statement.setString(3, userInfoMap.get("pwd"));
                statement.setString(4, userInfoMap.get("ssn"));
                statement.setString(5, userInfoMap.get("addr1"));
                statement.setString(6, userInfoMap.get("addr2"));
                statement.setString(7, userInfoMap.get("birthday"));
                statement.setString(8, userInfoMap.get("jobCode"));
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    message = "회원가입 성공한듯";
//                        out.println("<p>회원가입 성공한듯</p>");
                } else {
                    message = "회원가입 실패인듯ㅋㅋ";
//                        out.println("<p>회원가입 실패한듯 ㅋㅋ</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        message = "빈값 있는듯";
//                out.println("<p>빈값 있는듯</p>");
    }
%>
<script>
    setTimeout(() => {
        alert("<%= message %>");
        window.location.href = "index.jsp";
    }, 0)
</script>
</body>
</html>
