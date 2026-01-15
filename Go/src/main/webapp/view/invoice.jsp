<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hóa đơn - ${invoiceCode}</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: #f5f5f5;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    padding: 40px 20px;
}

.invoice-container {
    max-width: 800px;
    margin: 0 auto;
}

.success-badge {
    background: white;
    border-radius: 16px;
    padding: 40px;
    text-align: center;
    margin-bottom: 24px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.success-icon {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    color: white;
    font-size: 40px;
    animation: scaleIn 0.5s ease;
}

@keyframes scaleIn {
    from {
        transform: scale(0);
    }
    to {
        transform: scale(1);
    }
}

.success-title {
    font-size: 28px;
    font-weight: 800;
    color: #1a202c;
    margin-bottom: 8px;
}

.success-subtitle {
    font-size: 16px;
    color: #718096;
}

.invoice-paper {
    background: white;
    border-radius: 16px;
    padding: 48px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 24px;
    position: relative;
}

.invoice-header {
    display: flex;
    justify-content: space-between;
    align-items: start;
    padding-bottom: 32px;
    border-bottom: 2px solid #e2e8f0;
    margin-bottom: 32px;
}

.company-info h1 {
    font-size: 32px;
    font-weight: 800;
    color: #2d3748;
    margin-bottom: 8px;
}

.company-info p {
    font-size: 14px;
    color: #718096;
    line-height: 1.6;
}

.invoice-meta {
    text-align: right;
}

.invoice-code {
    font-size: 24px;
    font-weight: 700;
    color: #2d3748;
    margin-bottom: 12px;
}

.invoice-date {
    font-size: 14px;
    color: #718096;
}

.invoice-section {
    margin-bottom: 32px;
}

.section-title {
    font-size: 14px;
    font-weight: 700;
    color: #4a5568;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 16px;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 24px;
}

.info-box {
    background: #f7fafc;
    padding: 20px;
    border-radius: 8px;
}

.info-label {
    font-size: 12px;
    color: #718096;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 4px;
}

.info-value {
    font-size: 15px;
    font-weight: 600;
    color: #1a202c;
}

.invoice-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 16px;
}

.invoice-table thead {
    background: #f7fafc;
}

.invoice-table th {
    padding: 12px;
    text-align: left;
    font-size: 12px;
    font-weight: 700;
    color: #4a5568;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.invoice-table td {
    padding: 16px 12px;
    border-bottom: 1px solid #e2e8f0;
    font-size: 14px;
    color: #2d3748;
}

.invoice-table tr:last-child td {
    border-bottom: none;
}

.amount-right {
    text-align: right;
    font-weight: 600;
}

.invoice-total {
    margin-top: 24px;
    padding-top: 24px;
    border-top: 2px solid #2d3748;
    display: flex;
    justify-content: flex-end;
}

.total-box {
    background: #2d3748;
    color: white;
    padding: 20px 32px;
    border-radius: 8px;
    text-align: right;
}

.total-label {
    font-size: 14px;
    margin-bottom: 8px;
    opacity: 0.9;
}

.total-amount {
    font-size: 32px;
    font-weight: 800;
}

.invoice-footer {
    margin-top: 40px;
    padding-top: 24px;
    border-top: 1px solid #e2e8f0;
    text-align: center;
}

.footer-note {
    font-size: 13px;
    color: #718096;
    line-height: 1.6;
    margin-bottom: 20px;
}

.payment-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: #d4edda;
    color: #155724;
    padding: 10px 20px;
    border-radius: 20px;
    font-size: 14px;
    font-weight: 600;
}

.action-buttons {
    display: flex;
    gap: 12px;
    justify-content: center;
    margin-top: 24px;
}

.btn {
    padding: 14px 32px;
    border-radius: 10px;
    font-size: 15px;
    font-weight: 600;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    transition: all 0.3s;
    border: none;
    cursor: pointer;
}

.btn-primary {
    background: #2d3748;
    color: white;
}

.btn-primary:hover {
    background: #1a202c;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(45, 55, 72, 0.3);
}

.btn-secondary {
    background: white;
    color: #4a5568;
    border: 2px solid #e2e8f0;
}

.btn-secondary:hover {
    background: #f7fafc;
    border-color: #cbd5e0;
}

