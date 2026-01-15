package dao;

import model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }

    // Tạo booking mới
    public int createBooking(Booking booking) {
        String sql = "INSERT INTO Booking (userId, hotelId, roomId, checkInDate, checkOutDate, " +
                    "numberOfRooms, numberOfGuests, guestName, guestEmail, guestPhone, " +
                    "specialRequests, totalAmount, bookingStatus, paymentStatus, createdAt) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getHotelId());
            stmt.setInt(3, booking.getRoomId());
            stmt.setDate(4, booking.getCheckInDate());
            stmt.setDate(5, booking.getCheckOutDate());
            stmt.setInt(6, booking.getNumberOfRooms());
            stmt.setInt(7, booking.getNumberOfGuests());
            stmt.setString(8, booking.getGuestName());
            stmt.setString(9, booking.getGuestEmail());
            stmt.setString(10, booking.getGuestPhone());
            stmt.setString(11, booking.getSpecialRequests());
            stmt.setBigDecimal(12, booking.getTotalAmount());
            stmt.setString(13, booking.getBookingStatus());
            stmt.setString(14, booking.getPaymentStatus());
            stmt.setTimestamp(15, booking.getCreatedAt());
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); // Return bookingId
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Lấy booking theo ID
    public Booking getBookingById(int bookingId) {
        String sql = "SELECT * FROM Booking WHERE bookingId = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, bookingId);
            ResultSet rs = stmt.executeQuery();
            
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
        String sql = "SELECT * FROM Booking WHERE userId = ? ORDER BY createdAt DESC";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            
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
        String sql = "UPDATE Booking SET bookingStatus = ? WHERE bookingId = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật trạng thái thanh toán
    public boolean updatePaymentStatus(int bookingId, String paymentStatus, String paymentMethod) {
        String sql = "UPDATE Booking SET paymentStatus = ?, paymentMethod = ? WHERE bookingId = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, paymentStatus);
            stmt.setString(2, paymentMethod);
            stmt.setInt(3, bookingId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy tất cả bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM Booking ORDER BY createdAt DESC";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                bookings.add(extractBookingFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Hủy booking
    public boolean cancelBooking(int bookingId) {
        return updateBookingStatus(bookingId, "Cancelled");
    }

    // Helper method để extract Booking từ ResultSet
    private Booking extractBookingFromResultSet(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setBookingId(rs.getInt("bookingId"));
        booking.setUserId(rs.getInt("userId"));
        booking.setHotelId(rs.getInt("hotelId"));
        booking.setRoomId(rs.getInt("roomId"));
        booking.setCheckInDate(rs.getDate("checkInDate"));
        booking.setCheckOutDate(rs.getDate("checkOutDate"));
        booking.setNumberOfRooms(rs.getInt("numberOfRooms"));
        booking.setNumberOfGuests(rs.getInt("numberOfGuests"));
        booking.setGuestName(rs.getString("guestName"));
        booking.setGuestEmail(rs.getString("guestEmail"));
        booking.setGuestPhone(rs.getString("guestPhone"));
        booking.setSpecialRequests(rs.getString("specialRequests"));
        booking.setTotalAmount(rs.getBigDecimal("totalAmount"));
        booking.setBookingStatus(rs.getString("bookingStatus"));
        booking.setCreatedAt(rs.getTimestamp("createdAt"));
        booking.setPaymentMethod(rs.getString("paymentMethod"));
        booking.setPaymentStatus(rs.getString("paymentStatus"));
        return booking;
    }
    
}