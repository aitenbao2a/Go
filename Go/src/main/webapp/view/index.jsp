<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Go - Du lịch là trải nghiệm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<!-- Include Header -->
	<jsp:include page="header.jsp"/>
	<!-- Hero Section -->
	<section class="hero">
		<div class="container">
			<h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
			<p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách
				sạn trên toàn thế giới</p>
		</div>
	</section>
	<!-- Login Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-content">
			<span class="modal-close" onclick="closeModal()">&times;</span>
			<h2 class="modal-title">Đăng nhập hoặc tạo tài khoản</h2>
			<p class="modal-subtitle">Đăng ký miễn phí hoặc đăng nhập để nhận
				được các ưu đãi và quyền lợi hấp dẫn!</p>
			<button class="social-btn btn-google">
				<svg width="18" height="18" viewBox="0 0 18 18" fill="white">
                    <path
						d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844c-.209 1.125-.843 2.078-1.796 2.717v2.258h2.908c1.702-1.567 2.684-3.875 2.684-6.615z" />
                </svg>
				Đăng nhập bằng Google
			</button>
			<button class="social-btn btn-facebook">
				<svg width="20" height="20" viewBox="0 0 20 20" fill="white">
                    <path
						d="M20 10c0-5.523-4.477-10-10-10S0 4.477 0 10c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V10h2.54V7.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V10h2.773l-.443 2.89h-2.33v6.988C16.343 19.128 20 14.991 20 10z" />
                </svg>
				Đăng nhập với Facebook
			</button>

			<button class="social-btn btn-apple">
				<svg width="18" height="18" viewBox="0 0 18 18" fill="white">
                    <path
						d="M14.94 13.52c-.36.77-.54 1.12-1.01 1.8-.66.95-1.58 2.14-2.73 2.15-1.01.01-1.27-.65-2.64-.64-1.37 0-1.66.66-2.68.65-1.15-.01-2-.99-2.66-1.95-1.86-2.67-2.06-5.8-.91-7.46.82-1.18 2.09-1.88 3.29-1.88 1.22 0 1.99.66 3 .66.97 0 1.56-.66 2.96-.66 1.06 0 2.17.58 2.97 1.57-2.61 1.43-2.19 5.15.41 6.76zM11.53 3.95c.54-.7.95-1.68.8-2.68-.87.04-1.9.6-2.5 1.32-.53.63-.98 1.63-.81 2.58.95.02 1.93-.54 2.51-1.22z" />
                </svg>
				Đăng nhập bằng Apple
			</button>
			<div class="divider">Hoặc</div>
			<form action="${pageContext.request.contextPath}/login" method="post">
				<div class="form-group">
					<label class="form-label">Email</label> <input type="email"
						class="form-input" placeholder="id@email.com" required>
				</div>
				<div class="form-group">
					<label class="form-label">Mật khẩu</label> <input type="password"
						class="form-input" placeholder="Nhập mật khẩu" required>
				</div>
				<button type="submit" class="btn-continue">Đăng nhập</button>
			</form>

			<div style="text-align: center; margin-top: 20px;">
				<a href="#"
					style="color: #667eea; text-decoration: none; font-size: 14px;">Quên
					mật khẩu?</a>
			</div>
		</div>
	</div>
	<!-- Search Box -->
	<div class="search-container">
		<div class="container">
			<div class="search-box">
				<form action="${pageContext.request.contextPath}/search"
					method="get" class="search-form">
					<div class="form-field">
						<label class="form-label">Điểm đến</label> <input type="text"
							name="city" class="form-input" placeholder="Bạn muốn đi đâu?"
							required>
					</div>
					<div class="form-field">
						<label class="form-label">Nhận phòng</label> <input type="date"
							name="checkIn" class="form-input" id="checkInDate" required>
					</div>
					<div class="form-field">
						<label class="form-label">Trả phòng</label> <input type="date"
							name="checkOut" class="form-input" id="checkOutDate" required>
					</div>
					<div class="form-field">
						<label class="form-label">Khách & Phòng</label> <select
							name="guests" class="form-select">
							<option value="1">1 khách, 1 phòng</option>
							<option value="2" selected>2 khách, 1 phòng</option>
							<option value="3">3 khách, 1 phòng</option>
							<option value="4">4 khách, 1 phòng</option>
						</select>
					</div>
					<button type="submit" class="btn-search">Tìm kiếm</button>
				</form>
			</div>
		</div>
	</div>

	<!-- Main Content -->
	<main>
		<!-- Popular Destinations -->
		<section class="section">
			<div class="container">
				<h2 class="section-title">Điểm đến phổ biến</h2>
				<div class="destinations-grid">
					<div class="destination-card"
						onclick="location.href='search?city=Hồ Chí Minh'">
						<div class="destination-image">🏙️</div>
						<div class="destination-info">
							<div class="destination-name">Hồ Chí Minh</div>
							<div class="destination-properties">2,847 khách sạn</div>
						</div>
					</div>
					<div class="destination-card"
						onclick="location.href='search?city=Đà Nẵng'">
						<div class="destination-image">🏖️</div>
						<div class="destination-info">
							<div class="destination-name">Đà Nẵng</div>
							<div class="destination-properties">1,523 khách sạn</div>
						</div>
					</div>
					<div class="destination-card"
						onclick="location.href='search?city=Hà Nội'">
						<div class="destination-image">🏛️</div>
						<div class="destination-info">
							<div class="destination-name">Hà Nội</div>
							<div class="destination-properties">1,892 khách sạn</div>
						</div>
					</div>
					<div class="destination-card"
						onclick="location.href='search?city=Nha Trang'">
						<div class="destination-image">🌊</div>
						<div class="destination-info">
							<div class="destination-name">Nha Trang</div>
							<div class="destination-properties">986 khách sạn</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Featured Hotels -->
		<section class="section"
			style="background: white; margin: 0 -20px; padding: 60px 20px;">
			<div class="container">
				<h2 class="section-title">Khách sạn đề xuất</h2>
				<div class="hotels-grid">
					<!-- Sample Hotel Card 1 -->
					<div class="hotel-card" onclick="location.href='hotel-detail?id=1'">
						<div class="hotel-image">
							<div class="hotel-image-placeholder">🏨</div>
						</div>
						<div class="hotel-details">
							<div class="hotel-header">
								<div class="hotel-name">Khách sạn Continental Sài Gòn</div>
								<div class="hotel-rating">
									<span class="stars">★★★★★</span> <span class="review-score">9.2</span>
									<span class="review-count">(2,847 đánh giá)</span>
								</div>
								<div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí
									Minh</div>
							</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi</span> <span
									class="feature-tag">🍴 Nhà hàng</span> <span
									class="feature-tag">💪 Phòng gym</span> <span
									class="feature-tag">📶 WiFi miễn phí</span>
							</div>
							<div class="hotel-footer">
								<span class="discount-badge">-25% hôm nay</span>
								<div class="price-info">
									<div class="price-label">Giá mỗi đêm từ</div>
									<div class="price">
										<span class="price-currency">₫</span>2,450,000
									</div>
									<div class="price-note">Đã bao gồm thuế và phí</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Sample Hotel Card 2 -->
					<div class="hotel-card" onclick="location.href='hotel-detail?id=2'">
						<div class="hotel-image">
							<div class="hotel-image-placeholder">🏢</div>
						</div>
						<div class="hotel-details">
							<div class="hotel-header">
								<div class="hotel-name">Rex Hotel Saigon</div>
								<div class="hotel-rating">
									<span class="stars">★★★★★</span> <span class="review-score">9.0</span>
									<span class="review-count">(3,421 đánh giá)</span>
								</div>
								<div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí
									Minh</div>
							</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi</span> <span
									class="feature-tag">🅿️ Bãi đỗ xe</span> <span
									class="feature-tag">🍴 Bar & Nhà hàng</span> <span
									class="feature-tag">💆 Spa</span>
							</div>
							<div class="hotel-footer">
								<span class="discount-badge">-20% hôm nay</span>
								<div class="price-info">
									<div class="price-label">Giá mỗi đêm từ</div>
									<div class="price">
										<span class="price-currency">₫</span>2,890,000
									</div>
									<div class="price-note">Đã bao gồm thuế và phí</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Include Footer -->
	<jsp:include page="footer.jsp" />
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>
	const loginModal = document.getElementById('loginModal');
	const loginBtn = document.getElementById('headerLoginBtn'); // nút Đăng nhập trong header
	loginBtn.addEventListener('click', () => {
	    loginModal.classList.add('active');
	});

	function closeLoginModal() {
	    loginModal.classList.remove('active');
	}

	window.onclick = function(event) {
	    if (event.target === loginModal) {
	        loginModal.classList.remove('active');
	    }
	}
        // Set default dates
        const today = new Date();
        const tomorrow = new Date(today);
        tomorrow.setDate(tomorrow.getDate() + 1);
        const dayAfter = new Date(today);
        dayAfter.setDate(dayAfter.getDate() + 3);
        
        document.getElementById('checkInDate').valueAsDate = tomorrow;
        document.getElementById('checkOutDate').valueAsDate = dayAfter;
    </script>
</body>
</html>