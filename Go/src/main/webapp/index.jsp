<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Go</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
	<header class="header">
		<div class="header-top">
			<div class="header-top-left">
				<a href="#">Tải ứng dụng</a> <a href="#">Hỗ trợ</a> <a href="#">Trở
					thành đối tác</a>
			</div>
			<div class="currency">VND | VI</div>
		</div>
		<div class="header-main">
			<div class="logo" onclick="window.location.reload()">
				<div class="logo-circles">
					<div class="circle circle-1"></div>
					<div class="circle circle-2"></div>
					<div class="circle circle-3"></div>
					<div class="circle circle-4"></div>
					<div class="circle circle-5"></div>
				</div>
				<div class="logo-text">Go</div>
			</div>
			<nav class="nav-links">
				<a href="#" class="nav-link"> <span class="badge">Hot</span> Máy
					bay + Khách sạn
				</a> <a href="#" class="nav-link">Chỗ ở</a> <a href="#" class="nav-link">Chuyến
					bay</a> <a href="#" class="nav-link"> <span class="badge">Mới</span>
					Phương tiện
				</a>
			</nav>
			<div class="user-actions">
				<button class="btn-signin" onclick="openModal()">Đăng nhập</button>
				<button class="btn-register" onclick="openModal()">Tạo tài
					khoản</button>
			</div>
		</div>
	</header>

	<!-- Hero Section -->
	<section class="hero">
		<h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
		<p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách sạn
			và nhà nghỉ trên toàn thế giới</p>
	</section>

	<!-- Search Box -->
	<div class="search-container">
		<div class="search-box">
			<div class="search-tabs">
				<button class="search-tab active">🏨 Khách sạn</button>
				<button class="search-tab">✈️ Chuyến bay</button>
				<button class="search-tab">🏠 Nhà nghỉ</button>
				<button class="search-tab">🚗 Thuê xe</button>
			</div>
			<form class="search-form">
				<div class="form-field">
					<label class="form-label">Điểm đến</label> <input type="text"
						class="form-input" placeholder="Bạn muốn đi đâu?"
						value="Hồ Chí Minh">
				</div>
				<div class="form-field">
					<label class="form-label">Nhận phòng</label> <input type="date"
						class="form-input" value="2025-11-22">
				</div>
				<div class="form-field">
					<label class="form-label">Trả phòng</label> <input type="date"
						class="form-input" value="2025-11-25">
				</div>
				<div class="form-field">
					<label class="form-label">Khách & Phòng</label> <input type="text"
						class="form-input" placeholder="2 người, 1 phòng" readonly>
				</div>
				<button type="button" class="btn-search" onclick="scrollToHotels()">Tìm
					kiếm</button>
			</form>
		</div>
	</div>

	<!-- Main Content -->
	<main class="main-content">
		<!-- Featured Destinations -->
		<section>
			<h2 class="section-title">Điểm đến phổ biến</h2>
			<div class="destinations-grid">
				<div class="destination-card">
					<div class="destination-image">🏙️</div>
					<div class="destination-info">
						<div class="destination-name">Hồ Chí Minh</div>
						<div class="destination-properties">2,847 khách sạn</div>
					</div>
				</div>
				<div class="destination-card">
					<div class="destination-image">🏖️</div>
					<div class="destination-info">
						<div class="destination-name">Đà Nẵng</div>
						<div class="destination-properties">1,523 khách sạn</div>
					</div>
				</div>
				<div class="destination-card">
					<div class="destination-image">🏛️</div>
					<div class="destination-info">
						<div class="destination-name">Hà Nội</div>
						<div class="destination-properties">1,892 khách sạn</div>
					</div>
				</div>
				<div class="destination-card">
					<div class="destination-image">🌊</div>
					<div class="destination-info">
						<div class="destination-name">Nha Trang</div>
						<div class="destination-properties">986 khách sạn</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Hotels List -->
		<section id="hotels-section">
			<h2 class="section-title">Khách sạn đề xuất tại Hồ Chí Minh</h2>
			<div class="hotels-grid">
				<!-- Hotel 1 -->
				<div class="hotel-card">
					<div class="hotel-image">🏨</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Khách sạn Continental Sài Gòn</div>
									<div class="hotel-rating">
										<span class="stars">★★★★★</span> <span class="review-score">9.2</span>
										<span class="review-count">(2,847 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí
								Minh</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi</span> <span
									class="feature-tag">🍴 Nhà hàng</span> <span
									class="feature-tag">💪 Phòng gym</span> <span
									class="feature-tag">📶 WiFi miễn phí</span>
							</div>
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

				<!-- Hotel 2 -->
				<div class="hotel-card">
					<div class="hotel-image">🏢</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Rex Hotel Saigon</div>
									<div class="hotel-rating">
										<span class="stars">★★★★★</span> <span class="review-score">9.0</span>
										<span class="review-count">(3,421 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí
								Minh</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi</span> <span
									class="feature-tag">🅿️ Bãi đỗ xe</span> <span
									class="feature-tag">🍴 Bar & Nhà hàng</span> <span
									class="feature-tag">💆 Spa</span>
							</div>
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

				<!-- Hotel 3 -->
				<div class="hotel-card">
					<div class="hotel-image">🌆</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Sheraton Saigon Hotel & Towers</div>
									<div class="hotel-rating">
										<span class="stars">★★★★★</span> <span class="review-score">8.9</span>
										<span class="review-count">(1,956 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Gần Nhà Thờ Đức Bà</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi ngoài trời</span> <span
									class="feature-tag">🍴 3 nhà hàng</span> <span
									class="feature-tag">👶 Phù hợp gia đình</span> <span
									class="feature-tag">💼 Phòng họp</span>
							</div>
						</div>
						<div class="hotel-footer">
							<span class="discount-badge">-15% hôm nay</span>
							<div class="price-info">
								<div class="price-label">Giá mỗi đêm từ</div>
								<div class="price">
									<span class="price-currency">₫</span>3,250,000
								</div>
								<div class="price-note">Đã bao gồm thuế và phí</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Hotel 4 -->
				<div class="hotel-card">
					<div class="hotel-image">🏰</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Park Hyatt Saigon</div>
									<div class="hotel-rating">
										<span class="stars">★★★★★</span> <span class="review-score">9.4</span>
										<span class="review-count">(2,134 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Trung tâm Hồ Chí
								Minh</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi sang trọng</span> <span
									class="feature-tag">🍷 Quầy bar</span> <span
									class="feature-tag">💆 Spa cao cấp</span> <span
									class="feature-tag">🌟 Dịch vụ 5 sao</span>
							</div>
						</div>
						<div class="hotel-footer">
							<span class="discount-badge">-18% hôm nay</span>
							<div class="price-info">
								<div class="price-label">Giá mỗi đêm từ</div>
								<div class="price">
									<span class="price-currency">₫</span>4,850,000
								</div>
								<div class="price-note">Đã bao gồm thuế và phí</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Hotel 5 -->
				<div class="hotel-card">
					<div class="hotel-image">🌃</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Novotel Saigon Centre</div>
									<div class="hotel-rating">
										<span class="stars">★★★★</span> <span class="review-score">8.7</span>
										<span class="review-count">(3,892 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Gần chợ Bến Thành</div>
							<div class="hotel-features">
								<span class="feature-tag">🏊 Hồ bơi</span> <span
									class="feature-tag">🍴 Buffet sáng</span> <span
									class="feature-tag">🅿️ Đỗ xe miễn phí</span> <span
									class="feature-tag">📶 WiFi tốc độ cao</span>
							</div>
						</div>
						<div class="hotel-footer">
							<span class="discount-badge">-30% hôm nay</span>
							<div class="price-info">
								<div class="price-label">Giá mỗi đêm từ</div>
								<div class="price">
									<span class="price-currency">₫</span>1,950,000
								</div>
								<div class="price-note">Đã bao gồm thuế và phí</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Hotel 6 -->
				<div class="hotel-card">
					<div class="hotel-image">🏖️</div>
					<div class="hotel-details">
						<div>
							<div class="hotel-header">
								<div>
									<div class="hotel-name">Liberty Central Saigon Riverside</div>
									<div class="hotel-rating">
										<span class="stars">★★★★</span> <span class="review-score">8.5</span>
										<span class="review-count">(2,567 đánh giá)</span>
									</div>
								</div>
							</div>
							<div class="hotel-location">📍 Quận 1, Ven sông Sài Gòn</div>
							<div class="hotel-features">
								<span class="feature-tag">🌊 View sông</span> <span
									class="feature-tag">🏊 Hồ bơi trên cao</span> <span
									class="feature-tag">🍴 Nhà hàng</span> <span
									class="feature-tag">🚕 Đưa đón sân bay</span>
							</div>
						</div>
						<div class="hotel-footer">
							<span class="discount-badge">-22% hôm nay</span>
							<div class="price-info">
								<div class="price-label">Giá mỗi đêm từ</div>
								<div class="price">
									<span class="price-currency">₫</span>1,680,000
								</div>
								<div class="price-note">Đã bao gồm thuế và phí</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
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

			<div class="divider">hoặc</div>

			<form onsubmit="handleLogin(event)">
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
	<script>
		function openModal() {
			document.getElementById('loginModal').classList.add('active');
		}

		function closeModal() {
			document.getElementById('loginModal').classList.remove('active');
		}

		function handleLogin(event) {
			event.preventDefault();
			alert('Đăng nhập thành công! (Demo)');
			closeModal();
		}

		function scrollToHotels() {
			document.getElementById('hotels-section').scrollIntoView({
				behavior : 'smooth'
			});
		}

		// Close modal when clicking outside
		document.getElementById('loginModal').addEventListener('click',
				function(e) {
					if (e.target === this) {
						closeModal();
					}
				});

		// Set default dates
		const today = new Date();
		const tomorrow = new Date(today);
		tomorrow.setDate(tomorrow.getDate() + 1);
		const dayAfter = new Date(today);
		dayAfter.setDate(dayAfter.getDate() + 3);

		document.addEventListener('DOMContentLoaded', function() {
			const dateInputs = document.querySelectorAll('input[type="date"]');
			if (dateInputs.length >= 2) {
				dateInputs[0].value = tomorrow.toISOString().split('T')[0];
				dateInputs[1].value = dayAfter.toISOString().split('T')[0];
			}
		});
	</script>
</body>