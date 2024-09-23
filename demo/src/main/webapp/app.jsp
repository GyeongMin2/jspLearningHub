<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" %>
<%@ page import="dto.StudentDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    List<String> testList = new ArrayList<>();
    testList.add("C.Ronaldo");
    testList.add("강경민");
    testList.add("닌자");
    application.setAttribute("lst", testList);

    Map<String, StudentDTO> maps = new HashMap<>();
    maps.put("1번학생", new StudentDTO("20210101", "호날두", 1, 19, "문과"));
    maps.put("2번학생", new StudentDTO("20200000", "C.Ronaldo", 2, 25, "무화과"));
//    maps.forEach((key,value)->{});
    application.setAttribute("maps", maps);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List<String> resLst = (List<String>) application.getAttribute("lst");
    Map<String, StudentDTO> resMaps = (Map<String, StudentDTO>) application.getAttribute("maps");
    Set<String> keys = resMaps.keySet();
    if (resMaps != null) {
        for (String key : keys) {
            StudentDTO std = resMaps.get(key);
            out.println(key + " : " + std.toString() + "<br>");
        }
    }
    if (resLst != null) {
        for (String value : resLst) {
            out.println(value + "<br>");
        }
    }
%>
</body>
</html>
