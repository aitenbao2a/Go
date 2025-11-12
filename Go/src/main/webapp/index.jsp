<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng nhập Agoda - Video Background</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<style>
/* 1. CSS chung cho toàn trang và video nền */
body {
	font-family: Arial, sans-serif;
	background-color: #f8f8f8;
	min-height: 100vh;
	margin: 0;
	display: flex;
	flex-direction: column;
	overflow-x: hidden; /* Ngăn chặn scroll ngang nếu video quá rộng */
	position: relative; /* Quan trọng cho video nền */
}

/* Video Background */
#video-background {
	position: fixed; /* Cố định video trên nền */
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100; /* Đặt video ở lớp dưới cùng */
	background-size: cover;
	background-position: center;
	filter: brightness(0.7);
	/* Làm mờ video một chút để văn bản dễ đọc hơn */
}

/* Lớp phủ (Overlay) để làm tối video, giúp chữ dễ đọc hơn */
.video-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4); /* Màu đen trong suốt */
	z-index: -99; /* Nằm trên video nhưng dưới nội dung */
}

/* 2. CSS cho Header (Giả lập) - Giữ nguyên hoặc điều chỉnh màu chữ nếu cần */
.agoda-header {
	background-color: rgba(255, 255, 255, 0.8); /* Hơi trong suốt */
	border-bottom: 1px solid rgba(224, 224, 224, 0.5);
	padding: 10px 0;
	position: relative; /* Để nằm trên video */
	z-index: 10;
}

.agoda-logo {
	font-weight: bold;
	font-size: 24px;
	color: #007bff;
}

.header-menu a {
	color: #333; /* Giữ màu chữ hoặc đổi sang trắng nếu nền quá tối */
	text-decoration: none;
	margin-left: 20px;
	font-size: 14px;
}
/* Đảm bảo các phần tử header hiển thị rõ trên nền trong suốt */
.header-menu a:hover {
	color: #0056b3;
}

/* 3. CSS cho Khối Đăng nhập chính - TRONG SUỐT */
.login-box {
	background-color: rgba(255, 255, 255, 0.2); /* Nền trắng trong suốt */
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
	/* Box shadow đậm hơn để nổi bật */
	padding: 30px;
	width: 100%;
	max-width: 400px;
	backdrop-filter: blur(5px); /* Hiệu ứng làm mờ nền phía sau */
	border: 1px solid rgba(255, 255, 255, 0.3); /* Thêm viền nhẹ */
	position: relative; /* Để nằm trên video */
	z-index: 1;
	color: white; /* Đổi màu chữ trong khung đăng nhập thành trắng */
}

.login-box h4, .login-box p {
	color: white; /* Đảm bảo văn bản rõ ràng */
}

.login-box p.text-muted {
	color: rgba(255, 255, 255, 0.8) !important; /* Điều chỉnh độ mờ */
}

.main-content {
	flex-grow: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
	position: relative; /* Để nằm trên video */
	z-index: 1;
}

/* 4. CSS cho các nút (Đăng nhập bằng...) - Giữ nguyên nhưng có thể điều chỉnh độ trong suốt */
.btn-social {
	width: 100%;
	margin-bottom: 10px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.15);
	/* Nền nút hơi trong suốt */
	border: 1px solid rgba(255, 255, 255, 0.3); /* Viền nút */
	color: white; /* Màu chữ trắng cho nút */
}

.btn-social:hover {
	background-color: rgba(255, 255, 255, 0.3); /* Đậm hơn khi hover */
	color: white;
}

.btn-google {
	background-color: rgba(66, 133, 244, 0.7); /* Điều chỉnh màu Google */
	border-color: rgba(66, 133, 244, 0.9);
}

.btn-google:hover {
	background-color: rgba(66, 133, 244, 0.9);
}

.btn-facebook {
	background-color: rgba(24, 119, 242, 0.7); /* Điều chỉnh màu Facebook */
	border-color: rgba(24, 119, 242, 0.9);
}

.btn-facebook:hover {
	background-color: rgba(24, 119, 242, 0.9);
}

.btn-apple {
	background-color: rgba(0, 0, 0, 0.7); /* Điều chỉnh màu Apple */
	border-color: rgba(0, 0, 0, 0.9);
}

.btn-apple:hover {
	background-color: rgba(0, 0, 0, 0.9);
}

.icon-placeholder {
	margin-right: 10px;
	font-size: 1.2em;
}

/* 5. CSS cho các trường nhập liệu */
.form-control-custom {
	height: 50px;
	border-radius: 4px;
	margin-bottom: 15px;
	background-color: rgba(255, 255, 255, 0.1); /* Nền input trong suốt */
	border: 1px solid rgba(255, 255, 255, 0.3);
	color: white; /* Màu chữ trong input */
}

.form-control-custom::placeholder {
	color: rgba(255, 255, 255, 0.7); /* Màu placeholder */
	opacity: 1;
}

