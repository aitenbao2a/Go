package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DateUtil {
    
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat DATETIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static final SimpleDateFormat DISPLAY_DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
    private static final SimpleDateFormat DISPLAY_DATETIME_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    
    static {
        DATE_FORMAT.setLenient(false);
        DATETIME_FORMAT.setLenient(false);
    }
    
    /**
     * Parse string to Date (yyyy-MM-dd)
     */
    public static Date parseDate(String dateString) {
        if (dateString == null || dateString.trim().isEmpty()) {
            return null;
        }
        try {
            return DATE_FORMAT.parse(dateString.trim());
        } catch (ParseException e) {
            System.err.println("Error parsing date: " + dateString);
            return null;
        }
    }
    
    /**
     * Parse string to Date with custom format
     */
    public static Date parseDate(String dateString, String pattern) {
        if (dateString == null || dateString.trim().isEmpty()) {
            return null;
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            sdf.setLenient(false);
            return sdf.parse(dateString.trim());
        } catch (ParseException e) {
            System.err.println("Error parsing date with pattern: " + dateString);
            return null;
        }
    }
    
    /**
     * Format Date to string (yyyy-MM-dd)
     */
    public static String formatDate(Date date) {
        if (date == null) {
            return "";
        }
        return DATE_FORMAT.format(date);
    }
    
    /**
     * Format Date to string (dd/MM/yyyy)
     */
    public static String formatDisplayDate(Date date) {
        if (date == null) {
            return "";
        }
        return DISPLAY_DATE_FORMAT.format(date);
    }
    
    /**
     * Format Date to DateTime string (yyyy-MM-dd HH:mm:ss)
     */
    public static String formatDateTime(Date date) {
        if (date == null) {
            return "";
        }
        return DATETIME_FORMAT.format(date);
    }
    
    /**
     * Format Date to display DateTime string (dd/MM/yyyy HH:mm)
     */
    public static String formatDisplayDateTime(Date date) {
        if (date == null) {
            return "";
        }
        return DISPLAY_DATETIME_FORMAT.format(date);
    }
    
    /**
     * Calculate number of nights between two dates
     */
    public static long calculateNights(Date checkIn, Date checkOut) {
        if (checkIn == null || checkOut == null) {
            return 0;
        }
        
        long diffInMillis = checkOut.getTime() - checkIn.getTime();
        return TimeUnit.DAYS.convert(diffInMillis, TimeUnit.MILLISECONDS);
    }
    
    /**
     * Validate date range for booking
     */
    public static boolean isValidDateRange(Date checkIn, Date checkOut) {
        if (checkIn == null || checkOut == null) {
            return false;
        }
        
        Date today = removeTime(new Date());
        Date checkInNoTime = removeTime(checkIn);
        Date checkOutNoTime = removeTime(checkOut);
        
        // Check-in must be today or future
        // Check-out must be after check-in
        return !checkInNoTime.before(today) && checkOutNoTime.after(checkInNoTime);
    }
    
    /**
     * Remove time component from Date
     */
    public static Date removeTime(Date date) {
        if (date == null) {
            return null;
        }
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * Add days to date
     */
    public static Date addDays(Date date, int days) {
        if (date == null) {
            return null;
        }
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DAY_OF_MONTH, days);
        return cal.getTime();
    }
    
    /**
     * Get current date without time
     */
    public static Date getCurrentDate() {
        return removeTime(new Date());
    }
    
    /**
     * Get current date and time
     */
    public static Date getCurrentDateTime() {
        return new Date();
    }
    
    /**
     * Check if date is in the past
     */
    public static boolean isPast(Date date) {
        if (date == null) {
            return false;
        }
        return removeTime(date).before(removeTime(new Date()));
    }
    
    /**
     * Check if date is in the future
     */
    public static boolean isFuture(Date date) {
        if (date == null) {
            return false;
        }
        return removeTime(date).after(removeTime(new Date()));
    }
    
    /**
     * Check if date is today
     */
    public static boolean isToday(Date date) {
        if (date == null) {
            return false;
        }
        return removeTime(date).equals(removeTime(new Date()));
    }
    
    /**
     * Get date difference in days
     */
    public static long getDaysDifference(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            return 0;
        }
        
        long diffInMillis = Math.abs(date2.getTime() - date1.getTime());
        return TimeUnit.DAYS.convert(diffInMillis, TimeUnit.MILLISECONDS);
    }
    
    /**
     * Convert java.util.Date to java.sql.Date
     */
    public static java.sql.Date toSqlDate(Date date) {
        if (date == null) {
            return null;
        }
        return new java.sql.Date(date.getTime());
    }
    
    /**
     * Convert java.sql.Date to java.util.Date
     */
    public static Date fromSqlDate(java.sql.Date sqlDate) {
        if (sqlDate == null) {
            return null;
        }
        return new Date(sqlDate.getTime());
    }
    
    /**
     * Get start of day
     */
    public static Date getStartOfDay(Date date) {
        if (date == null) {
            return null;
        }
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    /**
     * Get end of day
     */
    public static Date getEndOfDay(Date date) {
        if (date == null) {
            return null;
        }
        
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 999);
        return cal.getTime();
    }
}