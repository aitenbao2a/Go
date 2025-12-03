package util;

import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
public class SessionUtil {
    
    private static final String USER_SESSION_KEY = "currentUser";
    private static final String USER_ID_KEY = "currentUserId";

    public static void setUserSession(HttpServletRequest request, User user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(USER_SESSION_KEY, user);
        session.setAttribute(USER_ID_KEY, user.getUserId()); 
        session.setMaxInactiveInterval(30 * 60); // Timeout sau 30 phút
    }
    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute(USER_SESSION_KEY) != null;
    }

    public static void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    public static int getUserId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Integer userId = (Integer) session.getAttribute(USER_ID_KEY);
            return userId != null ? userId : 0;
        }
        return 0;
    }
}