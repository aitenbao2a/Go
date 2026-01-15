<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thanh toán - ${hotel.hotelName}</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
body {
    background: linear-gradient(135deg, #f5f7fa 0%, #e8ecf1 100%);
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.payment-container {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 24px;
}

.page-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 32px;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(102, 126, 234, 0.4);
    margin-bottom: 32px;
    color: white;
}

.page-header h1 {
    font-size: 2rem;
    font-weight: 800;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 12px;
}

.payment-content {
    background: white;
    padding: 36px;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.booking-summary {
    background: linear-gradient(135deg, #f0f4ff 0%, #e5edff 100%);
    padding: 28px;
    border-radius: 16px;
    margin-bottom: 32px;
    border: 2px solid #e0e7ff;
}

.summary-title {
    font-size: 1.4rem;
    font-weight: 700;
    margin-bottom: 24px;
    color: #1a202c;
    display: flex;
    align-items: center;
    gap: 10px;
}

.summary-title i {
    color: #667eea;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    padding: 14px 0;
    border-bottom: 1px solid rgba(102, 126, 234, 0.1);
}

.summary-item:last-child {
    border-bottom: none;
}

.summary-label {
    color: #4b5563;
    font-size: 0.95rem;
    display: flex;
    align-items: center;
    gap: 8px;
}

.summary-label i {
    color: #667eea;
    width: 20px;
}

.summary-value {
    font-weight: 600;
    color: #1a202c;
}

.total-row {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 3px solid #667eea;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    padding: 20px;
    border-radius: 12px;
    margin-left: -20px;
    margin-right: -20px;
}

.total-row .summary-label {
    font-size: 1.3rem;
    font-weight: 700;
    color: #1a202c;
}

.total-row .summary-value {
    font-size: 1.6rem;
    font-weight: 800;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.payment-section {
    margin-bottom: 32px;
}

.section-title {
    font-size: 1.3rem;
    font-weight: 700;
    margin-bottom: 24px;
    color: #1a202c;
    display: flex;
    align-items: center;
    gap: 12px;
}

.section-title i {
    color: #667eea;
}

.payment-methods {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
}

.payment-option {
    position: relative;
    border: 2px solid #e5e7eb;
    border-radius: 16px;
    padding: 24px;
    cursor: pointer;
    transition: all 0.3s ease;
    background: white;
}

.payment-option:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
}

.payment-option input[type="radio"] {
    position: absolute;
    opacity: 0;
}

.payment-option input[type="radio"]:checked ~ .payment-content-wrap {
    color: white;
}

.payment-option input[type="radio"]:checked ~ .payment-content-wrap .payment-icon {
    transform: scale(1.1);
}

.payment-option:nth-child(1) input[type="radio"]:checked ~ .payment-content-wrap .payment-icon {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
}

.payment-option:nth-child(2) input[type="radio"]:checked ~ .payment-content-wrap .payment-icon {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    box-shadow: 0 8px 20px rgba(240, 147, 251, 0.4);
}

.payment-option:nth-child(3) input[type="radio"]:checked ~ .payment-content-wrap .payment-icon {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    box-shadow: 0 8px 20px rgba(79, 172, 254, 0.4);
}

.payment-option:nth-child(4) input[type="radio"]:checked ~ .payment-content-wrap .payment-icon {
    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    box-shadow: 0 8px 20px rgba(67, 233, 123, 0.4);
}

.payment-option:nth-child(1):hover {
    border-color: #667eea;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.05) 0%, rgba(118, 75, 162, 0.05) 100%);
}

.payment-option:nth-child(2):hover {
    border-color: #f093fb;
    background: linear-gradient(135deg, rgba(240, 147, 251, 0.05) 0%, rgba(245, 87, 108, 0.05) 100%);
}

.payment-option:nth-child(3):hover {
    border-color: #4facfe;
    background: linear-gradient(135deg, rgba(79, 172, 254, 0.05) 0%, rgba(0, 242, 254, 0.05) 100%);
}

.payment-option:nth-child(4):hover {
    border-color: #43e97b;
    background: linear-gradient(135deg, rgba(67, 233, 123, 0.05) 0%, rgba(56, 249, 215, 0.05) 100%);
}

.payment-content-wrap {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    gap: 14px;
}

.payment-icon {
    width: 70px;
    height: 70px;
    background: linear-gradient(135deg, #e5e7eb 0%, #d1d5db 100%);
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 2rem;
    transition: all 0.4s ease;
}

.payment-label {
    font-weight: 600;
    font-size: 1.05rem;
    color: #374151;
    transition: all 0.3s ease;
}

.btn-submit {
    width: 100%;
    padding: 20px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    border-radius: 14px;
    font-size: 1.15rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.4s;
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
}

.btn-submit:active {
    transform: translateY(0);
}

.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: white;
    color: #667eea;
    text-decoration: none;
    border-radius: 10px;
    font-weight: 600;
    margin-bottom: 20px;
    transition: all 0.3s;
    border: 2px solid #667eea;
}

.btn-back:hover {
    background: #667eea;
    color: white;
    transform: translateX(-4px);
}

.error-message {
    background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
    color: #991b1b;
    padding: 16px 20px;
    border-radius: 12px;
    margin-bottom: 24px;
    border-left: 4px solid #ef4444;
    display: flex;
    align-items: center;
    gap: 10px;
}

.success-message {
    background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
    color: #065f46;
    padding: 20px 24px;
    border-radius: 12px;
    margin-bottom: 24px;
    border-left: 4px solid #10b981;
    display: flex;
    align-items: center;
    gap: 12px;
    font-weight: 600;
}

@media (max-width: 768px) {
    .payment-methods {
        grid-template-columns: 1fr;
    }
}
</style>
</head>
<body>
    <jsp:include page="headerHome.jsp" />

    <main style="min-height: 100vh; padding: 40px 0;">
        <div class="payment-container">
            
            <div class="page-header">
                <h1><i class="fas fa-credit-card"></i> Thanh toán đặt phòng</h1>
            </div>

            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="success-message">
                    <i class="fas fa-check-circle"></i>
                    <span>${success}</span>
                </div>
            </c:if>

            <a href="${pageContext.request.contextPath}/booking?roomId=${room.roomId}&hotelId=${hotel.hotelId}" 
               class="btn-back">
                <i class="fas fa-arrow-left"></i> Quay lại
            </a>

            <div class="payment-content">
                <!-- Booking Summary -->
                <div class="booking-summary">
                    <div class="summary-title">
                        <i class="fas fa-file-invoice"></i>
                        Chi tiết đặt phòng
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-hotel"></i>
                            Khách sạn:
                        </span>
                        <span class="summary-value">${hotel.hotelName}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-door-open"></i>
                            Loại phòng:
                        </span>
                        <span class="summary-value">${room.roomType}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-user"></i>
                            Khách hàng:
                        </span>
                        <span class="summary-value">${booking.guestName}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-envelope"></i>
                            Email:
                        </span>
                        <span class="summary-value">${booking.guestEmail}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-phone"></i>
                            Số điện thoại:
                        </span>
                        <span class="summary-value">${booking.guestPhone}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-calendar-check"></i>
                            Nhận phòng:
                        </span>
                        <span class="summary-value">
                            <fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy" />
                        </span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-calendar-times"></i>
                            Trả phòng:
                        </span>
                        <span class="summary-value">
                            <fmt:formatDate value="${booking.checkOutDate}" pattern="dd/MM/yyyy" />
                        </span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-bed"></i>
                            Số phòng:
                        </span>
                        <span class="summary-value">${booking.numberOfRooms} phòng</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">
                            <i class="fas fa-users"></i>
                            Số khách:
                        </span>
                        <span class="summary-value">${booking.numberOfGuests} người</span>
                    </div>
                    
                    <c:if test="${not empty booking.specialRequests}">
                        <div class="summary-item">
                            <span class="summary-label">
                                <i class="fas fa-clipboard-list"></i>
                                Yêu cầu đặc biệt:
                            </span>
                            <span class="summary-value">${booking.specialRequests}</span>
                        </div>
                    </c:if>
                    
                    <div class="summary-item total-row">
                        <span class="summary-label">
                            <i class="fas fa-money-bill-wave"></i>
                            Tổng thanh toán:
                        </span>
                        <span class="summary-value">
                            <fmt:formatNumber value="${booking.totalAmount}" pattern="#,###" />₫
                        </span>
                    </div>
                </div>

                <!-- Payment Methods -->
                <form action="${pageContext.request.contextPath}/payment" method="post">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                    <input type="hidden" name="sendEmail" value="true">
                    
                    <div class="payment-section">
                        <div class="section-title">
                            <i class="fas fa-wallet"></i>
                            Chọn phương thức thanh toán
                        </div>

                        <div class="payment-methods">
                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Credit Card" required>
                                <div class="payment-content-wrap">
                                    <span class="payment-icon">
                                        <i class="fas fa-credit-card"></i>
                                    </span>
                                    <span class="payment-label">Thẻ tín dụng / Ghi nợ</span>
                                </div>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Bank Transfer">
                                <div class="payment-content-wrap">
                                    <span class="payment-icon">
                                        <i class="fas fa-university"></i>
                                    </span>
                                    <span class="payment-label">Chuyển khoản ngân hàng</span>
                                </div>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="E-wallet">
                                <div class="payment-content-wrap">
                                    <span class="payment-icon">
                                        <i class="fas fa-mobile-alt"></i>
                                    </span>
                                    <span class="payment-label">Ví điện tử</span>
                                </div>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Cash">
                                <div class="payment-content-wrap">
                                    <span class="payment-icon">
                                        <i class="fas fa-money-bill-wave"></i>
                                    </span>
                                    <span class="payment-label">Thanh toán tại khách sạn</span>
                                </div>
                            </label>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-check-circle"></i> 
                        Hoàn tất đặt phòng & Gửi hóa đơn qua Email
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>