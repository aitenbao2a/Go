<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="login-modal" class="modal">
	<div class="modal-content">
		<span class="modal-close" onclick="closeModal()">&times;</span>
		<div class="modal-title">Đăng nhập</div>
		<form action="LoginServlet" method="POST">
			<div class="form-field" style="margin-bottom: 15px;">
				<label class="form-label">Email</label> <input type="email"
					name="email" class="form-input" placeholder="test@agoda.com"
					required>
			</div>
			<div class="form-field">
				<label class="form-label">Mật khẩu</label> <input type="password"
					name="password" class="form-input" placeholder="123" required>
			</div>
			<button type="submit" class="btn-continue">Đăng nhập ngay</button>
		</form>
		<div
			style="text-align: center; margin-top: 15px; font-size: 13px; color: #666;">
			Chưa có tài khoản? <a href="#">Tạo ngay</a>
		</div>
	</div>
</div>