<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đặt phòng - ${hotel.hotelName}</title>
<style>
body {
    background: linear-gradient(135deg, #f5f7fa 0%, #e8ecf1 100%);
}

.booking-container {
    max-width: 1200px;
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
    margin: 0 0 8px 0;
    letter-spacing: -0.02em;
}

.breadcrumb {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.9rem;
    color: #6b7280;
}

.breadcrumb a {
    color: #6366f1;
    text-decoration: none;
    transition: color 0.3s;
}

.breadcrumb a:hover {
    color: #4f46e5;
}

.booking-grid {
    display: grid;
    grid-template-columns: 1fr 420px;
    gap: 28px;
    align-items: start;
}

.booking-form {
    background: white;
    padding: 36px;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    animation: slideUp 0.6s ease;
}

.booking-summary {
    background: white;
    padding: 28px;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    position: sticky;
    top: 100px;
    animation: slideUp 0.6s ease 0.2s both;
}

.form-section {
    margin-bottom: 36px;
    padding-bottom: 32px;
    border-bottom: 2px solid #f3f4f6;
}

.form-section:last-of-type {
    border-bottom: none;
    margin-bottom: 0;
    padding-bottom: 0;
}

.section-title {
    font-size: 1.4rem;
    font-weight: 700;
    margin-bottom: 20px;
    color: #1a202c;
    display: flex;
    align-items: center;
    gap: 10px;
}

.section-icon {
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    font-weight: 600;
    margin-bottom: 10px;
    color: #374151;
    font-size: 0.95rem;
}

.form-label .required {
    color: #ef4444;
    margin-left: 4px;
}

.form-input, .form-select, .form-textarea {
    width: 100%;
    padding: 14px 16px;
    border: 2px solid #e5e7eb;
    border-radius: 12px;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: #fafbfc;
}

.form-textarea {
    min-height: 120px;
    resize: vertical;
    font-family: inherit;
}

.form-input:focus, .form-select:focus, .form-textarea:focus {
    outline: none;
    border-color: #6366f1;
    background: white;
    box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
}

.form-input:hover, .form-select:hover, .form-textarea:hover {
    border-color: #d1d5db;
}

/* Booking Summary Styles */
.hotel-info {
    margin-bottom: 24px;
    padding-bottom: 24px;
    border-bottom: 2px solid #f3f4f6;
}

.hotel-name {
    font-weight: 700;
    font-size: 1.25rem;
    margin-bottom: 8px;
    color: #1a202c;
}

.hotel-address {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #6b7280;
    font-size: 0.95rem;
}

.room-details {
    background: linear-gradient(135deg, #f0f4ff 0%, #e5edff 100%);
    padding: 20px;
    border-radius: 16px;
    margin-bottom: 24px;
}

.room-type {
    font-weight: 700;
    font-size: 1.1rem;
    margin-bottom: 16px;
    color: #1a202c;
}

.detail-row {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.95rem;
    color: #4b5563;
    margin-bottom: 10px;
}

.detail-row:last-child {
    margin-bottom: 0;
}

.detail-icon {
    font-size: 1.1rem;
}

.price-breakdown {
    margin-bottom: 24px;
}

.summary-row {
    display: flex;
    justify-content: space-between;
    padding: 14px 0;
    font-size: 0.95rem;
    color: #4b5563;
}

.summary-row.total {
    padding-top: 20px;
    margin-top: 16px;
    border-top: 3px solid #1a202c;
    font-weight: 800;
    font-size: 1.5rem;
    color: #1a202c;
}

.summary-row.total .amount {
    color: #6366f1;
}

.summary-label {
    font-weight: 500;
}

.summary-amount {
    font-weight: 600;
    color: #1a202c;
}

/* Checkbox Styling */
.checkbox-wrapper {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    margin-bottom: 24px;
}

.checkbox-wrapper input[type="checkbox"] {
    width: 20px;
    height: 20px;
    margin-top: 2px;
    cursor: pointer;
    accent-color: #6366f1;
}

.checkbox-label {
    font-size: 0.9rem;
    color: #4b5563;
    line-height: 1.5;
}

.checkbox-label a {
    color: #6366f1;
    text-decoration: none;
    font-weight: 600;
}

.checkbox-label a:hover {
    text-decoration: underline;
}

/* Submit Button */
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
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 16px rgba(99, 102, 241, 0.3);
    position: relative;
    overflow: hidden;
}

.btn-submit::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.2);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.btn-submit:hover::before {
    width: 400px;
    height: 400px;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(99, 102, 241, 0.4);
}

