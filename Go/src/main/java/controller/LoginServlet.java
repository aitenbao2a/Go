package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Giả lập kiểm tra tài khoản (test@agoda.com / 123)
		if ("test@agoda.com".equals(email) && "123".equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", email);
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng (Thử: test@agoda.com / 123)");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	// Xử lý Đăng xuất (Logout)
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