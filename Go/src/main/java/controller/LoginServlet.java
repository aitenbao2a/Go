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
        // Nếu đã đăng nhập, redirect về trang chủ
        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect("view/home.jsp");
            return;
        }

        // Mở modal login mặc định
        request.setAttribute("showLoginModal", true);
        request.getRequestDispatcher("view/login_error_login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean hasError = false;

        // Lưu giá trị email đã nhập để giữ lại khi lỗi
        request.setAttribute("emailValue", email);

        // Validate email
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("emailError", "Email không hợp lệ");
            hasError = true;
        }

        // Validate password
        if (!ValidationUtil.isNotEmpty(password)) {
            request.setAttribute("passwordError", "Vui lòng nhập mật khẩu");
            hasError = true;
        }

        // Nếu có lỗi input, hiển thị lại form với lỗi
        if (hasError) {
            request.setAttribute("showLoginModal", true); // mở modal login khi forward
            request.getRequestDispatcher("view/login_error_login.jsp").forward(request, response);
            return;
        }

        // Tìm user theo email
        User user = userDAO.findByEmail(email);

        if (user == null || !password.equals(user.getPasswordHash())) {
            // Lỗi chung: email hoặc password không đúng
            request.setAttribute("loginError", "Email hoặc mật khẩu không đúng");
            request.setAttribute("showLoginModal", true); // mở modal login khi forward
            request.getRequestDispatcher("view/login_error_login.jsp").forward(request, response);
            return;
        }

        // Đăng nhập thành công
        SessionUtil.setUserSession(request, user);
        response.sendRedirect("view/home.jsp");
    }
}
