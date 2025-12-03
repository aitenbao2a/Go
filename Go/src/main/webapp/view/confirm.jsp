<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận đặt phòng - Agoda Clone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .confirmation-container {
            max-width: 700px;
            margin: 60px auto;
            padding: 0 20px;
        }
        .confirmation-card {
            background: white;
            padding: 48px;
            border-radius: 16px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #4caf50 0%, #45a049 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
            font-size: 40px;
            color: white;
        }
        .confirmation-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 12px;
            color: #2d3e50;
        }
        .confirmation-subtitle {
            font-size: 16px;
            color: #666;
            margin-bottom: 32px;
        }
        .booking-details {
            background: #f8f9fa;
            padding: 24px;
            border-radius: 12px;
            text-align: left;
            margin-bottom: 32px;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #e0e0e0;
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-label {
            color: #666;
            font-size: 14px;
        }
        .detail-value {
            font-weight: 600;
            color: #2d3e50;
        }
        .action-buttons {
            display: flex;
            gap: 16px;
            margin-top: 32px;
        }
        .btn-primary, .btn-secondary {
            flex: 1;
            padding: 14px 24px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .btn-secondary {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
        }
        .btn-secondary:hover {
            background: #f8f9ff;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <main style="background: #f5f5f5; min-height: 100vh; padding: 40px 0;">
        <div class="confirmation-container">
            <div class="confirmation-card">
                <div class="success-icon">✓</div>
                
                <h1 class="confirmation-title">Đặt phòng thành công!</h1>
                <p class="confirmation-subtitle">
                    Chúng tôi đã gửi email xác nhận đến ${sessionScope.loggedInUser.email}
                </p>
                
                <div class="booking-details">
                    <div class="detail-row">
                        <span class="detail-label">Mã đặt phòng</span>
                        <span class="detail-value">#${booking.bookingId}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Khách sạn</span>
                        <span class="detail-value">${booking.hotelName}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Loại phòng</span>
                        <span class="detail-value">${booking.roomType}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Nhận phòng</span>
                        <span class="detail-value">
                            <fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy"/>
                        </span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Trả phòng</span>
                        <span class="detail-value">
                            <fmt:formatDate value="${booking.checkOutDate}" pattern="dd/MM/yyyy"/>
                        </span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Số khách</span>
                        <span class="detail-value">${booking.numberOfGuests} người</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Tổng tiền</span>
                        <span class="detail-value" style="color: #e74c3c; font-size: 18px;">
                            <fmt:formatNumber value="${booking.totalPrice}" pattern="#,###"/> ₫
                        </span>
                    </div>
                </div>
                
                <div style="background: #e8f5e9; padding: 16px; border-radius: 8px; margin-bottom: 24px;">
                    <p style="margin: 0; font-size: 14px; color: #2e7d32;">
                        💡 <strong>Lưu ý:</strong> Vui lòng xuất trình email xác nhận khi làm thủ tục nhận phòng
                    </p>
                </div>
                
                <div class="action-buttons">
                    <a href="${pageContext.request.contextPath}/my-bookings" class="btn-secondary">
                        Xem đặt phòng của tôi
                    </a>
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn-primary">
                        Về trang chủ
                    </a>
                </div>
                
                <p style="margin-top: 24px; font-size: 13px; color: #999;">
                    Cần hỗ trợ? Liên hệ: support@go.com | 1900-12345
                </p>
            </div>
        </div>
    </main>
    
    <jsp:include page="footer.jsp" />
    
    <script>
        // Confetti animation
        window.onload = function() {
            console.log('Booking confirmed successfully!');
        };
    </script>
</body>
</html>