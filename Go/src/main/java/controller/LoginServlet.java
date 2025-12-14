package controller;

import dao.UserDAO;
import model.User;
import util.SessionUtil;
import util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/view/home.jsp");
            return;
        }

        request.setAttribute("showLoginModal", true);
        request.getRequestDispatcher("/view/login_error_login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean hasError = false;
        request.setAttribute("emailValue", email);

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("emailError", "Email không hợp lệ");
            hasError = true;
        }

        if (!ValidationUtil.isNotEmpty(password)) {
            request.setAttribute("passwordError", "Vui lòng nhập mật khẩu");
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("showLoginModal", true);
            request.getRequestDispatcher("/view/login_error_login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.findByEmail(email);

        if (user == null || !password.equals(user.getPasswordHash())) {
            request.setAttribute("loginError", "Email hoặc mật khẩu không đúng");
            request.setAttribute("showLoginModal", true);
            request.getRequestDispatcher("/view/login_error_login.jsp").forward(request, response);
            return;
        }

        // ===== LOGIN SUCCESS =====
        SessionUtil.setUserSession(request, user);

        response.sendRedirect(request.getContextPath() + "/view/home.jsp");
    }
}
