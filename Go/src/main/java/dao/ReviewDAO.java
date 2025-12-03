package dao; 

import model.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    // --- Private Helper Method ---
    
    /**
     * Ánh xạ dữ liệu từ ResultSet sang đối tượng Review.
     * @param rs ResultSet
     * @return Đối tượng Review
     * @throws SQLException 
     */
    private Review extractReviewFromResultSet(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setHotelId(rs.getInt("hotel_id"));
        review.setBookingId(rs.getInt("booking_id"));
        review.setRating(rs.getInt("rating"));
        review.setComment(rs.getString("comment"));
        review.setCreatedAt(rs.getTimestamp("created_at"));
        
        // Lấy tên người dùng (chỉ có khi dùng JOIN)
        try {
            review.setUserName(rs.getString("user_name"));
        } catch (SQLException e) {
            // Bỏ qua nếu cột 'user_name' không tồn tại (ví dụ: truy vấn không có JOIN)
        }
        
        return review;
    }

    // --- CRUD và Phương thức Thống kê ---

    // 1. Tạo review mới
    public boolean createReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, hotel_id, booking_id, rating, comment) " +
                    "VALUES (?, ?, ?, ?, ?)";
        
        // Sử dụng try-with-resources
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, review.getUserId());
            pstmt.setInt(2, review.getHotelId());
            pstmt.setInt(3, review.getBookingId());
            pstmt.setInt(4, review.getRating());
            pstmt.setString(5, review.getComment());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                // Lấy ID tự động tạo
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        review.setReviewId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Lỗi tạo review: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    // 2. Lấy tất cả review của hotel
    public List<Review> getReviewsByHotelId(int hotelId) {
        List<Review> reviews = new ArrayList<>();
        // Đã cập nhật JOIN sử dụng user_id để lấy full_name
        String sql = "SELECT r.*, u.full_name AS user_name " + 
                    "FROM reviews r " + 
                    "JOIN users u ON r.user_id = u.user_id " + 
                    "WHERE r.hotel_id = ? " + 
                    "ORDER BY r.created_at DESC";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, hotelId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    reviews.add(extractReviewFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy review theo Hotel ID: " + e.getMessage());
            e.printStackTrace();
        }
        return reviews;
    }
    
    // 3. Lấy review theo booking ID
    public Review getReviewByBookingId(int bookingId) {
        String sql = "SELECT r.*, u.full_name AS user_name " +
                    "FROM reviews r " +
                    "JOIN users u ON r.user_id = u.user_id " +
                    "WHERE r.booking_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, bookingId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return extractReviewFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy review theo Booking ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    // 4. Lấy điểm đánh giá trung bình của hotel
    public double getAverageRating(int hotelId) {
        String sql = "SELECT AVG(rating) AS avg_rating FROM reviews WHERE hotel_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, hotelId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Sử dụng getDouble để lấy giá trị AVG (luôn trả về double)
                    return rs.getDouble("avg_rating");
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi lấy điểm trung bình: " + e.getMessage());
            e.printStackTrace();
        }
        return 0.0;
    }
    
    // 5. Đếm số lượng review của hotel
    public int getReviewCount(int hotelId) {
        String sql = "SELECT COUNT(review_id) AS review_count FROM reviews WHERE hotel_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, hotelId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("review_count");
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi đếm review: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
    
    // 6. Kiểm tra user đã review booking này chưa
    public boolean hasUserReviewedBooking(int userId, int bookingId) {
        String sql = "SELECT review_id FROM reviews WHERE user_id = ? AND booking_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.setInt(2, bookingId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("Lỗi kiểm tra review: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    // 7. Cập nhật review
    public boolean updateReview(Review review) {
        String sql = "UPDATE reviews SET rating = ?, comment = ? WHERE review_id = ? AND user_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, review.getRating());
            pstmt.setString(2, review.getComment());
            pstmt.setInt(3, review.getReviewId());
            pstmt.setInt(4, review.getUserId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi cập nhật review: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    
    // 8. Xóa review
    public boolean deleteReview(int reviewId, int userId) {
        String sql = "DELETE FROM reviews WHERE review_id = ? AND user_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            pstmt.setInt(2, userId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Lỗi xóa review: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}