package dao;

import model.Hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HotelDAO {

    private Hotel mapResultSetToHotel(ResultSet rs) throws SQLException {
        Hotel h = new Hotel();
        h.setHotelId(rs.getInt("hotelId"));
        h.setHotelName(rs.getString("hotelName"));
        h.setDescription(rs.getString("description"));
        h.setAddress(rs.getString("address"));
        h.setCity(rs.getString("city"));
        h.setCountry(rs.getString("country"));
        h.setStarRating(rs.getInt("starRating"));
        h.setLatitude(rs.getBigDecimal("latitude"));
        h.setLongitude(rs.getBigDecimal("longitude"));
        h.setAmenities(rs.getString("amenities"));
        h.setImages(rs.getString("images"));
        h.setCreatedAt(rs.getTimestamp("createdAt"));
        h.setAverageRating(rs.getDouble("averageRating"));
        h.setReviewCount(rs.getInt("reviewCount"));
        h.setMinPrice(rs.getBigDecimal("minPrice"));
        return h;
    }

    // Lấy tất cả khách sạn
    public List<Hotel> getAllHotels() {
        List<Hotel> list = new ArrayList<>();
        String sql = "SELECT * FROM Hotel";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSetToHotel(rs));
            }

        } catch (Exception e) {
            System.out.println("Lỗi lấy danh sách khách sạn: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    // Tìm kiếm theo keyword
    public List<Hotel> searchHotels(String keyword) {
        List<Hotel> list = new ArrayList<>();

        String sql = """
            SELECT * FROM Hotel
            WHERE hotelName LIKE ?
               OR city LIKE ?
               OR address LIKE ?
        """;

        try (Connection conn = DBCon.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String searchPattern = "%" + keyword + "%";

            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);

            System.out.println("Tìm kiếm với: " + searchPattern);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToHotel(rs));
                }
            }

        } catch (Exception e) {
            System.out.println("Lỗi searchHotels: " + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    // Lấy theo id
    public Hotel getHotelById(int id) {
        String sql = "SELECT * FROM Hotel WHERE hotelId = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToHotel(rs);
                }
            }

        } catch (Exception e) {
            System.out.println("Lỗi getHotelById: " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }
}