.btn-submit:active {
    transform: translateY(-1px);
}

/* Error Message */
.error-message {
    background: #fee2e2;
    color: #991b1b;
    padding: 16px 20px;
    border-radius: 12px;
    margin-bottom: 24px;
    border-left: 4px solid #ef4444;
    display: flex;
    align-items: center;
    gap: 12px;
    animation: shake 0.5s ease;
}

.error-icon {
    font-size: 1.5rem;
}

/* Animations */
@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-10px); }
    75% { transform: translateX(10px); }
}

/* Responsive */
@media (max-width: 1024px) {
    .booking-grid {
        grid-template-columns: 1fr;
    }
    
    .booking-summary {
        position: static;
        order: -1;
    }
}

@media (max-width: 768px) {
    .booking-container {
        padding: 0 16px;
        margin: 20px auto;
    }
    
    .page-header {
        padding: 20px;
    }
    
    .page-header h1 {
        font-size: 1.5rem;
    }
    
    .booking-form {
        padding: 24px;
    }
    
    .booking-summary {
        padding: 20px;
    }
    
    .form-row {
        grid-template-columns: 1fr;
    }
    
    .section-title {
        font-size: 1.2rem;
    }
}
</style>
</head>
<body>
    <jsp:include page="headerHome.jsp" />

    <main style="min-height: 100vh; padding: 40px 0;">
        <div class="booking-container">
            
            <!-- Page Header -->
            <div class="page-header">
                <div class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                    <span>›</span>
                    <a href="${pageContext.request.contextPath}/hotel-detail?id=${hotel.hotelId}">${hotel.hotelName}</a>
                    <span>›</span>
                    <span>Đặt phòng</span>
                </div>
                <h1>Hoàn tất đặt phòng</h1>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="error-message">
                    <span class="error-icon">⚠️</span>
                    <span>${error}</span>
                </div>
            </c:if>

            <div class="booking-grid">
                <!-- Booking Form -->
                <div class="booking-form">
                    <form action="${pageContext.request.contextPath}/booking" method="post">
                        <input type="hidden" name="roomId" value="${room.roomId}">
                        <input type="hidden" name="hotelId" value="${hotel.hotelId}">
                        <input type="hidden" name="checkIn" value="${checkIn}">
                        <input type="hidden" name="checkOut" value="${checkOut}">
                        <input type="hidden" name="nights" value="${nights}">
                        <input type="hidden" name="numberOfRooms" value="${numberOfRooms}">

                        <!-- Guest Information -->
                        <div class="form-section">
                            <h2 class="section-title">
                                <span class="section-icon">👤</span>
                                Thông tin khách hàng
                            </h2>

                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">
                                        Họ và tên<span class="required">*</span>
                                    </label>
                                    <input type="text" name="guestName" class="form-input"
                                        value="${user.fullName}" required 
                                        placeholder="Nhập họ tên đầy đủ">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">
                                        Email<span class="required">*</span>
                                    </label>
                                    <input type="email" name="guestEmail" class="form-input"
                                        value="${user.email}" required 
                                        placeholder="email@example.com">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">
                                        Số điện thoại<span class="required">*</span>
                                    </label>
                                    <input type="tel" name="guestPhone" class="form-input"
                                        value="${user.phone}" required 
                                        placeholder="0912 345 678">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">
                                        Số lượng khách<span class="required">*</span>
                                    </label>
                                    <select name="numberOfGuests" class="form-select" required>
                                        <option value="1">1 người</option>
                                        <option value="2" selected>2 người</option>
                                        <option value="3">3 người</option>
                                        <option value="4">4 người</option>
                                        <option value="5">5 người</option>
                                        <option value="6">6 người</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Special Requests -->
                        <div class="form-section">
                            <h2 class="section-title">
                                <span class="section-icon">📝</span>
                                Yêu cầu đặc biệt
                            </h2>
                            <div class="form-group">
                                <label class="form-label">
                                    Ghi chú cho khách sạn (không bắt buộc)
                                </label>
                                <textarea name="specialRequests" class="form-textarea"
                                    placeholder="Ví dụ: Tầng cao, view biển, giường đôi, check-in sớm..."></textarea>
                            </div>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="form-section">
                            <div class="checkbox-wrapper">
                                <input type="checkbox" id="terms" required>
                                <label for="terms" class="checkbox-label">
                                    Tôi đã đọc và đồng ý với 
                                    <a href="#" target="_blank">Điều khoản sử dụng</a> và 
                                    <a href="#" target="_blank">Chính sách bảo mật</a> của Go Travel
                                </label>
                            </div>
                        </div>

                        <button type="submit" class="btn-submit">
                            Xác nhận đặt phòng
                        </button>
                    </form>
                </div>

                <!-- Booking Summary -->
                <div class="booking-summary">
                    <div class="hotel-info">
                        <div class="hotel-name">${hotel.hotelName}</div>
                        <div class="hotel-address">
                            <span>📍</span>
                            <span>${hotel.address}, ${hotel.city}</span>
                        </div>
                    </div>

                    <div class="room-details">
                        <div class="room-type">${room.roomType}</div>
                        <div class="detail-row">
                            <span class="detail-icon">📅</span>
                            <span>Nhận phòng: <strong>${checkIn}</strong></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-icon">📅</span>
                            <span>Trả phòng: <strong>${checkOut}</strong></span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-icon">🌙</span>
                            <span><strong>${nights}</strong> đêm</span>
                        </div>
                        <div class="detail-row">
                            <span class="detail-icon">🚪</span>
                            <span><strong>${numberOfRooms}</strong> phòng</span>
                        </div>
                    </div>

                    <div class="price-breakdown">
                        <div class="summary-row">
                            <span class="summary-label">
                                <fmt:formatNumber value="${room.pricePerNight}" pattern="#,###" />₫ 
                                × ${nights} đêm × ${numberOfRooms} phòng
                            </span>
                            <span class="summary-amount">
                                <fmt:formatNumber value="${room.pricePerNight * nights * numberOfRooms}" pattern="#,###" />₫
                            </span>
                        </div>
                        <div class="summary-row">
                            <span class="summary-label">Thuế và phí dịch vụ (10%)</span>
                            <span class="summary-amount">
                                <fmt:formatNumber value="${(room.pricePerNight * nights * numberOfRooms) * 0.1}" pattern="#,###" />₫
                            </span>
                        </div>
                        <div class="summary-row total">
                            <span>Tổng thanh toán</span>
                            <span class="amount">
                                <fmt:formatNumber value="${(room.pricePerNight * nights * numberOfRooms) * 1.1}" pattern="#,###" />₫
                            </span>
                        </div>
                    </div>

                    <div style="padding: 16px; background: #f0fdf4; border-radius: 12px; border: 2px solid #86efac;">
                        <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
                            <span style="font-size: 1.2rem;">✅</span>
                            <span style="font-weight: 700; color: #166534;">Miễn phí hủy phòng</span>
                        </div>
                        <div style="font-size: 0.85rem; color: #166534;">
                            Hủy miễn phí trước 24 giờ so với thời gian nhận phòng
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="footer.jsp" />
</body>
</html>