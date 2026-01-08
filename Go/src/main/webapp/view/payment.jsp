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
    background: white;
    padding: 24px 32px;
    border-radius: 16px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    margin-bottom: 32px;
}

.page-header h1 {
    font-size: 2rem;
    font-weight: 800;
    color: #1a202c;
    margin: 0;
}

.payment-content {
    background: white;
    padding: 36px;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.booking-summary {
    background: linear-gradient(135deg, #f0f4ff 0%, #e5edff 100%);
    padding: 24px;
    border-radius: 16px;
    margin-bottom: 32px;
}

.summary-title {
    font-size: 1.3rem;
    font-weight: 700;
    margin-bottom: 20px;
    color: #1a202c;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid rgba(99, 102, 241, 0.1);
}

.summary-item:last-child {
    border-bottom: none;
}

.summary-label {
    color: #4b5563;
    font-size: 0.95rem;
}

.summary-value {
    font-weight: 600;
    color: #1a202c;
}

.total-row {
    margin-top: 20px;
    padding-top: 20px;
    border-top: 3px solid #6366f1;
}

.total-row .summary-label {
    font-size: 1.2rem;
    font-weight: 700;
    color: #1a202c;
}

.total-row .summary-value {
    font-size: 1.5rem;
    font-weight: 800;
    color: #6366f1;
}

.payment-section {
    margin-bottom: 32px;
}

.section-title {
    font-size: 1.2rem;
    font-weight: 700;
    margin-bottom: 20px;
    color: #1a202c;
    display: flex;
    align-items: center;
    gap: 10px;
}

.payment-methods {
    display: grid;
    gap: 16px;
}

.payment-option {
    position: relative;
    border: 2px solid #e5e7eb;
    border-radius: 12px;
    padding: 20px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.payment-option:hover {
    border-color: #6366f1;
    background: #f9fafb;
}

.payment-option input[type="radio"] {
    position: absolute;
    opacity: 0;
}

.payment-option input[type="radio"]:checked + .payment-label {
    color: #6366f1;
}

.payment-option input[type="radio"]:checked ~ .payment-option {
    border-color: #6366f1;
    background: #f0f4ff;
}

.payment-label {
    display: flex;
    align-items: center;
    gap: 12px;
    font-weight: 600;
    font-size: 1.05rem;
    color: #374151;
    cursor: pointer;
}

.payment-icon {
    width: 40px;
    height: 40px;
    background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
}

.btn-submit {
    width: 100%;
    padding: 18px;
    background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
    color: white;
    border: none;
    border-radius: 14px;
    font-size: 1.1rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.4s;
    box-shadow: 0 4px 16px rgba(99, 102, 241, 0.3);
}

.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 24px rgba(99, 102, 241, 0.4);
}

.btn-back {
    display: inline-block;
    padding: 12px 24px;
    background: #f3f4f6;
    color: #4b5563;
    text-decoration: none;
    border-radius: 10px;
    font-weight: 600;
    margin-bottom: 20px;
    transition: all 0.3s;
}

.btn-back:hover {
    background: #e5e7eb;
}

.error-message {
    background: #fee2e2;
    color: #991b1b;
    padding: 16px 20px;
    border-radius: 12px;
    margin-bottom: 24px;
    border-left: 4px solid #ef4444;
}
</style>
</head>
<body>
    <jsp:include page="headerHome.jsp" />

    <main style="min-height: 100vh; padding: 40px 0;">
        <div class="payment-container">
            
            <div class="page-header">
                <h1><i class="fas fa-credit-card"></i> Thanh toán</h1>
            </div>

            <c:if test="${not empty error}">
                <div class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <a href="${pageContext.request.contextPath}/booking?roomId=${room.roomId}&hotelId=${hotel.hotelId}" 
               class="btn-back">
                <i class="fas fa-arrow-left"></i> Quay lại
            </a>

            <div class="payment-content">
                <!-- Booking Summary -->
                <div class="booking-summary">
                    <div class="summary-title">Chi tiết đặt phòng</div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Khách sạn:</span>
                        <span class="summary-value">${hotel.hotelName}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Loại phòng:</span>
                        <span class="summary-value">${room.roomType}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Khách hàng:</span>
                        <span class="summary-value">${booking.guestName}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Email:</span>
                        <span class="summary-value">${booking.guestEmail}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Số điện thoại:</span>
                        <span class="summary-value">${booking.guestPhone}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Nhận phòng:</span>
                        <span class="summary-value">
                            <fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy" />
                        </span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Trả phòng:</span>
                        <span class="summary-value">
                            <fmt:formatDate value="${booking.checkOutDate}" pattern="dd/MM/yyyy" />
                        </span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Số phòng:</span>
                        <span class="summary-value">${booking.numberOfRooms} phòng</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="summary-label">Số khách:</span>
                        <span class="summary-value">${booking.numberOfGuests} người</span>
                    </div>
                    
                    <c:if test="${not empty booking.specialRequests}">
                        <div class="summary-item">
                            <span class="summary-label">Yêu cầu đặc biệt:</span>
                            <span class="summary-value">${booking.specialRequests}</span>
                        </div>
                    </c:if>
                    
                    <div class="summary-item total-row">
                        <span class="summary-label">Tổng thanh toán:</span>
                        <span class="summary-value">
                            <fmt:formatNumber value="${booking.totalAmount}" pattern="#,###" />₫
                        </span>
                    </div>
                </div>

                <!-- Payment Methods -->
                <form action="${pageContext.request.contextPath}/payment" method="post">
                    <div class="payment-section">
                        <div class="section-title">
                            <i class="fas fa-wallet"></i>
                            Chọn phương thức thanh toán
                        </div>

                        <div class="payment-methods">
                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Credit Card" required>
                                <span class="payment-label">
                                    <span class="payment-icon">
                                        <i class="fas fa-credit-card"></i>
                                    </span>
                                    <span>Thẻ tín dụng / Thẻ ghi nợ</span>
                                </span>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Bank Transfer">
                                <span class="payment-label">
                                    <span class="payment-icon">
                                        <i class="fas fa-university"></i>
                                    </span>
                                    <span>Chuyển khoản ngân hàng</span>
                                </span>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="E-wallet">
                                <span class="payment-label">
                                    <span class="payment-icon">
                                        <i class="fas fa-mobile-alt"></i>
                                    </span>
                                    <span>Ví điện tử (MoMo, ZaloPay)</span>
                                </span>
                            </label>

                            <label class="payment-option">
                                <input type="radio" name="paymentMethod" value="Cash">
                                <span class="payment-label">
                                    <span class="payment-icon">
                                        <i class="fas fa-money-bill-wave"></i>
                                    </span>
                                    <span>Thanh toán tại khách sạn</span>
                                </span>
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn-submit">
                        <i class="fas fa-check-circle"></i> Hoàn tất đặt phòng
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>