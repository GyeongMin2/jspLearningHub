<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-26
  Time: PM 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dbModule.MySqlDbModule" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>
<%!
    public String[] checkNull(HttpServletRequest request) {
        String userId = request.getParameter("userId");
        String pwd = request.getParameter("pwd");

        if (userId == null || userId.trim().isEmpty() || pwd == null || pwd.trim().isEmpty()) {
            return null;
        }

        return new String[]{userId, pwd};
    }
%>
<%
    String sql = "SELECT userId,name,pwd FROM tbl_member WHERE userId = ? and password = ?";
    List<Map<String, Object>> resList = null;
    int resSession = 0;
    try (MySqlDbModule mySqlDbModule = new MySqlDbModule();) {
        if (checkNull(request) != null) {
            resList = mySqlDbModule.getQueryResultList(sql, checkNull(request));
            if (resList != null && !resList.isEmpty()) {
                String userId = resList.get(0).get("userId").toString();
                String pwd = resList.get(0).get("pwd").toString();
                String name = resList.get(0).get("name").toString();
                session.setAttribute("userId", userId);
                session.setAttribute("name", name);
                session.setAttribute("logInFlag", "true");
                try (MySqlDbModule mySqlDbModule2 = new MySqlDbModule();) {
//                session_id VARCHAR(128) PRIMARY KEY,
//                session_attribute VARCHAR(100),
//                creation_time DATETIME NOT NULL,
//                last_access_time DATETIME NOT null,
//                userId varchar(20) not null,
//                pwd varchar(20) not null
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String sql2 = "INSERT INTO SessionInfo VALUES(?,?,?,?,?,?)";
                    String[] para2 = {session.getId(), "loginSession", dateFormat.format(new Date(session.getCreationTime())), dateFormat.format(new Date(session.getLastAccessedTime())), userId, pwd};
                    resSession = mySqlDbModule.insertQuery(sql2, para2);
                    if (resSession > 0) {
                        System.out.println("Insert sessionInfo success");
                    } else {
                        System.out.println("Insert sessionInfo failed");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    System.out.println("sql2 error" + e.getMessage());
                }

            }
        } else {
            System.out.println("empty id or pwd parameter");
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("sql1 error" + e.getMessage());
    }
%>