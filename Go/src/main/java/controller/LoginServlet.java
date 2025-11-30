package controller;

import dao.UserDAO; // Nhớ tạo file UserDAO.java như hướng dẫn trước
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // GỌI DAO ĐỂ KẾT NỐI DATABASE THẬT
        UserDAO userDao = new UserDAO();
        // Hàm checkLogin trả về String (email) hoặc User object tùy bạn viết bên DAO
        // Giả sử bên DAO bạn viết hàm trả về String tên người dùng hoặc null
        User user = userDao.checkLogin(email, password); 

        if (user != null) {
            // Đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("account", user);
            response.sendRedirect("index.jsp");
        } else {
            // Đăng nhập thất bại -> Gửi báo lỗi về index
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không chính xác!");
            request.setAttribute("emailInput", email); // Giữ lại email để điền lại form
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
}