.form-control-custom:focus {
	background-color: rgba(255, 255, 255, 0.2);
	border-color: rgba(255, 255, 255, 0.5);
	color: white;
	box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0.25);
	/* Glow nhẹ khi focus */
}

.form-floating>label {
	color: rgba(255, 255, 255, 0.7); /* Màu label trong form-floating */
}

.form-floating>.form-control-custom:focus ~ label, .form-floating>.form-control-custom:not(:placeholder-shown) 
	~ label {
	color: rgba(255, 255, 255, 0.9); /* Màu label khi đã nhập hoặc focus */
}

.btn-continue {
	height: 50px;
	font-size: 16px;
	font-weight: bold;
	background-color: #007bff; /* Màu xanh Agoda */
	border-color: #007bff;
	color: white;
}

.btn-continue:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

/* 6. CSS cho Footer (Giả lập) - Làm mờ và trong suốt hơn */
.agoda-footer {
	background-color: rgba(255, 255, 255, 0.1); /* Hơi trong suốt */
	border-top: 1px solid rgba(224, 224, 224, 0.1);
	padding: 30px 0;
	color: rgba(255, 255, 255, 0.7); /* Màu chữ trắng mờ */
	font-size: 12px;
	position: relative; /* Để nằm trên video */
	z-index: 1;
}

.footer-link {
	display: block;
	color: rgba(255, 255, 255, 0.7);
	text-decoration: none;
	margin-bottom: 5px;
}

.footer-link:hover {
	color: white;
}
</style>
</head>
<body>

	<video autoplay muted loop id="video-background">
		<source src="<%= request.getContextPath() %>/videos/background1.mp4"
			type="video/mp4">
		Your browser does not support the video tag.
	</video>
	<div class="video-overlay"></div>
	<header class="agoda-header">
		<div
			class="container d-flex justify-content-between align-items-center">
			<div class="agoda-logo">
				agoda<span class="text-danger">.</span>
			</div>
			<div class="header-menu d-none d-md-block">
				<a href="#">Máy bay + K.sạn</a> <a href="#">Chỗ ở</a> <a href="#">Phương
					tiện di chuyển <svg xmlns="http://www.w3.org/2000/svg" width="10"
						height="10" fill="currentColor" class="bi bi-chevron-down"
						viewBox="0 0 16 16">
						<path fill-rule="evenodd"
							d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" /></svg>
				</a>
			</div>
		</div>
	</header>

	<div class="main-content">
		<div class="login-box">

			<h4 class="text-center mb-4">Đăng nhập hoặc tạo tài khoản</h4>
			<p class="text-center mb-4" style="font-size: 14px;">Đăng ký miễn
				phí hoặc đăng nhập để nhận được các ưu đãi và quyền lợi hấp dẫn!</p>

			<form action="LoginServlet" method="post">

				<button type="button" class="btn btn-social btn-google">
					<span class="icon-placeholder">G</span> Đăng nhập bằng Google
				</button>

				<button type="button" class="btn btn-social btn-facebook">
					<span class="icon-placeholder">f</span> Đăng nhập với Facebook
				</button>

				<button type="button" class="btn btn-social btn-apple">
					<span class="icon-placeholder"></span> Đăng nhập bằng Apple
				</button>

				<p class="text-center text-muted mt-3 mb-3">hoặc</p>

				<div class="form-floating mb-3">
					<input type="email" class="form-control form-control-custom"
						id="emailInput" placeholder="id@email.com" name="email" required>
					<label for="emailInput">id@email.com</label>
				</div>

				<button type="submit" class="btn btn-primary btn-continue mb-3">
					Tiếp tục</button>

				<p class="text-center">
					<a href="#" class="text-decoration-none"
						style="color: white; text-shadow: 0 0 5px rgba(0, 0, 0, 0.5);">Đăng
						nhập bằng cách khác</a>
				</p>

			</form>
		</div>
	</div>

	<footer class="agoda-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<strong>Trợ giúp</strong> <a href="#" class="footer-link">Trung
						tâm trợ giúp</a> <a href="#" class="footer-link">Câu hỏi thường
						gặp</a>
				</div>
				<div class="col-md-3">
					<strong>Công ty</strong> <a href="#" class="footer-link">Về
						chúng tôi</a> <a href="#" class="footer-link">Tuyển dụng</a>
				</div>
				<div class="col-md-3">
					<strong>Điểm du lịch</strong> <a href="#" class="footer-link">Quốc
						gia</a> <a href="#" class="footer-link">Mọi chặng bay</a>
				</div>
				<div class="col-md-3">
					<strong>Đối tác của chúng tôi</strong> <a href="#"
						class="footer-link">Đồng tác giả thông tin đối tác YCS</a> <a
						href="#" class="footer-link">Partner Hub</a>
				</div>
			</div>
			<hr class="mt-4 mb-3" style="border-color: rgba(255, 255, 255, 0.2);">
			<p class="text-center mb-0">© 2025 Agoda Company Pte. Ltd. All
				Rights Reserved.</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>