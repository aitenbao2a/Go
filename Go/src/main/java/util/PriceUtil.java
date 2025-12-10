package util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

public class PriceUtil {
    
    private static final Locale VN_LOCALE = new Locale("vi", "VN");
    private static final Currency VND_CURRENCY = Currency.getInstance("VND");
    private static final DecimalFormat VND_FORMAT = new DecimalFormat("#,###");
    private static final NumberFormat CURRENCY_FORMAT = NumberFormat.getCurrencyInstance(VN_LOCALE);
    
    /**
     * Format price in VND
     */
    public static String formatPrice(BigDecimal price) {
        if (price == null) {
            return "0 ₫";
        }
        return VND_FORMAT.format(price) + " ₫";
    }
    
    /**
     * Format price with currency symbol
     */
    public static String formatPriceWithSymbol(BigDecimal price) {
        if (price == null) {
            return "0 ₫";
        }
        return CURRENCY_FORMAT.format(price);
    }
    
    /**
     * Format price without currency symbol
     */
    public static String formatPriceNumber(BigDecimal price) {
        if (price == null) {
            return "0";
        }
        return VND_FORMAT.format(price);
    }
    
    /**
     * Calculate total price (price per night * number of nights)
     */
    public static BigDecimal calculateTotalPrice(BigDecimal pricePerNight, long nights) {
        if (pricePerNight == null || nights <= 0) {
            return BigDecimal.ZERO;
        }
        return pricePerNight.multiply(BigDecimal.valueOf(nights))
                            .setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Apply discount to price
     */
    public static BigDecimal applyDiscount(BigDecimal originalPrice, int discountPercent) {
        if (originalPrice == null || discountPercent <= 0 || discountPercent > 100) {
            return originalPrice;
        }
        
        BigDecimal discount = originalPrice
            .multiply(BigDecimal.valueOf(discountPercent))
            .divide(BigDecimal.valueOf(100), RoundingMode.HALF_UP);
        
        return originalPrice.subtract(discount).setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Apply discount amount to price
     */
    public static BigDecimal applyDiscountAmount(BigDecimal originalPrice, BigDecimal discountAmount) {
        if (originalPrice == null || discountAmount == null || discountAmount.compareTo(BigDecimal.ZERO) <= 0) {
            return originalPrice;
        }
        
        BigDecimal result = originalPrice.subtract(discountAmount);
        return result.max(BigDecimal.ZERO).setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Calculate discount percentage
     */
    public static int calculateDiscountPercent(BigDecimal originalPrice, BigDecimal discountedPrice) {
        if (originalPrice == null || discountedPrice == null || 
            originalPrice.compareTo(BigDecimal.ZERO) <= 0) {
            return 0;
        }
        
        BigDecimal discount = originalPrice.subtract(discountedPrice);
        BigDecimal percent = discount
            .multiply(BigDecimal.valueOf(100))
            .divide(originalPrice, 0, RoundingMode.HALF_UP);
        
        return percent.intValue();
    }
    
    /**
     * Calculate tax (VAT 10%)
     */
    public static BigDecimal calculateTax(BigDecimal price) {
        if (price == null) {
            return BigDecimal.ZERO;
        }
        return price.multiply(BigDecimal.valueOf(0.10))
                    .setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Calculate service fee (2%)
     */
    public static BigDecimal calculateServiceFee(BigDecimal price) {
        if (price == null) {
            return BigDecimal.ZERO;
        }
        return price.multiply(BigDecimal.valueOf(0.02))
                    .setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Calculate total with tax and fees
     */
    public static BigDecimal calculateTotalWithTaxAndFees(BigDecimal basePrice) {
        if (basePrice == null) {
            return BigDecimal.ZERO;
        }
        
        BigDecimal tax = calculateTax(basePrice);
        BigDecimal serviceFee = calculateServiceFee(basePrice);
        
        return basePrice.add(tax).add(serviceFee).setScale(0, RoundingMode.HALF_UP);
    }
    
    /**
     * Round to nearest thousand (for display)
     */
    public static BigDecimal roundToThousand(BigDecimal price) {
        if (price == null) {
            return BigDecimal.ZERO;
        }
        return price.divide(BigDecimal.valueOf(1000), 0, RoundingMode.HALF_UP)
                    .multiply(BigDecimal.valueOf(1000));
    }
    
    /**
     * Parse price string to BigDecimal
     */
    public static BigDecimal parsePrice(String priceString) {
        if (priceString == null || priceString.trim().isEmpty()) {
            return BigDecimal.ZERO;
        }
        
        try {
            // Remove currency symbols, spaces, commas
            String cleaned = priceString.replaceAll("[₫$,\\s]", "").trim();
            return new BigDecimal(cleaned).setScale(0, RoundingMode.HALF_UP);
        } catch (NumberFormatException e) {
            System.err.println("Error parsing price: " + priceString);
            return BigDecimal.ZERO;
        }
    }
    
    /**
     * Compare prices
     */
    public static int comparePrices(BigDecimal price1, BigDecimal price2) {
        if (price1 == null) price1 = BigDecimal.ZERO;
        if (price2 == null) price2 = BigDecimal.ZERO;
        return price1.compareTo(price2);
    }
    
    /**
     * Calculate average price
     */
    public static BigDecimal calculateAverage(BigDecimal... prices) {
        if (prices == null || prices.length == 0) {
            return BigDecimal.ZERO;
        }
        
        BigDecimal sum = BigDecimal.ZERO;
        int count = 0;
        
        for (BigDecimal price : prices) {
            if (price != null) {
                sum = sum.add(price);
                count++;
            }
        }
        
        if (count == 0) {
            return BigDecimal.ZERO;
        }
        
        return sum.divide(BigDecimal.valueOf(count), 0, RoundingMode.HALF_UP);
    }
    
    /**
     * Get price range string
     */
    public static String getPriceRange(BigDecimal minPrice, BigDecimal maxPrice) {
        if (minPrice == null || maxPrice == null) {
            return "N/A";
        }
        return formatPrice(minPrice) + " - " + formatPrice(maxPrice);
    }
    
    /**
     * Convert price to other currency (basic conversion)
     */
    public static BigDecimal convertToUSD(BigDecimal vndPrice) {
        if (vndPrice == null) {
            return BigDecimal.ZERO;
        }
        // Approximate rate: 1 USD = 24,000 VND
        return vndPrice.divide(BigDecimal.valueOf(24000), 2, RoundingMode.HALF_UP);
    }
    
    /**
     * Check if price is valid
     */
    public static boolean isValidPrice(BigDecimal price) {
        return price != null && price.compareTo(BigDecimal.ZERO) > 0;
    }
}