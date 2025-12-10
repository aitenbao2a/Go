package util;
import org.mindrot.jbcrypt.BCrypt;
import java.security.SecureRandom;
import java.util.regex.Pattern;

public class PasswordUtil {
    
    private static final Pattern UPPERCASE_PATTERN = Pattern.compile("[A-Z]");
    private static final Pattern LOWERCASE_PATTERN = Pattern.compile("[a-z]");
    private static final Pattern DIGIT_PATTERN = Pattern.compile("[0-9]");
    private static final Pattern SPECIAL_CHAR_PATTERN = Pattern.compile("[!@#$%^&*(),.?\":{}|<>]");
    
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8) {
            return false;
        }
        
        boolean hasUpper = UPPERCASE_PATTERN.matcher(password).find();
        boolean hasLower = LOWERCASE_PATTERN.matcher(password).find();
        boolean hasDigit = DIGIT_PATTERN.matcher(password).find();
        
        return hasUpper && hasLower && hasDigit;
    }
    
    public static int getPasswordStrength(String password) {
        if (password == null || password.length() < 8) {
            return 0; 
        }
        
        int strength = 0;
        
        if (password.length() >= 12) strength++;
        if (UPPERCASE_PATTERN.matcher(password).find()) strength++;
        if (LOWERCASE_PATTERN.matcher(password).find()) strength++;
        if (DIGIT_PATTERN.matcher(password).find()) strength++;
        if (SPECIAL_CHAR_PATTERN.matcher(password).find()) strength++;

        if (strength <= 2) return 0; 
        if (strength == 3) return 1;
        if (strength == 4) return 2; 
        return 3; 
    }
    
  
    public static String generateRandomPassword(int length) {
        if (length < 8) {
            length = 8;
        }
        
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(length);
        
        password.append(chars.charAt(random.nextInt(26))); 
        password.append(chars.charAt(26 + random.nextInt(26))); 
        password.append(chars.charAt(52 + random.nextInt(10)));
        
        for (int i = 3; i < length; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        
        char[] passwordArray = password.toString().toCharArray();
        for (int i = passwordArray.length - 1; i > 0; i--) {
            int j = random.nextInt(i + 1);
            char temp = passwordArray[i];
            passwordArray[i] = passwordArray[j];
            passwordArray[j] = temp;
        }
        
        return new String(passwordArray);
    }
    
    public static String getPasswordValidationMessage(String password) {
        if (password == null || password.isEmpty()) {
            return "Mật khẩu không được để trống";
        }
        if (password.length() < 8) {
            return "Mật khẩu phải có ít nhất 8 ký tự";
        }
        if (!UPPERCASE_PATTERN.matcher(password).find()) {
            return "Mật khẩu phải có ít nhất 1 chữ hoa";
        }
        if (!LOWERCASE_PATTERN.matcher(password).find()) {
            return "Mật khẩu phải có ít nhất 1 chữ thường";
        }
        if (!DIGIT_PATTERN.matcher(password).find()) {
            return "Mật khẩu phải có ít nhất 1 chữ số";
        }
        return "Mật khẩu hợp lệ";
    }
}