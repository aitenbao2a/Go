package dao;

import model.Review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    /**
     * Lấy tất cả đánh giá của một khách sạn
     * JOIN với bảng User để lấy thông tin người dùng
     */
    public List<Review> getReviewsByHotelId(int hotelId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.reviewId, r.userId, r.hotelId, r.rating, r.comment, r.createdAt, " +
                     "u.fullName, u.avatar " +
                     "FROM Review r " +
                     "INNER JOIN User u ON r.userId = u.userId " +
                     "WHERE r.hotelId = ? " +
                     "ORDER BY r.createdAt DESC";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setReviewId(rs.getInt("reviewId"));
                review.setUserId(rs.getInt("userId"));
                review.setHotelId(rs.getInt("hotelId"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                
                Timestamp timestamp = rs.getTimestamp("createdAt");
                if (timestamp != null) {
                    review.setCreatedAt(timestamp.toLocalDateTime());
                }
                
                // Thông tin từ User
                review.setUserName(rs.getString("fullName"));
                
                // Avatar: nếu null hoặc rỗng thì dùng default
                String avatar = rs.getString("avatar");
                if (avatar == null || avatar.trim().isEmpty()) {
                    String name = rs.getString("fullName");
                    avatar = "https://ui-avatars.com/api/?name=" + 
                             (name != null ? name.replace(" ", "+") : "User") +
                             "&background=667eea&color=fff&size=128";
                }
                review.setUserAvatar(avatar);
                
                reviews.add(review);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * Thêm đánh giá mới
     * Chỉ lưu userId, hotelId, rating, comment
     */
    public boolean addReview(Review review) {
        String sql = "INSERT INTO Review (userId, hotelId, rating, comment) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, review.getUserId());
            stmt.setInt(2, review.getHotelId());
            stmt.setInt(3, review.getRating());
            stmt.setString(4, review.getComment());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Tính điểm trung bình của khách sạn
     */
    public double getAverageRating(int hotelId) {
        String sql = "SELECT AVG(rating) as avgRating FROM Review WHERE hotelId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getDouble("avgRating");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }

    /**
     * Đếm số lượng đánh giá của khách sạn
     */
    public int getReviewCount(int hotelId) {
        String sql = "SELECT COUNT(*) as total FROM Review WHERE hotelId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    /**
     * Kiểm tra user đã đánh giá khách sạn này chưa
     */
    public boolean hasUserReviewed(int userId, int hotelId) {
        String sql = "SELECT COUNT(*) as count FROM Review WHERE userId = ? AND hotelId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, hotelId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("count") > 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Xóa đánh giá (chỉ user tạo ra mới được xóa)
     */
    public boolean deleteReview(int reviewId, int userId) {
        String sql = "DELETE FROM Review WHERE reviewId = ? AND userId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reviewId);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Lấy một review theo ID với thông tin user
     */
    public Review getReviewById(int reviewId) {
        String sql = "SELECT r.*, u.fullName, u.avatar " +
                     "FROM Review r " +
                     "INNER JOIN User u ON r.userId = u.userId " +
                     "WHERE r.reviewId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, reviewId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Review review = new Review();
                review.setReviewId(rs.getInt("reviewId"));
                review.setUserId(rs.getInt("userId"));
                review.setHotelId(rs.getInt("hotelId"));
                review.setRating(rs.getInt("rating"));
                review.setComment(rs.getString("comment"));
                
                Timestamp timestamp = rs.getTimestamp("createdAt");
                if (timestamp != null) {
                    review.setCreatedAt(timestamp.toLocalDateTime());
                }
                
                review.setUserName(rs.getString("fullName"));
                
                String avatar = rs.getString("avatar");
                if (avatar == null || avatar.trim().isEmpty()) {
                    String name = rs.getString("fullName");
                    avatar = "https://ui-avatars.com/api/?name=" + 
                             (name != null ? name.replace(" ", "+") : "User") +
                             "&background=667eea&color=fff&size=128";
                }
                review.setUserAvatar(avatar);
                
                return review;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}