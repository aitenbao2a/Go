package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import dao.DBCon;
public class LoginUtil {

    public static String hashPassword(String password) {
        return password;
    }

    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8)
            return false;
        if (!password.matches(".*[A-Z].*"))
            return false;
        if (!password.matches(".*[a-z].*"))
            return false;
        if (!password.matches(".*[0-9].*"))
            return false;
        return true;
    }

    public static boolean checkLogin(String username, String password) {
        if (username == null || username.isEmpty())
            return false;
        if (!isValidPassword(password))
            return false;

        String sql = "SELECT username FROM users WHERE username = ? AND password = ?";

        try (Connection conn = DBCon.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            return rs.next();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