@media print {
    body {
        background: white;
        padding: 0;
    }
    
    .success-badge,
    .action-buttons {
        display: none;
    }
    
    .invoice-paper {
        box-shadow: none;
    }
}
</style>
</head>
<body>
    <div class="invoice-container">
        <!-- Success Badge -->
        <div class="success-badge">
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            <div class="success-title">Thanh toán thành công!</div>
            <div class="success-subtitle">Cảm ơn bạn đã đặt phòng. Hóa đơn của bạn đã được tạo.</div>
        </div>

        <!-- Invoice Paper -->
        <div class="invoice-paper" id="invoicePaper">
            <!-- Header -->
            <div class="invoice-header">
                <div class="company-info">
                    <h1>GO TRAVEL</h1>
                    <p>
                        123 Đường ABC, Quận 1<br>
                        TP. Hồ Chí Minh, Việt Nam<br>
                        Email: support@gotravel.vn<br>
                        Hotline: 1900 xxxx
                    </p>
                </div>
                <div class="invoice-meta">
                    <div class="invoice-code">${invoiceCode}</div>
                    <div class="invoice-date">
                        Ngày: <fmt:formatDate value="${paymentTime}" pattern="dd/MM/yyyy HH:mm" />
                    </div>
                    <div class="payment-badge" style="margin-top: 12px;">
                        <i class="fas fa-check-circle"></i>
                        ĐÃ THANH TOÁN
                    </div>
                </div>
            </div>

            <!-- Customer & Booking Info -->
            <div class="invoice-section">
                <div class="section-title">Thông tin khách hàng</div>
                <div class="info-grid">
                    <div class="info-box">
                        <div class="info-label">Họ và tên</div>
                        <div class="info-value">${booking.guestName}</div>
                    </div>
                    <div class="info-box">
                        <div class="info-label">Email</div>
                        <div class="info-value">${booking.guestEmail}</div>
                    </div>
                    <div class="info-box">
                        <div class="info-label">Số điện thoại</div>
                        <div class="info-value">${booking.guestPhone}</div>
                    </div>
                    <div class="info-box">
                        <div class="info-label">Phương thức thanh toán</div>
                        <div class="info-value">
                            <c:choose>
                                <c:when test="${paymentMethod == 'Credit Card'}">Thẻ tín dụng/Ghi nợ</c:when>
                                <c:when test="${paymentMethod == 'Bank Transfer'}">Chuyển khoản ngân hàng</c:when>
                                <c:when test="${paymentMethod == 'E-wallet'}">Ví điện tử</c:when>
                                <c:when test="${paymentMethod == 'Cash'}">Tiền mặt</c:when>
                                <c:otherwise>${paymentMethod}</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Booking Details -->
            <div class="invoice-section">
                <div class="section-title">Chi tiết đặt phòng</div>
                <table class="invoice-table">
                    <thead>
                        <tr>
                            <th>Mô tả</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th class="amount-right">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <strong>${hotel.hotelName}</strong><br>
                                <span style="font-size: 13px; color: #718096;">
                                    ${room.roomType}<br>
                                    <fmt:formatDate value="${booking.checkInDate}" pattern="dd/MM/yyyy" /> - 
                                    <fmt:formatDate value="${booking.checkOutDate}" pattern="dd/MM/yyyy" />
                                    (${booking.numberOfNights} đêm)
                                </span>
                            </td>
                            <td>${booking.numberOfRooms} phòng</td>
                            <td>
                                <fmt:formatNumber value="${room.pricePerNight}" pattern="#,###" />₫/đêm
                            </td>
                            <td class="amount-right">
                                <fmt:formatNumber value="${booking.totalAmount}" pattern="#,###" />₫
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="invoice-total">
                    <div class="total-box">
                        <div class="total-label">TỔNG THANH TOÁN</div>
                        <div class="total-amount">
                            <fmt:formatNumber value="${booking.totalAmount}" pattern="#,###" />₫
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Info -->
            <c:if test="${not empty booking.specialRequests}">
                <div class="invoice-section">
                    <div class="section-title">Yêu cầu đặc biệt</div>
                    <div style="background: #f7fafc; padding: 16px; border-radius: 8px; font-size: 14px; color: #4a5568;">
                        ${booking.specialRequests}
                    </div>
                </div>
            </c:if>

            <!-- Footer -->
            <div class="invoice-footer">
                <div class="footer-note">
                    <strong>Lưu ý quan trọng:</strong><br>
                    Vui lòng xuất trình hóa đơn này khi nhận phòng.<br>
                    Mọi thắc mắc xin liên hệ hotline: 1900 xxxx hoặc email: support@gotravel.vn
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <button class="btn btn-primary" onclick="window.print()">
                <i class="fas fa-print"></i>
                In hóa đơn
            </button>
            <button class="btn btn-primary" onclick="downloadInvoice()">
                <i class="fas fa-download"></i>
                Tải xuống
            </button>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
                <i class="fas fa-home"></i>
                Về trang chủ
            </a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script>
        function downloadInvoice() {
            const invoice = document.getElementById('invoicePaper');
            
            html2canvas(invoice, {
                scale: 2,
                backgroundColor: '#ffffff',
                logging: false
            }).then(canvas => {
                const link = document.createElement('a');
                link.download = 'Invoice_${invoiceCode}.png';
                link.href = canvas.toDataURL('image/png');
                link.click();
            });
        }
    </script>
</body>
</html>