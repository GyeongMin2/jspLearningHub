<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<style>
    #testDiv1 {
        margin: 10px;
        width: 100px;
        height: 100px;
        background-color: black;
    }

    .disNone {
        display: none;
    }
</style>
<h1><%="Hello World!"%>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<%
    String str1 = "JSP";
    String str2 = "Hello World";
%>
<%!
    int i = 100;

    public int add(int a, int b) {
        return a + b;
    }
%>
<h2><%=str1%>테스트페이지</h2>
<input type="color">
<button id="btn1">버튼임</button>
<div id="testDiv1"></div>
<button id="delBtn">뿅!</button>
<script>
    <%
    String a = "강경민";
    %>

    let name = "<%=a%>";
    let b = 0;
    console.log(name);
    document.querySelector('#btn1').addEventListener("click", () => {
        stmout("helloWorld");
    })

    document.querySelector('#delBtn').addEventListener("click", () => {
        document.querySelector('#testDiv1').classList.toggle("disNone");
    })

    function stmout(a) {
        console.log(a + " " + b)
        b++;
    }
</script>

<p>
    <%
        out.println(str1 + " " + str2);
    %>
</p>
</body>
</html>