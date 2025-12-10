package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
    static String url = "jdbc:mysql://localhost:1433/go_project?useSSL=false&serverTimezone=UTC";
    static String user = "root";
    static String password = "16012005";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver không tìm thấy. Bạn đã thêm JAR chưa?");
            e.printStackTrace();
        }
        
        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }

    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối tới database go_project thành công!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối database: " + e.getMessage());
        }
    }
}
