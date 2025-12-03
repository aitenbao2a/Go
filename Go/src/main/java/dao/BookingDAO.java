package dao;

import model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

	public boolean createBooking(Booking booking) {
		String sql = "INSERT INTO bookings (user_id, hotel_id, room_id, check_in_date, "
				+ "check_out_date, number_of_guests, total_price, booking_status, special_requests) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBContext.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, booking.getUserId());
			pstmt.setInt(2, booking.getHotelId());
			pstmt.setInt(3, booking.getRoomId());
			pstmt.setDate(4, booking.getCheckInDate());
			pstmt.setDate(5, booking.getCheckOutDate());
			pstmt.setInt(6, booking.getNumberOfGuests());
			pstmt.setBigDecimal(7, booking.getTotalPrice());
			pstmt.setString(8, booking.getBookingStatus());
			pstmt.setString(9, booking.getSpecialRequests());

			int affectedRows = pstmt.executeUpdate();

			if (affectedRows > 0) {
				try (ResultSet rs = pstmt.getGeneratedKeys()) {
					if (rs.next()) {
						booking.setBookingId(rs.getInt(1));
					}
				}
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Lấy booking theo ID
	public Booking getBookingById(int bookingId) {
		String sql = "SELECT b.*, h.hotel_name, r.room_type, u.full_name as user_name " + "FROM bookings b "
				+ "JOIN hotels h ON b.hotel_id = h.hotel_id " + "JOIN rooms r ON b.room_id = r.room_id "
				+ "JOIN users u ON b.user_id = u.user_id " + "WHERE b.booking_id = ?";

		try (Connection conn = DBContext.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, bookingId);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return extractBookingFromResultSet(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// Lấy tất cả booking của user
	public List<Booking> getBookingsByUserId(int userId) {
		List<Booking> bookings = new ArrayList<>();
		String sql = "SELECT b.*, h.hotel_name, r.room_type " + "FROM bookings b "
				+ "JOIN hotels h ON b.hotel_id = h.hotel_id " + "JOIN rooms r ON b.room_id = r.room_id "
				+ "WHERE b.user_id = ? " + "ORDER BY b.created_at DESC";

		try (Connection conn = DBContext.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bookings.add(extractBookingFromResultSet(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	// Cập nhật trạng thái booking
	public boolean updateBookingStatus(int bookingId, String status) {
		String sql = "UPDATE bookings SET booking_status = ? WHERE booking_id = ?";

		try (Connection conn = DBContext.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, status);
			pstmt.setInt(2, bookingId);

			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Hủy booking
	public boolean cancelBooking(int bookingId, int userId) {
		// Kiểm tra booking thuộc về user
		String checkSql = "SELECT booking_id FROM bookings WHERE booking_id = ? AND user_id = ?";
		String updateSql = "UPDATE bookings SET booking_status = 'cancelled' WHERE booking_id = ?";

		try (Connection conn = DBContext.getConnection()) {
			// Check ownership
			try (PreparedStatement checkPstmt = conn.prepareStatement(checkSql)) {
				checkPstmt.setInt(1, bookingId);
				checkPstmt.setInt(2, userId);
				ResultSet rs = checkPstmt.executeQuery();

				if (!rs.next()) {
					return false; // Booking không tồn tại hoặc không thuộc user
				}
			}

			// Update status
			try (PreparedStatement updatePstmt = conn.prepareStatement(updateSql)) {
				updatePstmt.setInt(1, bookingId);
				return updatePstmt.executeUpdate() > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Lấy booking đang chờ xử lý
	public List<Booking> getPendingBookings() {
		List<Booking> bookings = new ArrayList<>();
		String sql = "SELECT b.*, h.hotel_name, r.room_type, u.full_name as user_name " + "FROM bookings b "
				+ "JOIN hotels h ON b.hotel_id = h.hotel_id " + "JOIN rooms r ON b.room_id = r.room_id "
				+ "JOIN users u ON b.user_id = u.user_id " + "WHERE b.booking_status = 'pending' "
				+ "ORDER BY b.created_at DESC";

		try (Connection conn = DBContext.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				bookings.add(extractBookingFromResultSet(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	// Extract Booking từ ResultSet
	private Booking extractBookingFromResultSet(ResultSet rs) throws SQLException {
		Booking booking = new Booking();
		booking.setBookingId(rs.getInt("booking_id"));
		booking.setUserId(rs.getInt("user_id"));
		booking.setHotelId(rs.getInt("hotel_id"));
		booking.setRoomId(rs.getInt("room_id"));
		booking.setCheckInDate(rs.getDate("check_in_date"));
		booking.setCheckOutDate(rs.getDate("check_out_date"));
		booking.setNumberOfGuests(rs.getInt("number_of_guests"));
		booking.setTotalPrice(rs.getBigDecimal("total_price"));
		booking.setBookingStatus(rs.getString("booking_status"));
		booking.setSpecialRequests(rs.getString("special_requests"));
		booking.setCreatedAt(rs.getTimestamp("created_at"));

		// Additional fields
		try {
			booking.setHotelName(rs.getString("hotel_name"));
			booking.setRoomType(rs.getString("room_type"));
		} catch (SQLException e) {
			// Ignore if columns don't exist
		}

		try {
			booking.setUserName(rs.getString("user_name"));
		} catch (SQLException e) {
			// Ignore if column doesn't exist
		}

		return booking;
	}
}