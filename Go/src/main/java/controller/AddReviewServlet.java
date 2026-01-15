package controller;

import dao.ReviewDAO;
import model.Review;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addReview")
public class AddReviewServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set encoding để xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Kiểm tra đăng nhập
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Lấy thông tin user đang đăng nhập
        User user = (User) session.getAttribute("user");
        
        try {
            // Lấy dữ liệu từ form
            String hotelIdParam = request.getParameter("hotelId");
            String ratingParam = request.getParameter("rating");
            String comment = request.getParameter("comment");
            
            // Validate dữ liệu
            if (hotelIdParam == null || ratingParam == null || comment == null ||
                hotelIdParam.trim().isEmpty() || ratingParam.trim().isEmpty() || comment.trim().isEmpty()) {
                session.setAttribute("error", "Vui lòng điền đầy đủ thông tin đánh giá!");
                response.sendRedirect(request.getContextPath() + "/hotel-detail?id=" + hotelIdParam);
                return;
            }
            
            int hotelId = Integer.parseInt(hotelIdParam);
            int rating = Integer.parseInt(ratingParam);
            
            // Validate rating từ 1-5
            if (rating < 1 || rating > 5) {
                session.setAttribute("error", "Đánh giá phải từ 1 đến 5 sao!");
                response.sendRedirect(request.getContextPath() + "/hotel-detail?id=" + hotelId);
                return;
            }
            
            ReviewDAO reviewDAO = new ReviewDAO();
            
            // Kiểm tra user đã đánh giá khách sạn này chưa
            if (reviewDAO.hasUserReviewed(user.getUserId(), hotelId)) {
                session.setAttribute("error", "Bạn đã đánh giá khách sạn này rồi!");
                response.sendRedirect(request.getContextPath() + "/hotel-detail?id=" + hotelId);
                return;
            }

            // Tạo đối tượng Review mới
            Review review = new Review();
            review.setUserId(user.getUserId());
            review.setHotelId(hotelId);
            review.setRating(rating);
            review.setComment(comment.trim());

            // Lưu review vào database
            boolean success = reviewDAO.addReview(review);

            if (success) {
                session.setAttribute("success", "Cảm ơn bạn đã đánh giá! Đánh giá của bạn đã được gửi thành công.");
            } else {
                session.setAttribute("error", "Có lỗi xảy ra khi gửi đánh giá. Vui lòng thử lại sau!");
            }

            // Redirect về trang chi tiết khách sạn
            response.sendRedirect(request.getContextPath() + "/hotel-detail?id=" + hotelId);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("error", "Dữ liệu không hợp lệ!");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Đã xảy ra lỗi hệ thống. Vui lòng thử lại sau!");
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Không cho phép GET method
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}