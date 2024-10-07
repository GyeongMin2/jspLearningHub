<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-10-07
  Time: PM 1:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="fullstack7.member.MemberDTO" %>
<%!
    List<MemberDTO> memberArr = new ArrayList<>();
    MemberDTO member1 = new MemberDTO("admin", "Gyeongmin", "adminpwd");
    MemberDTO member2 = new MemberDTO("admi2", "Gyeongmini", "adminpwd2");
    int num1 = 0;
    int num2 = 10;
    int num3 = 100;
    int num4 = 1000;
    int num5 = 10000;
%>
<%
    pageContext.setAttribute("member1", member1);
    pageContext.setAttribute("member2", member2);
    pageContext.setAttribute("num1", num1);
    pageContext.setAttribute("num2", num2);
    pageContext.setAttribute("num3", num3);
    pageContext.setAttribute("num4", num4);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <li>멤버1 userId : ${member1.userId}</li>
    <li>멤버1 userName : ${member1.name}</li>
    <li>멤버1 pwd : ${member1.pwd}</li>
</ul>
<ul>
    <li>멤버2 userId : ${member2.userId}</li>
    <li>멤버2 userName : ${member2.name}</li>
    <li>멤버2 pwd : ${member2.pwd}</li>
</ul>
<ul>
    <li>스크립틀릿에서 선언 : ${num5}</li>
    <li>pageContext : ${num1}</li>
</ul>
<ul>
    <li>${num1+num2}</li>
    <li>${num2-num1}</li>
    <li>${num2*num3}</li>
    <li>${num3/num2}</li>
    <li>${num3 div num2}</li>
    <li>${num3%num2}</li>
</ul>
<ul>
    <li>${num2+"14"}</li>
    <li>${"100"-num2}</li>
    <%--    <%--%>
    <%--        pageContext.setAttribute("hello", "Hello");--%>
    <%--        pageContext.setAttribute("world", "World");--%>
    <%--    %>--%>
    <%--    <li>${hello+ " " + world}</li>--%>

</ul>
<ul>
    <li>${num1 == num2} :: ${num1 eq num2}</li>
    <li>${num1 != num2} :: ${num1 ne num2}</li>
    <li>${num1 < num2} :: ${num1 lt num2}</li>
    <li>${num1 > num2} :: ${num1 gt num2}</li>
    <li>${num1 <= num2} :: ${num1 le num2}</li>
    <li>${num1 >= num2} :: ${num1 ge num2}</li>
</ul>
<ul>
    <li>${num1 == num2 && num3 > num2} :: ${num1 eq num2 and num3 gt num2}</li>
    <li>${num1 != num2 || num3 > num2} :: ${num1 ne num2 or num3 gt num2}</li>
</ul>
<ul>
    <%
        pageContext.setAttribute("strEmpty", "");
        pageContext.setAttribute("strNull", null);
        pageContext.setAttribute("num0", new Integer[0]);
        pageContext.setAttribute("arrList", new ArrayList<Object>());
    %>
    <li>strEmpty : ${empty strEmpty}</li>
    <li>strNull : ${empty strNull}</li>
    <li>num0 : ${empty num0}</li>
    <li>arrList : ${empty arrList}</li>
</ul>
<ul>
    <li>삼항 연산 결과: ${num1 eq num2 ? "같아" : "달라달라"}</li>
</ul>
</body>
</html>
