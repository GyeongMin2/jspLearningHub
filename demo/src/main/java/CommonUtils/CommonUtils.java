package CommonUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;

public class CommonUtils {
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

    public String getCookie(String key, Cookie[] ck) {
        if (ck != null) {
            for (Cookie c : ck) {
                if (c.getName().equals(key)) {
                    return c.getValue();
                }
            }
        }
        return null;
    }
}
