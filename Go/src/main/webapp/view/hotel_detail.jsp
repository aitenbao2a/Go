<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${hotel.hotelName} - Chi tiết</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .detail-container { max-width: 1100px; margin: 20px auto; padding: 0 20px; }
        
        /* Header khách sạn */
        .hotel-header-detail { margin-bottom: 30px; }
        .hotel-title { font-size: 32px; font-weight: bold; color: #2d3748; }
        .hotel-address-detail { color: #718096; margin-top: 5px; }
        
        /* Ảnh Gallery */
        .gallery-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 10px;
            height: 400px;
            margin-bottom: 40px;
            border-radius: 15px;
            overflow: hidden;
        }
        .main-img { width: 100%; height: 100%; object-fit: cover; }
        .sub-img { width: 100%; height: 50%; object-fit: cover; display: block; }
        
        /* Danh sách phòng */
        .room-section { background: white; border-radius: 12px; padding: 30px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        .section-title { font-size: 24px; margin-bottom: 20px; border-bottom: 1px solid #eee; padding-bottom: 10px; }
        
        .room-card {
            display: flex;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            margin-bottom: 20px;
            overflow: hidden;
        }
        .room-img { width: 250px; height: 180px; object-fit: cover; }
        .room-info { padding: 20px; flex: 1; display: flex; justify-content: space-between; }
        .room-desc h4 { font-size: 18px; margin-bottom: 10px; }
        .room-features span { display: block; font-size: 14px; color: #666; margin-bottom: 5px; }
        
        .room-price-action { text-align: right; min-width: 150px; display: flex; flex-direction: column; justify-content: center; }
        .price-tag { font-size: 22px; color: #e53e3e; font-weight: bold; display: block; margin-bottom: 10px; }
        
        .btn-book {
            background: #667eea; color: white; padding: 10px 20px; 
            border-radius: 6px; text-decoration: none; font-weight: 600;
            transition: 0.2s;
        }
        .btn-book:hover { background: #5a67d8; }
    </style>
</head>
<body>

    <jsp:include page="header.jsp" />

    <div class="detail-container">
        <div class="hotel-header-detail">
            <h1 class="hotel-title">${hotel.hotelName}</h1>
            <p class="hotel-address-detail"><i class="fas fa-map-marker-alt"></i> ${hotel.address}, ${hotel.city}</p>
            <div style="margin-top: 10px; color: #f6ad55;">
                <c:forEach begin="1" end="${hotel.starRating}"><i class="fas fa-star"></i></c:forEach>
            </div>
        </div>

        <c:set var="imgs" value="${fn:split(hotel.images, ',')}" />
        <div class="gallery-grid">
            <div class="gallery-col-1">
                <img src="${(not empty imgs[0]) ? imgs[0] : 'https://via.placeholder.com/800x600'}" class="main-img">
            </div>
            <div class="gallery-col-2" style="display: flex; flex-direction: column; gap: 10px;">
                <img src="${(not empty imgs[1]) ? imgs[1] : 'https://via.placeholder.com/400x300'}" class="sub-img">
                <img src="${(not empty imgs[2]) ? imgs[2] : 'https://via.placeholder.com/400x300'}" class="sub-img">
            </div>
        </div>

        <div style="margin-bottom: 40px;">
            <h3>Giới thiệu</h3>
            <p style="line-height: 1.6; color: #4a5568;">${hotel.description}</p>
            <p><strong>Tiện nghi:</strong> ${hotel.amenities}</p>
        </div>

        <div class="room-section">
            <h3 class="section-title">Phòng trống hiện có</h3>
            
            <c:forEach var="room" items="${listRooms}">
                <div class="room-card">
                    <c:set var="rImgs" value="${fn:split(room.images, ',')}" />
                    <img src="${(not empty rImgs[0]) ? rImgs[0] : 'https://via.placeholder.com/300'}" class="room-img">
                    
                    <div class="room-info">
                        <div class="room-desc">
                            <h4>${room.roomType}</h4>
                            <div class="room-features">
                                <span><i class="fas fa-user"></i> Tối đa ${room.capacity} người</span>
                                <span><i class="fas fa-expand"></i> ${room.description}</span>
                            </div>
                        </div>
                        
                        <div class="room-price-action">
                            <span class="price-tag">
                                <fmt:formatNumber value="${room.pricePerNight}" type="currency" currencySymbol="₫"/>
                            </span>
                            <a href="booking.jsp?hotelId=${hotel.hotelId}&roomId=${room.roomId}" class="btn-book">
                                Đặt ngay
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty listRooms}">
                <p style="text-align: center; color: #e53e3e;">Hiện tại khách sạn này đã hết phòng trống.</p>
            </c:if>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>