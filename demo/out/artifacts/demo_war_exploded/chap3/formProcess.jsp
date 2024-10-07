<%--<%@ page import="java.util.Map" %>--%>
<%--<%@ page import="fullstack7.member.TestMemberDTO" %>--%>
<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: full5-8--%>
<%--  Date: 2024-10-07--%>
<%--  Time: AM 10:27--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page trimDirectiveWhitespaces="true" %>--%>
<%--<%--%>
<%--    String name = request.getParameter("name");--%>
<%--    String gender = request.getParameter("gender");--%>
<%--    String school = request.getParameter("school");--%>
<%--    String userId = request.getParameter("userId");--%>
<%--    String[] hobbies = request.getParameterValues("hobbies");--%>
<%--    TestMemberDTO member = null;--%>
<%--    if (name != null && gender != null && school != null && hobbies != null && hobbies.length > 0 && userId != null) {--%>
<%--        member = new TestMemberDTO(name, gender, school, userId, hobbies);--%>
<%--        request.setAttribute("member", member);--%>
<%--    } else {--%>
<%--        response.sendRedirect("/demo_war_exploded/chap3/form1.jsp");--%>
<%--    }--%>
<%--%>--%>

<%--<ul>--%>
<%--    <li><%=name%>--%>
<%--    </li>--%>
<%--    <li><%=gender%>--%>
<%--    </li>--%>
<%--    <li><%=school%>--%>
<%--    </li>--%>
<%--    <li>--%>
<%--        <%--%>
<%--            for (String a : hobbies) {--%>
<%--                out.println(a + " ,");--%>
<%--            }--%>
<%--        %>--%>
<%--    </li>--%>
<%--</ul>--%>

<%--<%--%>
<%--    //    Map<String, String[]> parameters = request.getParameterMap();--%>
<%--//    parameters.forEach((key, values) -> {--%>
<%--//        out.println("Key: " + key + "<br/>");--%>
<%--//        out.println("Values: ");--%>
<%--//        for (String value : values) {--%>
<%--//            out.println(value + " ");--%>
<%--//        }--%>
<%--//        out.println("<br/><br/>");--%>
<%--//    });--%>
<%--    Map<String, String[]> parameters = request.getParameterMap();--%>
<%--    for (Map.Entry<String, String[]> entry : parameters.entrySet()) {--%>
<%--        out.println("Key: " + entry.getKey() + "<br/>");--%>
<%--        out.println("Values: ");--%>
<%--        for (String value : entry.getValue()) {--%>
<%--            out.println(value + " ");--%>
<%--        }--%>
<%--        out.println("<br/><br/>");--%>
<%--    }--%>
<%--%>--%>
<%--<ul>--%>
<%--    <li>${param.name}</li>--%>
<%--    <li>${param.gender}</li>--%>
<%--    <li>${param.school}</li>--%>
<%--    <li>${paramValues.hobbies}</li>--%>
<%--</ul>--%>
<%--<ul>--%>
<%--    <li>${member.name}</li>--%>
<%--    <li>${member.gender}</li>--%>
<%--    <li>${member.userId}</li>--%>
<%--    <li>${member.school}</li>--%>
<%--    <li>--%>
<%--        <%--%>
<%--            if (member.getHobbies() != null) {--%>
<%--                for (String hobby : member.getHobbies()) {--%>
<%--                    out.println(hobby + ",");--%>
<%--                }--%>
<%--            } else {--%>
<%--                out.println("취미가 없습니다.<br>");--%>
<%--            }--%>
<%--        %>--%>
<%--    </li>--%>
<%--</ul>--%>
<%--<jsp:forward page="formProcess2.jsp">--%>
<%--    <jsp:param name="age" value="10"/>--%>
<%--    <jsp:param name="message" value="hi"/>--%>
<%--</jsp:forward>--%>