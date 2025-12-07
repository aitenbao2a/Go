<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>10 khách sạn tốt nhất ở Hồ Chí Minh - Go Travel</title>

    <style>
/* Hotel Search Page Styles */

/* Page Header */
.page-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 30px 0 20px;
    color: white;
}

.breadcrumb {
    font-size: 13px;
    margin-bottom: 15px;
    opacity: 0.9;
}

.breadcrumb a {
    color: white;
    text-decoration: none;
    transition: opacity 0.3s;
}

.breadcrumb a:hover {
    opacity: 0.8;
}

.breadcrumb .separator {
    margin: 0 8px;
}

.page-title {
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 25px;
    letter-spacing: -0.5px;
}

/* Filter Tabs */
.filter-tabs {
    display: flex;
    gap: 10px;
    overflow-x: auto;
    padding-bottom: 5px;
    -webkit-overflow-scrolling: touch;
}

.filter-tabs::-webkit-scrollbar {
    height: 4px;
}

.filter-tabs::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.3);
    border-radius: 2px;
}

.filter-tab {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 10px 18px;
    background: rgba(255, 255, 255, 0.15);
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    color: white;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    white-space: nowrap;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
}

.filter-tab:hover {
    background: rgba(255, 255, 255, 0.25);
    transform: translateY(-2px);
}

.filter-tab.active {
    background: white;
    color: #667eea;
    border-color: white;
}

.tab-icon {
    font-size: 16px;
}

.filter-tab svg {
    opacity: 0.8;
}

