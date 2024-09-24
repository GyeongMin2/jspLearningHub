<%--
  Created by IntelliJ IDEA.
  User: full5-8
  Date: 2024-09-24
  Time: AM 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <script src="./jquery-3.7.1.min.js"></script>
    <%--    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>--%>
    <title>Title</title>
    </style>
</head>
<body>
<div> 기본정보</div>
<style>
    .openModal {
        position: absolute;
    }

    .black-bg {
        width: 100%;
        height: 100%;
        position: fixed;
        background: rgba(0, 0, 0, 0.5);
        z-index: 5;
        padding: 30px;
        /* display: none; */
        visibility: hidden;
        opacity: 0;
        transition: all 0.5s;
    }

    .white-bg {
        background: white;
        border-radius: 5px;
        padding: 30px;
    }

    .show {
        visibility: visible;
        opacity: 1;
    }


</style>
<div class="black-bg show">
    <div class="white-bg">
        <h4>팝업창임</h4>
        <button class="btn" id="close">닫기</button>
        하루동안 보지않기<input type="checkbox" id="checkBox">
    </div>
</div>
<script>

    function getCookie(name) {
        const cookieArr = document.cookie.split(";");
        for (let cookie of cookieArr) {
            const [key, value] = cookie.trim().split("=");
            if (key === name) {
                return value;
            }
        }
        return null;
    }

    function toBoolean(str) {
        if (str === "true") return true;
        if (str === "false") return false;
        return Boolean(str);
    }


    $('.btn').on('click', () => {
        $('.black-bg').removeClass('show');
        let expiresDate = new Date(Date.now() + (24 * 60 * 60 * 1000));
        let hidePopupFlag = $('#checkBox').is(':checked');

        document.cookie = "hidePopupToday=" + hidePopupFlag + "; expires=" + expiresDate.toUTCString() + "; path=/";
        console.log(document.cookie);


    });


    setTimeout(() => {
        let hidePopupFlag = toBoolean(getCookie('hidePopupToday'))
        let jspCookie = toBoolean(getCookie('jspPopUpStatus'))
        if (!jspCookie) {
            console.log("체크됨");
            $.ajax({
                url: "./popup_ajax_Test.jsp",
                type: "get",
                data: {hidePopupFlag: hidePopupFlag},
                dataType: "text",
                success: (res) => {
                    location.reload();
                },
                error: (xhr, status, error) => {
                    console.error("AJAX 요청 안됨", error);
                }
            });
        } else {
            console.log("체크 안됨");
        }
    }, 0)

</script>
</body>
</html>
