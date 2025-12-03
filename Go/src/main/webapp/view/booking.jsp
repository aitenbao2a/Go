<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt phòng - ${hotel.hotelName}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .booking-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .booking-grid {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 24px;
        }
        .booking-form {
            background: white;
            padding: 32px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .booking-summary {
            background: white;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            height: fit-content;
            position: sticky;
            top: 100px;
        }
        .form-section {
            margin-bottom: 32px;
        }
        .section-title {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 16px;
            color: #2d3e50;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 16px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
            font-size: 14px;
        }
        .form-input, .form-select, .form-textarea {
            width: 100%;
            padding: 12px 14px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.2s;
        }
        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }
        .form-input:focus, .form-select:focus, .form-textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .summary-row:last-child {
            border-bottom: none;
            padding-top: 16px;
            margin-top: 8px;
            border-top: 2px solid #333;
            font-weight: 700;
            font-size: 18px;
        }
        .btn-submit {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 24px;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        .error-message {
            background: #fee;
            color: #c33;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 4px solid #c33;
        }
        @media (max-width: 768px) {
            .booking-grid {
                grid-template-columns: 1fr;
            }
            .booking-summary {
                position: static;
            }
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <main style="background: #f5f5f5; min-height: 100vh; padding: 40px 0;">
        <div class="booking-container">
            <h1 style="font-size: 32px; margin-bottom: 24px;">Hoàn tất đặt phòng</h1>
            
            <c:if test="${not empty error}">
                <div class="error-message">${error}</div>
            </c:if>
            
            <div class="booking-grid">
                <!-- Booking Form -->
                <div class="booking-form">
                    <form action="${pageContext.request.contextPath}/booking" method="post">
                        <input type="hidden" name="roomId" value="${room.roomId}">
                        <input type="hidden" name="checkIn" value="${checkIn}">
                        <input type="hidden" name="checkOut" value="${checkOut}">
                        
                        <!-- Guest Information -->
                        <div class="form-section">
                            <h2 class="section-title">Thông tin khách hàng</h2>
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Họ và tên *</label>
                                    <input type="text" name="guestName" class="form-input" 
                                           value="${sessionScope.loggedInUser.fullName}" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email *</label>
                                    <input type="email" name="guestEmail" class="form-input" 
                                           value="${sessionScope.loggedInUser.email}" required>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group">
                                    <label class="form-label">Số điện thoại *</label>
                                    <input type="tel" name="guestPhone" class="form-input" 
                                           value="${sessionScope.loggedInUser.phone}" required>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Số khách *</label>
                                    <select name="numberOfGuests" class="form-select" required>
                                        <option value="1">1 người</option>
                                        <option value="2" selected>2 người</option>
                                        <option value="3">3 người</option>
                                        <option value="4">4 người</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Special Requests -->
                        <div class="form-section">
                            <h2 class="section-title">Yêu cầu đặc biệt</h2>
                            <div class="form-group">
                                <label class="form-label">Ghi chú (không bắt buộc)</label>
                                <textarea name="specialRequests" class="form-textarea" 
                                          placeholder="Ví dụ: Tầng cao, view đẹp, giường đôi..."></textarea>
                            </div>
                        </div>
                        
                        <!-- Terms and Conditions -->
                        <div class="form-section">
                            <label style="display: flex; align-items: center; gap: 8px;">
                                <input type="checkbox" required>
                                <span style="font-size: 14px; color: #666;">
                                    Tôi đồng ý với 
                                    <a href="#" style="color: #667eea;">Điều khoản sử dụng</a> và 
                                    <a href="#" style="color: #667eea;">Chính sách bảo mật</a>
                                </span>
                            </label>
                        </div>
                        
                        <button type="submit" class="btn-submit">
                            Tiếp tục thanh toán
                        </button>
                    </form>
                </div>
                
                <!-- Booking Summary -->
                <div class="booking-summary">
                    <h3 style="font-size: 18px; font-weight: 700; margin-bottom: 16px;">
                        Chi tiết đặt phòng
                    </h3>
                    
                    <div style="margin-bottom: 20px;">
                        <div style="font-weight: 700; font-size: 16px; margin-bottom: 8px;">
                            ${hotel.hotelName}
                        </div>
                        <div style="color: #666; font-size: 14px;">
                            📍 ${hotel.address}, ${hotel.city}
                        </div>
                    </div>
                    
                    <div style="background: #f8f9fa; padding: 16px; border-radius: 8px; margin-bottom: 20px;">
                        <div style="font-weight: 700; margin-bottom: 12px;">${room.roomType}</div>
                        <div style="font-size: 14px; color: #666; margin-bottom: 8px;">
                            📅 Nhận phòng: ${checkIn}
                        </div>
                        <div style="font-size: 14px; color: #666; margin-bottom: 8px;">
                            📅 Trả phòng: ${checkOut}
                        </div>
                        <div style="font-size: 14px; color: #666;">
                            🌙 ${nights} đêm
                        </div>
                    </div>
                    
                    <div class="summary-row">
                        <span>Giá phòng (${nights} đêm)</span>
                        <span>
                            <fmt:formatNumber value="${room.pricePerNight * nights}" pattern="#,###"/> ₫
                        </span>
                    </div>
                    <div class="summary-row">
                        <span>Thuế và phí</span>
                        <span>
                            <fmt:formatNumber value="${totalPrice * 0.1}" pattern="#,###"/> ₫
                        </span>
                    </div>
                    <div class="summary-row">
                        <span>Tổng cộng</span>
                        <span style="color: #e74c3c;">
                            <fmt:formatNumber value="${totalPrice * 1.1}" pattern="#,###"/> ₫
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <jsp:include page="footer.jsp" />
</body>
</html>