/* Main Layout */
.main-wrapper {
    background-color: #f8f9fa;
    padding: 30px 0;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

.content-layout {
    display: grid;
    grid-template-columns: 260px 1fr;
    gap: 30px;
}

/* Sidebar Filters */
.sidebar-filters {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.filter-group {
    background: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.filter-title {
    font-size: 16px;
    font-weight: 600;
    color: #1a1a1a;
    margin-bottom: 15px;
}

.filter-options {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

/* Custom Checkbox */
.filter-checkbox {
    display: flex;
    align-items: center;
    cursor: pointer;
    position: relative;
}

.filter-checkbox input[type="checkbox"] {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

.checkbox-custom {
    width: 20px;
    height: 20px;
    border: 2px solid #d1d5db;
    border-radius: 4px;
    margin-right: 10px;
    flex-shrink: 0;
    transition: all 0.3s ease;
    position: relative;
}

.filter-checkbox input[type="checkbox"]:checked + .checkbox-custom {
    background: #667eea;
    border-color: #667eea;
}

.filter-checkbox input[type="checkbox"]:checked + .checkbox-custom::after {
    content: '✓';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    font-size: 14px;
    font-weight: bold;
}

.checkbox-label {
    font-size: 14px;
    color: #4b5563;
    user-select: none;
}

.filter-checkbox:hover .checkbox-custom {
    border-color: #667eea;
}

/* Price Range Filter */
.price-range-inputs {
    display: flex;
    align-items: center;
    gap: 10px;
}

.price-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #e5e7eb;
    border-radius: 6px;
    font-size: 14px;
    transition: border-color 0.3s;
}

.price-input:focus {
    outline: none;
    border-color: #667eea;
}

.price-separator {
    color: #9ca3af;
    font-weight: 500;
}

/* Hotels Container */
.hotels-container {
    display: flex;
    flex-direction: column;
    gap: 25px;
}

.results-info {
    background: white;
    padding: 15px 20px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.results-count {
    font-size: 14px;
    color: #6b7280;
    margin: 0;
}

.results-count strong {
    color: #1a1a1a;
    font-weight: 600;
}

/* Hotel Item */
.hotel-item {
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
}

.hotel-item:hover {
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    transform: translateY(-4px);
}

.hotel-content {
    display: grid;
    grid-template-columns: 280px 1fr 240px;
    gap: 20px;
    padding: 20px;
}

/* Hotel Images */
.hotel-images {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.main-image {
    position: relative;
    width: 100%;
    height: 200px;
    border-radius: 12px;
    overflow: hidden;
}

.verified-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    background: #10b981;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 2;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.hotel-main-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease; /* Đã sửa lỗi cắt cụt */
}

/* Bắt đầu bổ sung CSS cho các phần bị thiếu/bị cắt */

.image-thumbnails {
    display: flex;
    gap: 8px;
}

.thumbnail-img {
    width: 80px;
    height: 60px;
    object-fit: cover;
    border-radius: 8px;
    cursor: pointer;
    opacity: 0.8;
    transition: opacity 0.3s;
}

.thumbnail-img:hover {
    opacity: 1;
}

.more-photos {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #f3f4f6;
    border-radius: 8px;
    color: #4b5563;
    font-size: 13px;
    cursor: pointer;
    transition: background 0.3s;
}

.more-photos:hover {
    background: #e5e7eb;
}

/* Hotel Info */
.hotel-info {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.hotel-header {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.hotel-name {
    font-size: 18px;
    font-weight: 700;
    color: #1a1a1a;
    line-height: 1.3;
}

.hotel-rating {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.rating-stars {
    color: gold;
    font-size: 16px;
}

.hotel-location {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 13px;
    color: #6b7280;
    text-decoration: none;
    transition: color 0.3s;
}

.hotel-location:hover {
    color: #667eea;
}

/* Amenities */
.hotel-amenities {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}

.amenity-badge {
    display: flex;
    align-items: center;
    gap: 5px;
    padding: 5px 10px;
    background: #eef2ff;
    border-radius: 6px;
    font-size: 12px;
    color: #4338ca;
    font-weight: 500;
}

.amenity-badge svg {
    color: #667eea;
}

.amenity-more {
    padding: 5px 10px;
    background: #f3f4f6;
    border-radius: 6px;
    font-size: 12px;
    color: #6b7280;
    font-weight: 500;
}

/* Description */
.hotel-description {
    font-size: 14px;
    color: #4b5563;
    line-height: 1.5;
    margin: 0;
}

.read-more {
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
}

.read-more:hover {
    text-decoration: underline;
}

/* Pricing Section */
.hotel-pricing {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    justify-content: space-between;
    text-align: right;
    gap: 15px;
}

.review-badge {
    display: flex;
    gap: 10px;
    align-items: center;
}

.review-score-large {
    background: #059669;
    color: white;
    font-size: 24px;
    font-weight: 700;
    padding: 10px 15px;
    border-radius: 8px;
    min-width: 50px;
    text-align: center;
}

.review-details {
    text-align: left;
}

.review-label {
    font-size: 14px;
    font-weight: 600;
    color: #1a1a1a;
}

.review-count {
    font-size: 12px;
    color: #6b7280;
}

.price-container {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 10px;
}

.price-label {
    font-size: 12px;
    color: #6b7280;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.price-amount {
    font-size: 28px;
    font-weight: 700;
    color: #e83e8c; /* Màu hồng nổi bật cho giá */
}

.price-currency {
    font-size: 16px;
    margin-left: 5px;
}

.btn-check-availability {
    background: #ff6f61; /* Màu nổi bật cho nút */
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.1s;
    width: 100%;
    max-width: 200px;
}

.btn-check-availability:hover {
    background: #e55d54;
}

.btn-check-availability:active {
    transform: scale(0.98);
}

/* Promotional Section */
.promo-section, .flight-deals-section, .destinations-section {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    margin-bottom: 25px;
}

.section-title {
    font-size: 20px;
    font-weight: 700;
    color: #1a1a1a;
    margin-bottom: 15px;
}

.promo-carousel {
    display: flex;
    gap: 15px;
    overflow-x: auto;
    padding-bottom: 10px;
}

.promo-card {
    min-width: 220px;
    height: 120px;
    border-radius: 10px;
    color: white;
    display: flex;
    align-items: center;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.promo-card:hover {
    transform: translateY(-5px);
}

.promo-content {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.promo-icon {
    font-size: 24px;
}

.promo-title {
    font-size: 18px;
    font-weight: 700;
    margin: 0;
}

.promo-desc {
    font-size: 14px;
    opacity: 0.9;
    margin: 0;
}

/* Flight Deals Section */
.deals-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
}

.deal-card {
    position: relative;
    overflow: hidden;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s;
}

.deal-card:hover {
    transform: scale(1.02);
}

.deal-image {
    width: 100%;
    height: 120px;
    object-fit: cover;
    display: block;
}

.deal-badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background: #ff6f61;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    font-size: 12px;
    font-weight: 600;
}

/* Destinations Section */
.destinations-carousel {
    display: flex;
    gap: 15px;
    overflow-x: auto;
    padding-bottom: 10px;
}

.destination-item {
    position: relative;
    min-width: 250px;
    height: 160px;
    border-radius: 10px;
    overflow: hidden;
    cursor: pointer;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.destination-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s;
}

.destination-item:hover .destination-img {
    transform: scale(1.05);
}

.destination-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0));
    color: white;
    padding: 15px;
}

.destination-name {
    font-size: 16px;
    font-weight: 700;
    margin: 0;
}

.destination-price {
    font-size: 14px;
    opacity: 0.9;
    margin-top: 5px;
}

/* Responsive Adjustments (Quan trọng để hiển thị đúng trên di động) */
@media (max-width: 1024px) {
    .content-layout {
        grid-template-columns: 1fr; /* Sidebar sẽ nằm trên */
    }

    .sidebar-filters {
        order: 2; /* Đẩy sidebar xuống dưới */
    }

    .hotels-container {
        order: 1; /* Đẩy danh sách khách sạn lên trên */
    }
}

@media (max-width: 768px) {
    .hotel-content {
        grid-template-columns: 1fr; /* Hotel card xếp dọc */
        gap: 15px;
    }

    .hotel-images {
        height: auto;
    }
    
    .main-image {
        height: 250px;
    }
    
    .hotel-pricing {
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
        text-align: left;
        border-top: 1px solid #f3f4f6;
        padding-top: 15px;
        margin-top: 15px;
    }

    .price-container {
        align-items: flex-start;
    }
    
    .btn-check-availability {
        max-width: none;
    }
}
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                <span class="separator">›</span>
                <a href="${pageContext.request.contextPath}/search">Việt Nam</a>
                <span class="separator">›</span>
                <span>Hồ Chí Minh</span>
            </div>
            <h1 class="page-title">10 khách sạn tốt nhất ở Hồ Chí Minh</h1>
            
            <div class="filter-tabs">
                <button class="filter-tab" data-filter="star-rating">
                    <span class="tab-icon">⭐</span>
                    Đánh giá sao
                </button>
                <button class="filter-tab active" data-filter="top-picks">
                    <span class="tab-icon">🏆</span>
                    Lựa chọn hàng đầu của chúng tôi
                </button>
                <button class="filter-tab" data-filter="price">
                    <span class="tab-icon">💰</span>
                    Giá thấp nhất trước
                </button>
                <button class="filter-tab" data-filter="distance">
                    <span class="tab-icon">📍</span>
                    Gần nhất với
                    <svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor">
                        <path d="M6 8l-4-4h8z"/>
                    </svg>
                </button>
                <button class="filter-tab" data-filter="rating">
                    <span class="tab-icon">⭐</span>
                    Được đánh giá tốt nhất
                </button>
            </div>
        </div>
    </div>

    <div class="main-wrapper">
        <div class="container">
            <div class="content-layout">
                <aside class="sidebar-filters">
                    <div class="filter-group">
                        <h3 class="filter-title">Đánh giá sao</h3>
                        <div class="filter-options">
                            <label class="filter-checkbox">
                                <input type="checkbox" name="stars" value="5">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">5 sao</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="stars" value="4">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">4 sao</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="stars" value="3">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">3 sao</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="stars" value="2">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">2 sao</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="stars" value="1">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">1 sao</span>
                            </label>
                        </div>
                    </div>

                    <div class="filter-group">
                        <h3 class="filter-title">Điểm đánh giá</h3>
                        <div class="filter-options">
                            <label class="filter-checkbox">
                                <input type="checkbox" name="rating" value="9">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Trên cả tuyệt vời 9+</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="rating" value="8">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Rất tốt 8+</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="rating" value="7">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Tốt 7+</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="rating" value="6">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Dễ chịu 6+</span>
                            </label>
                        </div>
                    </div>

                    <div class="filter-group">
                        <h3 class="filter-title">Khoảng giá mỗi đêm</h3>
                        <div class="price-range-inputs">
                            <input type="number" class="price-input" placeholder="Tối thiểu" min="0">
                            <span class="price-separator">-</span>
                            <input type="number" class="price-input" placeholder="Tối đa" min="0">
                        </div>
                    </div>

                    <div class="filter-group">
                        <h3 class="filter-title">Tiện nghi</h3>
                        <div class="filter-options">
                            <label class="filter-checkbox">
                                <input type="checkbox" name="amenities" value="wifi">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Miễn phí Wi-Fi</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="amenities" value="pool">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Hồ bơi</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="amenities" value="parking">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Đỗ xe miễn phí</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="amenities" value="spa">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Spa</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" name="amenities" value="restaurant">
                                <span class="checkbox-custom"></span>
                                <span class="checkbox-label">Nhà hàng</span>
                            </label>
                        </div>
                    </div>
                </aside>

                <main class="hotels-container">
                    <div class="results-info">
                        <p class="results-count">Tìm thấy <strong>10 khách sạn</strong> tại Hồ Chí Minh</p>
                    </div>

                    <article class="hotel-item">
                        <div class="hotel-content">
                            <div class="hotel-images">
                                <div class="main-image">
                                    <span class="verified-badge">
                                        <svg width="14" height="14" viewBox="0 0 14 14" fill="white">
                                            <path d="M5 7l2 2 4-4"/>
                                        </svg>
                                    </span>
                                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&h=300&fit=crop" 
                                        alt="La Vela Saigon Hotel" class="hotel-main-img">
                                </div>
                                <div class="image-thumbnails">
                                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=100&h=80&fit=crop" 
                                        alt="Room" class="thumbnail-img">
                                    <img src="https://images.unsplash.com/photo-1590490360182-c33d57733427?w=100&h=80&fit=crop" 
                                        alt="Bathroom" class="thumbnail-img">
                                    <div class="more-photos">
                                        <span>Xem hết</span>
                                    </div>
                                </div>
                            </div>

                            <div class="hotel-info">
                                <div class="hotel-header">
                                    <h2 class="hotel-name">KHÁCH SẠN LA VELA SÀI GÒN (LA VELA SAIGON HOTEL)</h2>
                                    <div class="hotel-rating">
                                        <div class="rating-stars">
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                        </div>
                                        <a href="#" class="hotel-location">
                                            <svg width="14" height="14" viewBox="0 0 14 14" fill="currentColor">
                                                <path d="M7 0C4.24 0 2 2.24 2 5c0 3.5 5 9 5 9s5-5.5 5-9c0-2.76-2.24-5-5-5zm0 7c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"/>
                                            </svg>
                                            Quận 3, Hồ Chí Minh - Xem trên bản đồ
                                        </a>
                                    </div>
                                </div>

                                <div class="hotel-amenities">
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M2 4h12v2H2V4zm0 4h12v2H2V8zm0 4h8v2H2v-2z"/>
                                        </svg>
                                        Miễn phí Wi-Fi
                                    </span>
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M8 2c2.2 0 4 1.8 4 4s-1.8 4-4 4-4-1.8-4-4 1.8-4 4-4zm0 10c-3.3 0-6 1.3-6 3v1h12v-1c0-1.7-2.7-3-6-3z"/>
                                        </svg>
                                        Bể bơi
                                    </span>
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M4 4h8v2H4V4zm0 4h6v2H4V8zm8 0h2v2h-2V8zm-8 4h8v2H4v-2z"/>
                                        </svg>
                                        Đỗ xe miễn phí
                                    </span>
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M8 2l2 4h4l-3 3 1 4-4-2-4 2 1-4-3-3h4l2-4z"/>
                                        </svg>
                                        Spa
                                    </span>
                                    <span class="amenity-more">+4</span>
                                </div>

                                <p class="hotel-description">
                                    "Một lựa chọn tuyệt vời cho bất cứ ai đặt chân đến Tphcm, 
                                    dù là đi du lịch, nghỉ dưỡng, hay công tác. Phòng khách 
                                    sạn vô cùng xinh xắn, dịch vụ đẳng cấp 5 sao. Đặc biệt c...
                                    <a href="#" class="read-more">Xem thêm</a>
                                </p>
                            </div>

                            <div class="hotel-pricing">
                                <div class="review-badge">
                                    <div class="review-score-large">9</div>
                                    <div class="review-details">
                                        <div class="review-label">Trên cả tuyệt vời</div>
                                        <div class="review-count">18,993 nhận xét</div>
                                    </div>
                                </div>

                                <div class="price-container">
                                    <div class="price-label">Giá trung bình mỗi đêm</div>
                                    <div class="price-amount">
                                        <span class="price-value">5.935.012</span>
                                        <span class="price-currency">₫</span>
                                    </div>
                                    <button class="btn-check-availability">
                                        Kiểm tra lượng phòng trống
                                    </button>
                                </div>
                            </div>
                        </div>
                    </article>

                    <article class="hotel-item">
                        <div class="hotel-content">
                            <div class="hotel-images">
                                <div class="main-image">
                                    <img src="https://images.unsplash.com/photo-1596436889106-be35e843f974?w=400&h=300&fit=crop" 
                                        alt="Amaya Saigon Boutique Hotel" class="hotel-main-img">
                                </div>
                                <div class="image-thumbnails">
                                    <img src="https://images.unsplash.com/photo-1578683010236-d716f9a3f461?w=100&h=80&fit=crop" 
                                        alt="Room" class="thumbnail-img">
                                    <img src="https://images.unsplash.com/photo-1595576508898-0ad5c879a061?w=100&h=80&fit=crop" 
                                        alt="Lobby" class="thumbnail-img">
                                    <div class="more-photos">
                                        <span>Xem hết</span>
                                    </div>
                                </div>
                            </div>

                            <div class="hotel-info">
                                <div class="hotel-header">
                                    <h2 class="hotel-name">Khách sạn Amaya Saigon Boutique (Amaya Saigon Boutique Hotel)</h2>
                                    <div class="hotel-rating">
                                        <div class="rating-stars">
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                            <span class="star">★</span>
                                        </div>
                                        <a href="#" class="hotel-location">
                                            <svg width="14" height="14" viewBox="0 0 14 14" fill="currentColor">
                                                <path d="M7 0C4.24 0 2 2.24 2 5c0 3.5 5 9 5 9s5-5.5 5-9c0-2.76-2.24-5-5-5zm0 7c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"/>
                                            </svg>
                                            Quận 1, Hồ Chí Minh - Xem trên bản đồ
                                        </a>
                                    </div>
                                </div>

                                <div class="hotel-amenities">
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M2 4h12v2H2V4zm0 4h12v2H2V8zm0 4h8v2H2v-2z"/>
                                        </svg>
                                        Miễn phí Wi-Fi
                                    </span>
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M8 2c2.2 0 4 1.8 4 4s-1.8 4-4 4-4-1.8-4-4 1.8-4 4-4zm0 10c-3.3 0-6 1.3-6 3v1h12v-1c0-1.7-2.7-3-6-3z"/>
                                        </svg>
                                        Bể bơi
                                    </span>
                                    <span class="amenity-badge">
                                        <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                                            <path d="M8 2l2 4h4l-3 3 1 4-4-2-4 2 1-4-3-3h4l2-4z"/>
                                        </svg>
                                        Bãn tiệp tân [24 giờ]
                                    </span>
                                    <span class="amenity-more">+5</span>
                                </div>

                                <p class="hotel-description">
                                    "Room is clean, location and facilities are fantastic."
                                </p>
                            </div>

                            <div class="hotel-pricing">
                                <div class="review-badge">
                                    <div class="review-score-large">9.6</div>
                                    <div class="review-details">
                                        <div class="review-label">Trên cả tuyệt vời</div>
                                        <div class="review-count">114 nhận xét</div>
                                    </div>
                                </div>

                                <div class="price-container">
                                    <div class="price-label">Giá trung bình mỗi đêm</div>
                                    <div class="price-amount">
                                        <span class="price-value">2.651.313</span>
                                        <span class="price-currency">₫</span>
                                    </div>
                                    <button class="btn-check-availability">
                                        Kiểm tra lượng phòng trống
                                    </button>
                                </div>
                            </div>
                        </div>
                    </article>

                    <section class="promo-section">
                        <h2 class="section-title">Chương trình khuyến mãi chớ ở</h2>
                        <div class="promo-carousel">
                            <div class="promo-card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                                <div class="promo-content">
                                    <div class="promo-icon">🎁</div>
                                    <h3 class="promo-title">Giảm đến 15%</h3>
                                    <p class="promo-desc">Cho đặt phòng sớm</p>
                                </div>
                            </div>
                            <div class="promo-card" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                                <div class="promo-content">
                                    <div class="promo-icon">💎</div>
                                    <h3 class="promo-title">Ưu đãi đặc biệt</h3>
                                    <p class="promo-desc">Chỉ duy nhất hôm nay</p>
                                </div>
                            </div>
                            <div class="promo-card" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                                <div class="promo-content">
                                    <div class="promo-icon">🌟</div>
                                    <h3 class="promo-title">Giảm đến 20%</h3>
                                    <p class="promo-desc">Cho thành viên mới</p>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section class="flight-deals-section">
                        <h2 class="section-title">Khuyến mại Chuyển bay về Hoạt động</h2>
                        <div class="deals-grid">
                            <div class="deal-card">
                                <img src="https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=400&h=200&fit=crop" 
                                    alt="Flight Deal" class="deal-image">
                                <div class="deal-badge">Giảm 5%</div>
                            </div>
                            <div class="deal-card">
                                <img src="https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?w=400&h=200&fit=crop" 
                                    alt="Activity Deal" class="deal-image">
                                <div class="deal-badge">Giảm 10%</div>
                            </div>
                            <div class="deal-card">
                                <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=400&h=200&fit=crop" 
                                    alt="Tour Deal" class="deal-image">
                                <div class="deal-badge">Giảm 15%</div>
                            </div>
                        </div>
                    </section>

                    <section class="destinations-section">
                        <h2 class="section-title">Các điểm đến nổi tiếng ngoài Việt Nam</h2>
                        <div class="destinations-carousel">
                            <div class="destination-item">
                                <img src="https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=300&h=200&fit=crop" 
                                    alt="Tokyo" class="destination-img">
                                <div class="destination-overlay">
                                    <h3 class="destination-name">Tokyo</h3>
                                    <p class="destination-price">12.260.424 ₫</p>
                                </div>
                            </div>
                            <div class="destination-item">
                                <img src="https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=300&h=200&fit=crop" 
                                    alt="Bangkok" class="destination-img">
                                <div class="destination-overlay">
                                    <h3 class="destination-name">Bangkok</h3>
                                    <p class="destination-price">7.043.463 ₫</p>
                                </div>
                            </div>
                            <div class="destination-item">
                                <img src="https://images.unsplash.com/photo-1478436127897-769e1b3f0f36?w=300&h=200&fit=crop" 
                                    alt="Yokohama" class="destination-img">
                                <div class="destination-overlay">
                                    <h3 class="destination-name">Yokohama</h3>
                                    <p class="destination-price">6.267.813 ₫</p>
                                </div>
                            </div>
                            <div class="destination-item">
                                <img src="https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=300&h=200&fit=crop" 
                                    alt="Kyoto" class="destination-img">
                                <div class="destination-overlay">
                                    <h3 class="destination-name">Kyoto</h3>
                                    <p class="destination-price">9.307.287 ₫</p>
                                </div>
                            </div>
                            <div class="destination-item">
                                <img src="https://images.unsplash.com/photo-1528164344705-47542687000d?w=300&h=200&fit=crop" 
                                    alt="Nagoya" class="destination-img">
                                <div class="destination-overlay">
                                    <h3 class="destination-name">Nagoya</h3>
                                    <p class="destination-price">5.921.026 ₫</p>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/hotel-search.js"></script>
</body>
</html>