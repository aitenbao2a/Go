package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String dbURL = "jdbc:sqlserver://localhost:14333;databaseName=vietnam_booking;encrypt=false;trustServerCertificate=true;";
            String user = "dev_user"; 
            String pass = "123456";

            conn = DriverManager.getConnection(dbURL, user, pass);
        } catch (ClassNotFoundException e) {
            System.out.println("Lỗi: Không tìm thấy thư viện mssql-jdbc.jar!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Lỗi: Sai thông tin kết nối hoặc SQL Server chưa bật TCP/IP!");
            e.printStackTrace();
        }
        return conn;
    }
    public static void main(String[] args) {
        new DBContext().getConnection();
    }
}