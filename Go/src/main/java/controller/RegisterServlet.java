package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.UserDAO;
import model.User;
import util.PasswordUtil;
import util.SessionUtil;
import util.ValidationUtil;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;
    
    @Override
    public void init() {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        if (SessionUtil.isLoggedIn(request)) {
            response.sendRedirect("login_error_login.jsp");
            return;
        }
        
        request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        
        // Validate inputs
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Email không hợp lệ");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
            return;
        }
        
        if (!ValidationUtil.isNotEmpty(fullName)) {
            request.setAttribute("error", "Vui lòng nhập họ tên");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
            return;
        }
        
        if (!PasswordUtil.isValidPassword(password)) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường và số");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
            return;
        }
        
        // Kiểm tra email đã tồn tại
        if (userDAO.emailExists(email)) {
            request.setAttribute("error", "Email đã được sử dụng");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
            return;
        }
        
        // Tạo user mới
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setPasswordHash(password);
        newUser.setFullName(fullName);
        newUser.setPhone(phone);
        
        if (userDAO.createUser(newUser)) {
            // Đăng ký thành công, tự động đăng nhập
            SessionUtil.setUserSession(request, newUser);
            response.sendRedirect("login_error_login.jsp");
        } else {
            request.setAttribute("error", "Đã xảy ra lỗi, vui lòng thử lại");
            request.getRequestDispatcher("login_error_register.jsp").forward(request, response);
        }
    }
}