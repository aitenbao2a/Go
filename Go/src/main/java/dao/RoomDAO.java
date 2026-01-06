package dao;

import model.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    
    public List<Room> getRoomsByHotelId(int hotelId) {
        List<Room> list = new ArrayList<>();
        String sql = "SELECT * FROM Room WHERE hotelId = ?"; 
        
        try (Connection conn = DBCon.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, hotelId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Room r = new Room();
                r.setRoomId(rs.getInt("roomId"));
                r.setHotelId(rs.getInt("hotelId"));
                r.setRoomType(rs.getString("roomType"));
                r.setDescription(rs.getString("description"));
                r.setPricePerNight(rs.getBigDecimal("pricePerNight"));
                r.setCapacity(rs.getInt("capacity"));
                r.setImages(rs.getString("images"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

	public Room getRoomById(int roomId) {
		// TODO Auto-generated method stub
		return null;
	}
}