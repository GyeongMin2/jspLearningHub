<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="DBConnection.DbConnection" %>
Created by IntelliJ IDEA.
User: full5-8
Date: 2024-09-25
Time: PM 5:37
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
    public Map<String, String> checkNull(HttpServletRequest request) {
        Map<String, String> userModifyInfo = new LinkedHashMap<>();
        Map<String, String[]> parameterMap = request.getParameterMap();

        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            userModifyInfo.put(entry.getKey(), entry.getValue()[0]);
        }

        for (Map.Entry<String, String> entry : userModifyInfo.entrySet()) {
            String value = entry.getValue();

            if (value == null || value.trim().isEmpty()) {
                return null;
            }
        }

        return userModifyInfo; //합격하면 map 리턴
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
        String userId = userInfoMap.get("userId");
        if (userId != null) {
            userInfoMap.remove("userId");
            try {
                String sql = "UPDATE tbl_member SET name = ?, pwd = ?, ssn = ?, addr1 = ?, addr2 = ?, birthday = ?, jobCode = ?, mileage = ?, memberState = ? WHERE userId = ?";
                try (DbConnection dbConnection = DbConnection.getInstance("mysql");
                     Connection connection = dbConnection.connectDirect();
                     PreparedStatement statement = connection.prepareStatement(sql)) {

                    int index = 1;
                    for (String value : userInfoMap.values()) {
                        statement.setString(index++, value);
                    }

                    statement.setString(index, userId);

                    int rowsUpdated = statement.executeUpdate();

                    if (rowsUpdated > 0) {
                        message = "업데이트 성공";
                    } else {
                        message = "업데이트 실패";
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    message = "업데이트 실패 (오류남1)" + e.getMessage();
                }
            } catch (Exception e) {
                e.printStackTrace();
                message = "업데이트 실패 (오류남)";
            }
        } else {
            message = "userId 값이 비어있음";
        }
    } else {
        message = "빈값 있는듯";
    }

%>
<script>
    (() => {
        alert("<%= message %>");
        location.assign("http://localhost:8080/demo_war_exploded/memberView.jsp?userId=<%=request.getParameter("userId")%>")
    })();
</script>
</body>
</html>
