package controller;

import dao.HotelDAO;
import dao.RoomDAO;
import dao.ReviewDAO;
import model.Hotel;
import model.Room;
import model.Review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/hotel-detail")
public class HotelDetailServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // Lấy hotelId từ parameter
            String idParam = request.getParameter("id");
            
            System.out.println("=== DEBUG HotelDetailServlet ===");
            System.out.println("Request URI: " + request.getRequestURI());
            System.out.println("Parameter 'id': " + idParam);
            
            if (idParam == null || idParam.trim().isEmpty()) {
                System.out.println("ERROR: hotelId is null or empty");
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            
            int hotelId = Integer.parseInt(idParam);
            System.out.println("Parsed hotelId: " + hotelId);
            
            // Khởi tạo DAO
            HotelDAO hotelDAO = new HotelDAO();
            RoomDAO roomDAO = new RoomDAO();
            ReviewDAO reviewDAO = new ReviewDAO();
            
            // 1. Lấy thông tin khách sạn
            Hotel hotel = hotelDAO.getHotelById(hotelId);
            System.out.println("Hotel found: " + (hotel != null ? hotel.getHotelName() : "NULL"));
            
            if (hotel == null) {
                System.out.println("ERROR: Hotel not found for ID: " + hotelId);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            
            // 2. Lấy danh sách phòng
            List<Room> rooms = roomDAO.getRoomsByHotelId(hotelId);
            System.out.println("Rooms found: " + (rooms != null ? rooms.size() : 0));
            
            // 3. Lấy danh sách đánh giá
            List<Review> reviews = reviewDAO.getReviewsByHotelId(hotelId);
            System.out.println("Reviews found: " + (reviews != null ? reviews.size() : 0));
            
            if (reviews != null && !reviews.isEmpty()) {
                System.out.println("First review: " + reviews.get(0).getUserName() + " - " + reviews.get(0).getRating() + " stars");
            }
            
            // 4. Tính điểm trung bình
            double averageRating = reviewDAO.getAverageRating(hotelId);
            System.out.println("Average rating: " + averageRating);
            
            // 5. Đếm số lượng đánh giá
            int reviewCount = reviewDAO.getReviewCount(hotelId);
            System.out.println("Review count: " + reviewCount);
            
            // Set attributes
            request.setAttribute("hotel", hotel);
            request.setAttribute("listRooms", rooms);
            request.setAttribute("listReviews", reviews);
            request.setAttribute("averageRating", averageRating);
            request.setAttribute("reviewCount", reviewCount);
            
            // Forward đến JSP - Kiểm tra đường dẫn này
            String jspPath = "/view/hotel_detail.jsp";
            System.out.println("Forwarding to: " + jspPath);
            
            request.getRequestDispatcher(jspPath).forward(request, response);
            System.out.println("=== END DEBUG ===");
            
        } catch (NumberFormatException e) {
            System.out.println("ERROR: Invalid hotelId format - " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (Exception e) {
            System.out.println("ERROR: Exception occurred - " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}