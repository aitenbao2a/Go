package controller;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;
import util.SessionUtil;
import util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

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
        
        request.getRequestDispatcher("view/login_error_login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validate input
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Email không hợp lệ");
            request.getRequestDispatcher("login_error_login.jsp").forward(request, response);
            return;
        }
        
        if (!ValidationUtil.isNotEmpty(password)) {
            request.setAttribute("error", "Vui lòng nhập mật khẩu");
            request.getRequestDispatcher("login_error_login.jsp").forward(request, response);
            return;
        }
        
        // Tìm user
        User user = userDAO.findByEmail(email);
        
        if (user == null) {
            request.setAttribute("error", "Email hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login_error_login.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra mật khẩu
        if (!password.equals(user.getPasswordHash())) {
            request.setAttribute("error", "Email hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login_error_login.jsp").forward(request, response);
            return;
        }
        
        // Đăng nhập thành công
        SessionUtil.setUserSession(request, user);
        
        // Redirect về trang trước đó hoặc trang chủ
        String redirectUrl = request.getParameter("redirect");
        if (redirectUrl != null && !redirectUrl.isEmpty()) {
            response.sendRedirect(redirectUrl);
        } else {
            response.sendRedirect("view/home.jsp");
        }
    }
}