package util;

import model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class SessionUtil {

    private static final String USER_SESSION_KEY = "user";

    /**
     * Lưu user vào session
     */
    public static void setUserSession(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        session.setAttribute(USER_SESSION_KEY, user);
    }

    /**
     * Lấy user từ session
     */
    public static User getUserFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (User) session.getAttribute(USER_SESSION_KEY);
        }
        return null;
    }

    /**
     * Kiểm tra user đã đăng nhập chưa
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getUserFromSession(request) != null;
    }

    /**
     * Xóa user khỏi session (logout)
     */
    public static void clearUserSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute(USER_SESSION_KEY);
            // Hoặc có thể invalidate toàn bộ session:
            // session.invalidate();
        }
    }

    /**
     * Lấy email của user đang đăng nhập
     */
    public static String getUserEmail(HttpServletRequest request) {
        User user = getUserFromSession(request);
        return user != null ? user.getEmail() : null;
    }

    /**
     * Lấy ID của user đang đăng nhập
     */
    public static Integer getUserId(HttpServletRequest request) {
        User user = getUserFromSession(request);
        return user != null ? user.getUserId() : null;
    }
}