package dao;

import model.User;
import dao.DBCon;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
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
		String sql = "INSERT INTO User (userId, email, passwordHash, fullName, phone, dateOfBirth, createdAt, updatedAt, isActive) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
		int result = 0;

		try (Connection conn = DBCon.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPasswordHash());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getPhone());
			ps.setTime(5, (Time) user.getDateOfBirth());
			ps.setTimestamp(6, user.getCreatedAt());
			ps.setTimestamp(7, user.getUpdatedAt());
			ps.setBoolean(8, true);

			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result > 0;
	}
}