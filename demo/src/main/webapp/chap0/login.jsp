<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String getCookie(Cookie[] ck, String key) {
        if (ck != null) {
            for (Cookie c : ck) {
                if (c.getName().equals(key)) {
                    return c.getValue();
                }
            }
        }
        return null;
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
<form id="frmLogin" method="post" action="./loginCheck.jsp">
    <fieldset>
        <label for="userId">아이디</label>
        <input type="text" name="userId" id="userId"
               value="<%=
               getCookie(request.getCookies(), "autoLoginFlag") != null && getCookie(request.getCookies(), "autoLoginFlag").equals("true") ?
                getCookie(request.getCookies(), "user_id")
                : "" %>">
        <label for="userPwd">비밀번호</label>
        <input type="password" name="userPwd" id="userPwd">
        <label for="autoLogin">아이디 저장</label>
        <input type="checkbox" name="autoLogin" id="autoLogin">
        <button type="submit">로그인</button>
    </fieldset>
</form>
</body>
</html>
