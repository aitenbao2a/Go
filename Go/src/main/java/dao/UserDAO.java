package dao;

import model.User;
import dao.DBCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.Date;

public class UserDAO {

	public User findByEmail(String email) {
		String sql = "SELECT email, passwordHash, fullName FROM User WHERE email = ?";
		User user = null;

		try (Connection conn = DBCon.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					user = new User();
					user.setEmail(rs.getString("email"));
					user.setPasswordHash(rs.getString("passwordHash"));
					user.setFullName(rs.getString("fullName"));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean emailExists(String email) {
		String sql = "SELECT COUNT(user_id) FROM users WHERE email = ?";
		boolean exists = false;

		try (Connection conn = DBCon.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

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

	public boolean createUser(User user) {
	    String sql = "INSERT INTO User (email, passwordHash, fullName, phone, dateOfBirth, createdAt, updatedAt, isActive) " +
	                 "VALUES (?, ?, ?, ?, ?, NOW(), NOW(), ?)";

	    try (Connection conn = DBCon.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) { 
	        
	        ps.setString(1, user.getEmail());
	        ps.setString(2, user.getPasswordHash());
	        ps.setString(3, user.getFullName());
	        ps.setString(4, user.getPhone());
	   
	        if (user.getDateOfBirth() != null) {
	            ps.setDate(5, new java.sql.Date(user.getDateOfBirth().getTime()));
	        } else {
	            ps.setNull(5, Types.DATE);
	        }

	        ps.setBoolean(8, true);
	        
	        int affectedRows = ps.executeUpdate();
	        
	        if (affectedRows > 0) {
	            try (ResultSet rs = ps.getGeneratedKeys()) {
	                if (rs.next()) {
	                    user.setUserId(rs.getInt(1)); 
	                }
	            }
	            return true;
	        }
	    } catch (SQLException e) {
	        System.err.println("Error creating user: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}
}