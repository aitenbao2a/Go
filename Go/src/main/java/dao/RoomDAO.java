package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Room;
public class RoomDAO {

    /**
     * Get room by ID
     */
    public Room getRoomById(int roomId) {
        Room room = null;
        String sql = "SELECT * FROM Room WHERE roomId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, roomId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                room = mapResultSetToRoom(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return room;
    }

    /**
     * Get all rooms by hotel ID
     */
    public List<Room> getRoomsByHotelId(int hotelId) {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room WHERE hotelId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, hotelId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                rooms.add(mapResultSetToRoom(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    /**
     * Check if room is available for booking (String dates)
     */
    public boolean isRoomAvailable(int roomId, String checkIn, String checkOut, int requestedRooms) {
        String sql = "SELECT r.totalRooms, " +
                "COALESCE(SUM(b.numberOfRooms), 0) as bookedRooms " +
                "FROM Room r " +
                "LEFT JOIN Booking b ON r.roomId = b.roomId " +
                "AND b.bookingStatus NOT IN ('Cancelled') " +
                "AND NOT (b.checkOutDate <= ? OR b.checkInDate >= ?) " +
                "WHERE r.roomId = ? " +
                "GROUP BY r.roomId, r.totalRooms";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, checkIn);
            stmt.setString(2, checkOut);
            stmt.setInt(3, roomId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int totalRooms = rs.getInt("totalRooms");
                int bookedRooms = rs.getInt("bookedRooms");
                int availableRooms = totalRooms - bookedRooms;

                return availableRooms >= requestedRooms;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Check if room is available for booking (Date objects)
     */
    public boolean isRoomAvailable(int roomId, Date checkIn, Date checkOut, int requestedRooms) {
        String sql = "SELECT r.totalRooms, " +
                "COALESCE(SUM(b.numberOfRooms), 0) as bookedRooms " +
                "FROM Room r " +
                "LEFT JOIN Booking b ON r.roomId = b.roomId " +
                "AND b.bookingStatus NOT IN ('Cancelled') " +
                "AND NOT (b.checkOutDate <= ? OR b.checkInDate >= ?) " +
                "WHERE r.roomId = ? " +
                "GROUP BY r.roomId, r.totalRooms";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDate(1, checkIn);
            stmt.setDate(2, checkOut);
            stmt.setInt(3, roomId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int totalRooms = rs.getInt("totalRooms");
                int bookedRooms = rs.getInt("bookedRooms");
                int availableRooms = totalRooms - bookedRooms;

                return availableRooms >= requestedRooms;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Get available rooms count for a specific date range
     */
    public int getAvailableRoomsCount(int roomId, String checkIn, String checkOut) {
        String sql = "SELECT r.totalRooms, " +
                "COALESCE(SUM(b.numberOfRooms), 0) as bookedRooms " +
                "FROM Room r " +
                "LEFT JOIN Booking b ON r.roomId = b.roomId " +
                "AND b.bookingStatus NOT IN ('Cancelled') " +
                "AND NOT (b.checkOutDate <= ? OR b.checkInDate >= ?) " +
                "WHERE r.roomId = ? " +
                "GROUP BY r.roomId, r.totalRooms";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, checkIn);
            stmt.setString(2, checkOut);
            stmt.setInt(3, roomId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int totalRooms = rs.getInt("totalRooms");
                int bookedRooms = rs.getInt("bookedRooms");
                return totalRooms - bookedRooms;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    /**
     * Update availableRooms after booking
     */
    public boolean updateAvailableRooms(int roomId, int numberOfRoomsBooked) {
        String sql = "UPDATE Room SET availableRooms = availableRooms - ? " +
                "WHERE roomId = ? AND availableRooms >= ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, numberOfRoomsBooked);
            stmt.setInt(2, roomId);
            stmt.setInt(3, numberOfRoomsBooked);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Restore availableRooms after cancellation
     */
    public boolean restoreAvailableRooms(int roomId, int numberOfRoomsToRestore) {
        String sql = "UPDATE Room SET availableRooms = availableRooms + ? " +
                "WHERE roomId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, numberOfRoomsToRestore);
            stmt.setInt(2, roomId);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Create new room
     */
    public boolean createRoom(Room room) {
        String sql = "INSERT INTO Room (hotelId, roomType, description, capacity, pricePerNight, " +
                "totalRooms, availableRooms, amenities, images) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, room.getHotelId());
            stmt.setString(2, room.getRoomType());
            stmt.setString(3, room.getDescription());
            stmt.setInt(4, room.getCapacity());
            stmt.setBigDecimal(5, room.getPricePerNight());
            stmt.setInt(6, room.getTotalRooms());
            stmt.setInt(7, room.getAvailableRooms());
            stmt.setString(8, room.getAmenities());
            stmt.setString(9, room.getImages());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Update room
     */
    public boolean updateRoom(Room room) {
        String sql = "UPDATE Room SET roomType = ?, description = ?, capacity = ?, pricePerNight = ?, " +
                "totalRooms = ?, availableRooms = ?, amenities = ?, images = ? WHERE roomId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, room.getRoomType());
            stmt.setString(2, room.getDescription());
            stmt.setInt(3, room.getCapacity());
            stmt.setBigDecimal(4, room.getPricePerNight());
            stmt.setInt(5, room.getTotalRooms());
            stmt.setInt(6, room.getAvailableRooms());
            stmt.setString(7, room.getAmenities());
            stmt.setString(8, room.getImages());
            stmt.setInt(9, room.getRoomId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Delete room
     */
    public boolean deleteRoom(int roomId) {
        String sql = "DELETE FROM Room WHERE roomId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, roomId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Get all rooms
     */
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                rooms.add(mapResultSetToRoom(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    /**
     * Map ResultSet to Room object
     */
    private Room mapResultSetToRoom(ResultSet rs) throws SQLException {
        Room room = new Room();
        room.setRoomId(rs.getInt("roomId"));
        room.setHotelId(rs.getInt("hotelId"));
        room.setRoomType(rs.getString("roomType"));
        room.setDescription(rs.getString("description"));
        room.setCapacity(rs.getInt("capacity"));
        room.setPricePerNight(rs.getBigDecimal("pricePerNight"));
        room.setTotalRooms(rs.getInt("totalRooms"));
        room.setAvailableRooms(rs.getInt("availableRooms"));
        room.setAmenities(rs.getString("amenities"));
        room.setImages(rs.getString("images"));
        return room;
    }
}
