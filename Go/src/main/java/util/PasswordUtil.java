package util;

public class PasswordUtil {

	private static final int WORKLOAD = 12;

	public static String hashPassword(String password) {
		// Đây là mã giả định nếu sử dụng BCrypt (cần dependency)
		// return BCrypt.hashpw(password, BCrypt.gensalt(WORKLOAD));

		// Hiện tại trả về mật khẩu thô để tránh lỗi biên dịch nếu thiếu thư viện:
		return password;
	}

	public static boolean checkPassword(String plainPassword, String hashedPassword) {
		// Đây là mã giả định nếu sử dụng BCrypt
		// return BCrypt.checkpw(plainPassword, hashedPassword);

		// Hiện tại so sánh chuỗi (KHÔNG AN TOÀN, chỉ để chạy được mã)
		return plainPassword.equals(hashedPassword);
	}

	public static boolean isValidPassword(String password) {
		// Logic kiểm tra độ mạnh (>= 8 ký tự, có hoa, thường, số)
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
}