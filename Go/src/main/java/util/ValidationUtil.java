package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidationUtil {

    private static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    private static final Pattern EMAIL_PATTERN = Pattern.compile(EMAIL_REGEX);

    public static boolean isNotEmpty(String str) {
        return str != null && !str.trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {
        if (!isNotEmpty(email)) return false;
        Matcher matcher = EMAIL_PATTERN.matcher(email);
        return matcher.matches();
    }

    // Có thể thêm các phương thức kiểm tra khác như isValidPhone, isValidNumber, v.v.
}