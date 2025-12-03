package dao;

import model.Hotel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelDAO {
    
    public List<Hotel> getAllHotels() {
        List<Hotel> list = new ArrayList<>();
        String sql = "SELECT * FROM hotels";
        
        try {
            DBContext db = new DBContext(); 
            Connection conn = db.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String dbName = rs.getString("name");
                String dbImg = rs.getString("image_icon");
                int dbStars = rs.getInt("stars");
                double dbScore = rs.getDouble("score");
                int dbReview = rs.getInt("review_count");
                String dbLoc = rs.getString("location_text");
                double dbPrice = rs.getDouble("price");
                int dbDiscount = rs.getInt("discount");

                Hotel h = new Hotel();
                list.add(h);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Lỗi lấy danh sách khách sạn: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

	public List<Hotel> searchHotels(String keyword) {
		List<Hotel> list = new ArrayList<>();
        String sql = "SELECT * FROM hotels WHERE name LIKE ? OR location_text LIKE ?";
        
        try {
            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            
            String searchPattern = "%" + keyword + "%";
            
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Hotel h = new Hotel(
                    rs.getString("name"),
                    rs.getString("image_icon"),
                    rs.getInt("stars"),
                    rs.getDouble("score"),
                    rs.getInt("review_count"),
                    rs.getString("location_text"),
                    rs.getDouble("price"),
                    rs.getInt("discount")
                );
                list.add(h);
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
	}
}