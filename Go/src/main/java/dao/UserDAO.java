package dao; 

import model.User;
import dao.DBContext; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User findByEmail(String email) {
        // Cần lấy tất cả các cột cần thiết, bao gồm password_hash
        String sql = "SELECT user_id, email, password_hash, full_name, phone, is_active FROM users WHERE email = ?";
        User user = null;
        
        try (Connection conn = DBContext.getConnection(); // Sử dụng try-with-resources để tự động đóng Connection
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setEmail(rs.getString("email"));
                    user.setPasswordHash(rs.getString("password_hash")); // RẤT QUAN TRỌNG
                    user.setFullName(rs.getString("full_name"));
                    user.setPhone(rs.getString("phone"));
                    user.setActive(rs.getBoolean("is_active"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Phương thức này có thể được dùng trong RegisterServlet
    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(user_id) FROM users WHERE email = ?";
        boolean exists = false;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    exists = rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }
    
    // Phương thức này được dùng trong RegisterServlet
    public boolean createUser(User user) {
        String sql = "INSERT INTO users (email, password_hash, full_name, phone) VALUES (?, ?, ?, ?)";
        int result = 0;
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());
            ps.setString(4, user.getPhone());
            
            result = ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result > 0;
    }
}