<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-24
  Time: AM 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.PrintWriter" %>
<%!
    public Cookie setCookie(String key, String value, Integer timeOut, HttpServletRequest request, HttpServletResponse response) {
        Cookie a = new Cookie(key, value);
        a.setPath(request.getContextPath());
        a.setMaxAge(timeOut);
        response.addCookie(a);
        return a;
    }

    public Cookie[] setCookieArr(String key, String value, Integer timeOut, HttpServletRequest request, HttpServletResponse response) {
        Cookie a[] = {new Cookie(key, value)};
        a[0].setPath(request.getContextPath());
        a[0].setMaxAge(timeOut);
        response.addCookie(a[0]);
        return a;
    }

    public void getCookie(Cookie[] ck, PrintWriter out) {
        Cookie[] cookies = ck;
        if (cookies != null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                String cookieValue = c.getValue();
                out.print(String.format("%s : %s<br>", cookieName, cookieValue));
            }
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //    Cookie[] ckArr = {new Cookie("쿠키1 키", "쿠키1 벨류"), new Cookie("쿠키2 키", "쿠키2 벨류"), new Cookie("쿠키3 키", "쿠키3 벨류")};
//
//    Arrays.stream(ckArr).forEach((a) -> {
//        a.setPath(request.getContextPath());
//        a.setMaxAge(3600);
//        response.addCookie(a);
//    });
    Cookie[] ckArr = {
//            new Cookie("Cookie1", "쿠키1 벨류"),
//            new Cookie("Cookie2", "쿠키2 벨류"),
//            new Cookie("Cookie3", "쿠키3 벨류")
            new Cookie("Cookie1", URLEncoder.encode("쿠키1벨류", "UTF-8")),
            new Cookie("Cookie2", URLEncoder.encode("쿠키2벨류", "UTF-8")),
            new Cookie("Cookie3", URLEncoder.encode("쿠키3벨류", "UTF-8"))
    };

    for (Cookie a : ckArr) {
        a.setPath(request.getContextPath());
        a.setMaxAge(3600);
        response.addCookie(a);
    }
//    getCookie(setCookie("testCookie", "testCookieValue", 3600));

    setCookie("testCookie", "testCookieValue", 1, request, response);

    getCookie(request.getCookies(), response.getWriter());

    getCookie(setCookieArr("testCookieArr2", "testCookieValue2", 1, request, response), response.getWriter());
//    getCookie(request.getCookies());
%>

<script>
    console.log(document.cookie);

    // for (let test of ck) {
    //     console.log(test)
    //
    //     if (k == name) {
    //         console.log(JSON.parse(decodeURIComponent(v)))
    //     }
    // }

    function cookieToJson() {
        const cookies = document.cookie.trim().split(";");
        const cookieObject = {};
        cookies.forEach(cookie => {
            const [key, value] = cookie.split("=");
            cookieObject[key] = decodeURIComponent(value);
        });
        return cookieObject;
    }

    let objCookie = cookieToJson();

    // function jsonPasser(obj) {
    //     let cookieArr = obj.split("=");
    //     for (let ck of cookieArr) {
    //         const [k, v] = ck.trim().split("=");
    //         if (k == name) {
    //             return JSON.parse(decodeURIComponent(v))
    //         }
    //     }
    // }
    //
    // console.log(jsonPasser(ck))


</script>
</body>
</html>
