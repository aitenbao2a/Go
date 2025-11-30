<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="login-modal" class="modal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        
        <div class="modal-title">Đăng nhập / Tạo tài khoản</div>
        <p class="modal-subtitle" style="font-size: 14px; color: #666; margin-bottom: 20px;">
            Đăng nhập để quản lý đặt phòng và nhận ưu đãi riêng.
        </p>

        <button class="social-btn btn-google" style="background: white; color: #333; border: 1px solid #ddd;">
            <i class="fa-brands fa-google" style="color: #DB4437;"></i> Tiếp tục với Google
        </button>
        <button class="social-btn btn-facebook" style="background: #1877f2; color: white; border: none;">
            <i class="fa-brands fa-facebook-f"></i> Tiếp tục với Facebook
        </button>

        <div class="divider">HOẶC</div>

        <form action="LoginServlet" method="POST">
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-input" placeholder="Email (Ví dụ: test@agoda.com)" required>
            </div>
            <div class="form-group">
                <label class="form-label">Mật khẩu</label>
                <input type="password" name="password" class="form-input" placeholder="Mật khẩu" required>
            </div>
            
            <button type="submit" class="btn-continue">Đăng nhập ngay</button>
        </form>

        <div style="text-align: center; margin-top: 15px; font-size: 13px; color: #666;">
            Chưa có tài khoản? <a href="#" style="color: #007bff; text-decoration: none;">Tạo ngay</a>
        </div>
    </div>
</div>