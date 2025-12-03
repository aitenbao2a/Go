<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán - Agoda Clone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        .payment-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .payment-card {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .payment-method {
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 16px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .payment-method:hover {
            border-color: #667eea;
        }
        .payment-method.selected {
            border-color: #667eea;
            background: #f8f9ff;
        }
        .payment-icon {
            font-size: 32px;
        }
        .payment-info {
            flex: 1;
        }
        .payment-name {
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 4px;
        }
        .payment-desc {
            font-size: 14px;
            color: #666;
        }
        .card-form {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
        }
        .card-form.active {
            display: block;
        }
        .security-info {
            background: #e8f5e9;
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 24px;
            border-left: 4px solid #4caf50;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <main style="background: #f5f5f5; min-height: 100vh; padding: 40px 0;">
        <div class="payment-container">
            <h1 style="font-size: 32px; margin-bottom: 8px;">Thanh toán</h1>
            <p style="color: #666; margin-bottom: 32px;">
                Booking ID: #${booking.bookingId}
            </p>
            
            <div class="payment-card">
                <div class="security-info">
                    <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
                        <span style="font-size: 20px;">🔒</span>
                        <strong>Thanh toán an toàn</strong>
                    </div>
                    <p style="font-size: 14px; color: #666; margin: 0;">
                        Thông tin của bạn được bảo mật với mã hóa SSL 256-bit
                    </p>
                </div>
                
                <h2 style="font-size: 20px; font-weight: 700; margin-bottom: 24px;">
                    Chọn phương thức thanh toán
                </h2>
                
                <form action="${pageContext.request.contextPath}/payment" method="post">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                    
                    <!-- Credit Card -->
                    <div class="payment-method selected" onclick="selectPayment('credit_card')">
                        <input type="radio" name="paymentMethod" value="credit_card" checked>
                        <div class="payment-icon">💳</div>
                        <div class="payment-info">
                            <div class="payment-name">Thẻ tín dụng/Ghi nợ</div>
                            <div class="payment-desc">Visa, Mastercard, JCB</div>
                        </div>
                    </div>
                    
                    <div id="creditCardForm" class="card-form active">
                        <div class="form-group">
                            <label class="form-label">Số thẻ</label>
                            <input type="text" class="form-input" placeholder="1234 5678 9012 3456" 
                                   maxlength="19" required>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">Ngày hết hạn</label>
                                <input type="text" class="form-input" placeholder="MM/YY" 
                                       maxlength="5" required>
                            </div>
                            <div class="form-group">
                                <label class="form-label">CVV</label>
                                <input type="text" class="form-input" placeholder="123" 
                                       maxlength="3" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Tên chủ thẻ</label>
                            <input type="text" class="form-input" 
                                   placeholder="NGUYEN VAN A" required>
                        </div>
                    </div>
                    
                    <!-- Bank Transfer -->
                    <div class="payment-method" onclick="selectPayment('bank_transfer')">
                        <input type="radio" name="paymentMethod" value="bank_transfer">
                        <div class="payment-icon">🏦</div>
                        <div class="payment-info">
                            <div class="payment-name">Chuyển khoản ngân hàng</div>
                            <div class="payment-desc">Chuyển khoản trực tiếp</div>
                        </div>
                    </div>
                    
                    <!-- E-Wallet -->
                    <div class="payment-method" onclick="selectPayment('e_wallet')">
                        <input type="radio" name="paymentMethod" value="e_wallet">
                        <div class="payment-icon">📱</div>
                        <div class="payment-info">
                            <div class="payment-name">Ví điện tử</div>
                            <div class="payment-desc">MoMo, ZaloPay, VNPay</div>
                        </div>
                    </div>
                    
                    <!-- Payment Summary -->
                    <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; margin-top: 24px;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 12px;">
                            <span>Tổng tiền thanh toán</span>
                            <span style="font-size: 24px; font-weight: 700; color: #e74c3c;">
                                <fmt:formatNumber value="${booking.totalPrice}" pattern="#,###"/> ₫
                            </span>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn-submit">
                        Xác nhận thanh toán
                    </button>
                    
                    <p style="text-align: center; font-size: 12px; color: #999; margin-top: 16px;">
                        Bằng cách tiếp tục, bạn đồng ý với điều khoản và điều kiện của chúng tôi
                    </p>
                </form>
            </div>
        </div>
    </main>
    
    <jsp:include page="footer.jsp" />
    
    <script>
        function selectPayment(method) {
            // Update radio buttons
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('selected');
            });
            event.currentTarget.classList.add('selected');
            event.currentTarget.querySelector('input[type="radio"]').checked = true;
            
            // Show/hide card form
            document.querySelectorAll('.card-form').forEach(form => {
                form.classList.remove('active');
            });
            
            if (method === 'credit_card') {
                document.getElementById('creditCardForm').classList.add('active');
            }
        }
    </script>
</body>
</html>