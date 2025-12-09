package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {

    private static final String URL =
            "jdbc:sqlserver://localhost:1433;databaseName=vietnam_booking;encrypt=false;";
    private static final String USER = "sa";      
    private static final String PASS = "123456";  

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("✔ Kết nối SQL Server thành công!");
            return conn;

        } catch (ClassNotFoundException e) {
            System.out.println(" Không tìm thấy driver SQL Server! (thiếu mssql-jdbc.jar)");
        } catch (SQLException e) {
            System.out.println(" Không kết nối được SQL Server:");
            System.out.println(" Sai USER / PASS ?");
            System.out.println(" Sai PORT ?");
            System.out.println(" Sai databaseName ?");
            System.out.println(" SQL Server chưa bật TCP/IP ?");
        }

        return null;
    }

    public static void main(String[] args) {
        getConnection();
    }
}
