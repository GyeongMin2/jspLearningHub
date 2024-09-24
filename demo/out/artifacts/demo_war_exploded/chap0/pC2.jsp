<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-23
  Time: PM 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
    boolean rtnChg(Object param, String rntType) {
        if (param != null && rntType != null) {
            return true;
        } else return false;
    }

    public static <T> boolean rtnChg2(T param, String rntType) {
        if (param != null && rntType != null && param.getClass().getSimpleName().equals(rntType)) {
            return true;
        }
        return false;
    }
//    void rtnChg(Map<?,?> param){
//
//    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>쿼리스트링으로 받기</h2>
<%=
"학번 : " + request.getParameter("no") + "<br>" +
        "이름 : " + request.getParameter("name") + "<br>" +
        "학과 : " + request.getParameter("dept") + "<br>" +
        "학년 : " + request.getParameter("grade") + "<br>" +
        "나이 : " + request.getParameter("age") + "<br>"
%>
<h2>값으로 받기</h2>
<%
    if (pageContext.getAttribute("pageStudent") != null) {
        out.println(pageContext.getAttribute("pageStudent"));
    } else {
        out.println("값 없음 ㅅㄱ <br>");
    }
%>
<h2>json으로 받아서 js로 파싱하기</h2>
<div id="container"></div>
<script>
    <%
    String obj = request.getParameter("obj");
    %>
    const container = document.querySelector("#container")
    let objStudent = <%=obj%>;

    let objKey = Object.keys(objStudent);
    for (let i of objKey) {
        const div = document.createElement("div");
        div.innerHTML = i + ": " + objStudent[i];
        container.appendChild(div);
    }
</script>
<h2>obj 3항연산자</h2>
<%
    String no = pageContext.getAttribute("pageStNo") != null ? pageContext.getAttribute("pageStNo").toString() : null;
    String name = pageContext.getAttribute("pageStName") != null ? pageContext.getAttribute("pageStName").toString() : null;
    String dept = pageContext.getAttribute("pageStDept") != null ? pageContext.getAttribute("pageStDept").toString() : null;
    Integer grade = pageContext.getAttribute("pageStGrade") != null ? (int) pageContext.getAttribute("pageStGrade") : 0;
    Integer age = pageContext.getAttribute("pageStAge") != null ? (int) pageContext.getAttribute("pageStAge") : 0;
%>
학번:<%=(no != null ? no : "")%><br>
이름:<%=(name != null ? name : "")%><br>
학과:<%=(dept != null ? dept : "")%><br>
등등<br>
<h2>함수로</h2>
<%=rtnChg(no, "String") ? no : "" + "<br>"%>
<%=rtnChg(grade, "int") ? grade : ""%>
<%=rtnChg2(age, "Integer")%>

<%
    String asdf = "강경민";
    out.println(
            rtnChg2(asdf, "String")
    );
%>
</body>
</html>
