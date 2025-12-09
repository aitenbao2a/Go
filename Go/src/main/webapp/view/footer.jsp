<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
</head>
<style>
.footer {
	background: #2d3e50;
	color: white;
	padding: 60px 24px 24px;
}

.footer-content {
	max-width: 1200px;
	margin: 0 auto;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 40px;
	margin-bottom: 40px;
}

.footer-section h4 {
	font-size: 16px;
	font-weight: 700;
	margin-bottom: 16px;
}

.footer-section ul {
	list-style: none;
}

.footer-section ul li {
	margin-bottom: 10px;
}

.footer-section ul li a {
	color: rgba(255, 255, 255, 0.8);
	text-decoration: none;
	font-size: 14px;
	transition: color 0.2s;
}

.footer-section ul li a:hover {
	color: white;
}

.footer-bottom {
	max-width: 1200px;
	margin: 0 auto;
	padding-top: 24px;
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
	color: rgba(255, 255, 255, 0.6);
	font-size: 13px;
}
</style>
<body>
	<footer class="footer">
		<div class="footer-content">
			<div class="footer-section">
				<h4>Trợ giúp</h4>
				<ul>
					<li><a href="#">Trung tâm trợ giúp</a></li>
					<li><a href="#">Câu hỏi thường gặp</a></li>
					<li><a href="#">Chính sách Bảo mật</a></li>
					<li><a href="#">Chính sách về cookie</a></li>
					<li><a href="#">Điều khoản sử dụng</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h4>Công ty</h4>
				<ul>
					<li><a href="#">Về chúng tôi</a></li>
					<li><a href="#">Tuyển dụng</a></li>
					<li><a href="#">Báo chí</a></li>
					<li><a href="#">Nhật ký mạng</a></li>
					<li><a href="#">PointsMAX</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h4>Điểm du lịch</h4>
				<ul>
					<li><a href="#">Quốc gia</a></li>
					<li><a href="#">Thành phố</a></li>
					<li><a href="#">Khu vực</a></li>
					<li><a href="#">Sân bay</a></li>
					<li><a href="#">Khách sạn</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h4>Đối tác</h4>
				<ul>
					<li><a href="#">Cộng thông tin đối tác YCS</a></li>
					<li><a href="#">Partner Hub</a></li>
					<li><a href="#">Quảng cáo trên Agoda</a></li>
					<li><a href="#">Đối tác liên kết</a></li>
					<li><a href="#">Tư liệu API Agoda</a></li>
				</ul>
			</div>
			<div class="footer-section">
				<h4>Tải ứng dụng</h4>
				<ul>
					<li><a href="#">📱 Ứng dụng iOS</a></li>
					<li><a href="#">📱 Ứng dụng Android</a></li>
				</ul>
			</div>
		</div>
		<div class="footer-bottom">
			<p>&copy; 2025 Agoda Clone. Đây là trang web mẫu chỉ nhằm mục
				đích học tập.</p>
		</div>
	</footer>
</body>
</html>