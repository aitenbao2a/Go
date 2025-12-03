<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agoda Clone - Đặt phòng khách sạn giá tốt</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <!-- Include Header -->
    <jsp:include page="includes/header.jsp" />

    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
            <p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách sạn trên toàn thế giới</p>
        </div>
    </section>

    <!-- Search Box -->
    <div class="search-container">
        <div class="container">
            <div class="search-box">
                <div class="search-tabs">
                    <button class="search-tab active">🏨 Khách sạn</button>
                    <button class="search-tab">✈️ Chuyến bay</button>
                    <button class="search-tab">🏠 Nhà nghỉ</button>
                    <button class="search-tab">🚗 Thuê xe</button>
                </div>
                <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
                    <div class="form-field">
                        <label class="form-label">Điểm đến</label>
                        <input type="text" name="city" class="form-input" 
                               placeholder="Bạn muốn đi đâu?" required>
                    </div>
                    <div class="form-field">
                        <label class="form-label">Nhận phòng</label>
                        <input type="date" name="checkIn" class="form-input" 
                               id="checkInDate" required>
                    </div>
                    <div class="form-field">
                        <label class="form-label">Trả phòng</label>
                        <input type="date" name="checkOut" class="form-input" 
                               id="checkOutDate" required>
                    </div>
                    <div class="form-field">
                        <label class="form-label">Khách & Phòng</label>
                        <select name="guests" class="form-select">
                            <option value="1">1 khách, 1 phòng</option>
                            <option value="2" selected>2 khách, 1 phòng</option>
                            <option value="3">3 khách, 1 phòng</option>
                            <option value="4">4 khách, 1 phòng</option>
                        </select>
                    </div>
                    <button type="submit" class="btn-search">Tìm kiếm</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <main>
        <!-- Popular Destinations -->
        <section class="section">
            <div class="container">
                <h2 class="section-title">Điểm đến phổ biến</h2>
                <div class="destinations-grid">
                    <div class="destination-card" onclick="location.href='search?city=Hồ Chí Minh'">
                        <div class="destination-image">🏙️</div>
                        <div class="destination-info">
                            <div class="destination-name">Hồ Chí Minh</div>
                            <div class="destination-properties">2,847 khách sạn</div>
                        </div>
                    </div>
                    <div class="destination-card" onclick="location.href='search?city=Đà Nẵng'">
                        <div class="destination-image">🏖️</div>
                        <div class="destination-info">
                            <div class="destination-name">Đà Nẵng</div>
                            <div class="destination-properties">1,523 khách sạn</div>
                        </div>
                    </div>
                    <div class="destination-card" onclick="location.href='search?city=Hà Nội'">
                        <div class="destination-image">🏛️</div>
                        <div class="destination-info">
                            <div class="destination-name">Hà Nội</div>
                            <div class="destination-properties">1,892 khách sạn</div>
                        </div>
                    </div>
                    <div class="destination-card" onclick="location.href='search?city=Nha Trang'">
                        <div class="destination-image">🌊</div>
                        <div class="destination-info">
                            <div class="destination-name">Nha Trang</div>
                            <div class="destination-properties">986 khách sạn</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Featured Hotels -->
        <section class="section" style="background: white; margin: 0 -20px; padding: 60px 20px;">
            <div class="container">
                <h2 class="section-title">Khách sạn đề xuất</h2>
                <div class="hotels-grid">
                    <!-- Sample Hotel Card 1 -->
                    <div class="hotel-card" onclick="location.href='hotel-detail?id=1'">
                        <div class="hotel-image">
                            <div class="hotel-image-placeholder">🏨</div>
                        </div>
                        <div class="hotel-details">
                            <div class="hotel-header">
                                <div class="hotel-name">Khách sạn Continental Sài Gòn</div>
                                <div class="hotel-rating">
                                    <span class="stars">★★★★★</span>
                                    <span class="review-score">9.2</span>
                                    <span class="review-count">(2,847 đánh giá)</span>
                                </div>
                                <div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí Minh</div>
                            </div>
                            <div class="hotel-features">
                                <span class="feature-tag">🏊 Hồ bơi</span>
                                <span class="feature-tag">🍴 Nhà hàng</span>
                                <span class="feature-tag">💪 Phòng gym</span>
                                <span class="feature-tag">📶 WiFi miễn phí</span>
                            </div>
                            <div class="hotel-footer">
                                <span class="discount-badge">-25% hôm nay</span>
                                <div class="price-info">
                                    <div class="price-label">Giá mỗi đêm từ</div>
                                    <div class="price">
                                        <span class="price-currency">₫</span>2,450,000
                                    </div>
                                    <div class="price-note">Đã bao gồm thuế và phí</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Sample Hotel Card 2 -->
                    <div class="hotel-card" onclick="location.href='hotel-detail?id=2'">
                        <div class="hotel-image">
                            <div class="hotel-image-placeholder">🏢</div>
                        </div>
                        <div class="hotel-details">
                            <div class="hotel-header">
                                <div class="hotel-name">Rex Hotel Saigon</div>
                                <div class="hotel-rating">
                                    <span class="stars">★★★★★</span>
                                    <span class="review-score">9.0</span>
                                    <span class="review-count">(3,421 đánh giá)</span>
                                </div>
                                <div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí Minh</div>
                            </div>
                            <div class="hotel-features">
                                <span class="feature-tag">🏊 Hồ bơi</span>
                                <span class="feature-tag">🅿️ Bãi đỗ xe</span>
                                <span class="feature-tag">🍴 Bar & Nhà hàng</span>
                                <span class="feature-tag">💆 Spa</span>
                            </div>
                            <div class="hotel-footer">
                                <span class="discount-badge">-20% hôm nay</span>
                                <div class="price-info">
                                    <div class="price-label">Giá mỗi đêm từ</div>
                                    <div class="price">
                                        <span class="price-currency">₫</span>2,890,000
                                    </div>
                                    <div class="price-note">Đã bao gồm thuế và phí</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Include Footer -->
    <jsp:include page="includes/footer.jsp" />
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script>
        // Set default dates
        const today = new Date();
        const tomorrow = new Date(today);
        tomorrow.setDate(tomorrow.getDate() + 1);
        const dayAfter = new Date(today);
        dayAfter.setDate(dayAfter.getDate() + 3);
        
        document.getElementById('checkInDate').valueAsDate = tomorrow;
        document.getElementById('checkOutDate').valueAsDate = dayAfter;
    </script>
</body>
</html>