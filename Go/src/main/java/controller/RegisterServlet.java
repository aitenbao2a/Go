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
            response.sendRedirect("view/login_error_login.jsp");
            return;
        }
        
        request.getRequestDispatcher("view/login_error_register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        boolean hasError = false;

        // Email validation
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("emailError", "Email không hợp lệ");
            hasError = true;
        }

        // Password validation
        if (!PasswordUtil.isValidPassword(password)) {
            request.setAttribute("passwordError", "Mật khẩu phải có ít nhất 8 ký tự, gồm chữ hoa, chữ thường và số");
            hasError = true;
        }

        // Confirm password validation
        if (password != null && confirmPassword != null && !password.equals(confirmPassword)) {
            request.setAttribute("confirmPasswordError", "Mật khẩu xác nhận không khớp");
            hasError = true;
        }

        // Email đã tồn tại
        if (userDAO.emailExists(email)) {
            request.setAttribute("emailError", "Email đã được sử dụng");
            hasError = true;
        }

        if (hasError) {
            // Giữ lại các giá trị đã nhập
            request.setAttribute("emailValue", email);
            request.getRequestDispatcher("view/login_error_register.jsp").forward(request, response);
            return;
        }

        // Tạo user mới
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setPasswordHash(password);
        newUser.setFullName(null);
        newUser.setPhone(null);
        newUser.setDateOfBirth(null);
        newUser.setActive(true);

        if (userDAO.createUser(newUser)) {
            SessionUtil.setUserSession(request, newUser);
            response.sendRedirect("view/login_error_login.jsp");
        } else {
            request.setAttribute("generalError", "Đã xảy ra lỗi, vui lòng thử lại");
            request.getRequestDispatcher("view/login_error_register.jsp").forward(request, response);
        }
    }
}