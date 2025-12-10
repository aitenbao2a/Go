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
	<jsp:include page="header.jsp" />
	<!-- Login Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-content">
			<span class="modal-close" onclick="closeLoginModal()">&times;</span>

			<h2 class="modal-title">ĐĂNG NHẬP</h2>

			<button class="social-btn btn-google">
				<img src="${pageContext.request.contextPath}/images/logo_google.png"
					class="logo_google-img" height="20" width="20"> Đăng nhập
				bằng Google
			</button>

			<button class="social-btn btn-facebook">
				<img
					src="${pageContext.request.contextPath}/images/logo_facebook.webp"
					class="logo_facebook-img" height="20" width="20"> Đăng nhập
				bằng Facebook
			</button>

			<button class="social-btn btn-apple">
				<img src="${pageContext.request.contextPath}/images/logo_apple.png"
					class="logo_apple-img" height="20" width="20"> Đăng nhập bằng
				Apple
			</button>

			<div class="divider">Hoặc</div>

			<form action="${pageContext.request.contextPath}/login" method="post">
				<div class="form-group">
					<label class="form-label">Email</label> <input type="email"
						class="form-input" name="email" placeholder="id@email.com"
						required>
				</div>
				<div class="form-group">
					<label class="form-label">Mật khẩu</label> <input type="password"
						class="form-input" name="password" placeholder="Nhập mật khẩu"
						required>
				</div>

				<button type="submit" class="btn-continue">Đăng nhập</button>
			</form>

			<div
				style="display: flex; justify-content: center; margin-top: 20px; gap: 30px;">
				<a href="login_error.jsp"
					style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
					Quên mật khẩu? </a> <a href="#"
					style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
					Tạo tài khoản </a>
			</div>

		</div>
	</div>

	<!-- Register Modal -->
	<div class="modal" id="registerModal">
		<div class="modal-content">
			<span class="modal-close" onclick="closeLoginModal()">&times;</span>
			<h2 class="modal-title">TẠO TÀI KHOẢN</h2>
			<button class="social-btn btn-google">
				<img src="${pageContext.request.contextPath}/images/logo_google.png"
					class="logo_google-img" height="20" width="20" viewBox="0 0 18 18">
				Đăng nhập bằng Google
			</button>

			<button class="social-btn btn-facebook">
				<img
					src="${pageContext.request.contextPath}/images/logo_facebook.webp"
					class="logo_facebook-img" height="20" width="20"
					viewBox="0 0 18 18"> Đăng nhập bằng Facebook
			</button>
			<button class="social-btn btn-apple">
				<img src="${pageContext.request.contextPath}/images/logo_apple.png"
					class="logo_apple-img" height="20" width="20" viewBox="0 0 18 18">
				Đăng nhập bằng Apple
			</button>
			<div class="divider">Hoặc</div>

			<form action="login" method="post">
				<div class="form-group">
					<label class="form-label">Họ và tên</label> <input type="fullname"
						class="form-input" name="fullname" placeholder="Nguyễn Văn A"
						required>
				</div>
				<div class="form-group">
					<label class="form-label">Email</label> <input type="email"
						class="form-input" name="email" placeholder="id@email.com"
						required>
				</div>
				<div class="form-group">
					<label class="form-label">Mật khẩu</label> <input type="password"
						class="form-input" name="password" placeholder="Nhập mật khẩu"
						required>
				</div>
				<div class="form-group">
					<label class="form-label">Xác nhận mật khẩu </label> <input
						type="password" class="form-input" name="confirmPassword"
						placeholder="Xác nhận mật khẩu" required>
				</div>
				<button type="submit" class="btn-continue">Tiếp tục</button>
			</form>

			<div style="text-align: center; margin-top: 10px;">
				<a href="#"
					style="color: #667eea; text-decoration: none; font-size: 15px; font-weight: 500;">
					Đã có tài khoản </a>
			</div>
		</div>
	</div>
	<!-- Hero Section -->
	<section class="hero">
		<div class="container">
			<h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
			<p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách
				sạn trên toàn thế giới</p>
			<div class="search-box">
				<form class="search-form" action="search" method="get">
					<!-- Destination -->
					<div class="form-field">
						<label class="form-label">Điểm đến</label> <input type="text"
							class="form-input" name="destination"
							placeholder="Bạn muốn đi đâu?" required>
					</div>

					<!-- Check-in Date -->
					<div class="form-field date-input">
						<label class="form-label">Nhận phòng</label> <input type="date"
							class="form-input" name="checkin" id="checkInDate" required>
					</div>

					<!-- Check-out Date -->
					<div class="form-field date-input">
						<label class="form-label">Trả phòng</label> <input type="date"
							class="form-input" name="checkout" id="checkOutDate" required>
					</div>

					<!-- Guest & Room Selector -->
					<div class="form-field">
						<label class="form-label">Khách & Phòng</label>
						<div class="guest-selector">
							<div class="guest-display" id="guestDisplay">
								<span class="guest-text"> <svg class="guest-icon"
										fill="none" stroke="currentColor" viewBox="0 0 24 24">
										<path stroke-linecap="round" stroke-linejoin="round"
											stroke-width="2"
											d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
									</svg> <span id="guestSummary">2 khách, 1 phòng</span>
								</span>
								<svg class="dropdown-icon" fill="none" stroke="currentColor"
									viewBox="0 0 24 24">
									<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="M19 9l-7 7-7-7" />
								</svg>
							</div>

							<div class="guest-dropdown" id="guestDropdown">
								<!-- Adults -->
								<div class="guest-row">
									<div class="guest-label">
										<span class="guest-label-main">Người lớn</span> <span
											class="guest-label-sub">Từ 13 tuổi trở lên</span>
									</div>
									<div class="guest-controls">
										<button type="button" class="guest-btn"
											onclick="decreaseGuest('adults')">−</button>
										<span class="guest-count" id="adultsCount">2</span>
										<button type="button" class="guest-btn"
											onclick="increaseGuest('adults')">+</button>
									</div>
								</div>

								<!-- Children -->
								<div class="guest-row">
									<div class="guest-label">
										<span class="guest-label-main">Trẻ em</span> <span
											class="guest-label-sub">Từ 2-12 tuổi</span>
									</div>
									<div class="guest-controls">
										<button type="button" class="guest-btn"
											onclick="decreaseGuest('children')">−</button>
										<span class="guest-count" id="childrenCount">0</span>
										<button type="button" class="guest-btn"
											onclick="increaseGuest('children')">+</button>
									</div>
								</div>

								<!-- Rooms -->
								<div class="guest-row">
									<div class="guest-label">
										<span class="guest-label-main">Phòng</span>
									</div>
									<div class="guest-controls">
										<button type="button" class="guest-btn"
											onclick="decreaseGuest('rooms')">−</button>
										<span class="guest-count" id="roomsCount">1</span>
										<button type="button" class="guest-btn"
											onclick="increaseGuest('rooms')">+</button>
									</div>
								</div>
							</div>

							<!-- Hidden inputs for form submission -->
							<input type="hidden" name="adults" id="adultsInput" value="2">
							<input type="hidden" name="children" id="childrenInput" value="0">
							<input type="hidden" name="rooms" id="roomsInput" value="1">
						</div>
					</div>

					<!-- Search Button -->
					<button type="submit" class="btn-search">
						<svg width="20" height="20" fill="none" stroke="currentColor"
							viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
						</svg>
						Tìm kiếm
					</button>
				</form>
			</div>
		</div>
	</section>
	<!-- Main Content -->
	<main>
		<!-- Popular Destinations -->
		<section class="section">
			<div class="container">
				<h2 class="section-title">Điểm đến phổ biến</h2>
				<div class="section-padding">
					<div class="carousel-container">
						<button class="nav-button prev-button"
							onclick="scrollCarousel('prev')">&lt;</button>
						<div class="scroll-wrapper" id="destinationScrollWrapper">
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
									onclick="location.href='search?city=Hồ Chí Minh'">
									<div class="destination-image">🏙️</div>
									<div class="destination-info">
										<div class="destination-name">Hồ Chí Minh</div>
										<div class="destination-properties">2,847 khách sạn</div>
									</div>
								</div>
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
								<div class="destination-card"
									onclick="location.href='search?city=Vũng Tàu'">
									<div class="destination-image">🏖️</div>
									<div class="destination-info">
										<div class="destination-name">Vũng Tàu</div>
										<div class="destination-properties">1,200 khách sạn</div>
									</div>
								</div>
								<div class="destination-card"
									onclick="location.href='search?city=Phú Quốc'">
									<div class="destination-image">🏝️</div>
									<div class="destination-info">
										<div class="destination-name">Phú Quốc</div>
										<div class="destination-properties">1,150 khách sạn</div>
									</div>
								</div>
							</div>
						</div>
						<button class="nav-button next-button"
							onclick="scrollCarousel('next')">&gt;</button>
					</div>
				</div>
			</div>
		</section>

		<!-- Featured Hotels -->
		<section class="section"
			style="background: white; margin: 0; padding: 80px 0;">
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

	<script>
	// Login Modal Functions
	const loginModal = document.getElementById('loginModal');
	const loginBtn = document.getElementById('headerLoginBtn');

	if (loginBtn) {
		loginBtn.addEventListener('click', () => {
			loginModal.classList.add('active');
		});
	}

	function closeLoginModal() {
		loginModal.classList.remove('active');
	}

	window.addEventListener('click', (event) => {
		if (event.target === loginModal) {
			loginModal.classList.remove('active');
		}
	});
	const registerModal = document.getElementById('registerModal');
	const registerBtn = document.getElementById('headerRegisterBtn');
	
	if (registerBtn) {
		registerBtn.addEventListener('click', () => {
			registerModal.classList.add('active');
		});
	}

	function closeLoginModal() {
		registerModal.classList.remove('active');
	}

	window.addEventListener('click', (event) => {
		if (event.target === registerModal) {
			registerModal.classList.remove('active');
		}
	});

	// Date Picker Setup
	const today = new Date();
	const tomorrow = new Date(today);
	tomorrow.setDate(today.getDate() + 1);

	const dayAfter = new Date(today);
	dayAfter.setDate(today.getDate() + 3);

	document.getElementById('checkInDate').valueAsDate = tomorrow;
	document.getElementById('checkOutDate').valueAsDate = dayAfter;

	// Guest Selector
	const guests = {
		adults: 2,
		children: 0,
		rooms: 1
	};

	const guestDisplay = document.getElementById('guestDisplay');
	const guestDropdown = document.getElementById('guestDropdown');

	guestDisplay.addEventListener('click', (e) => {
		e.stopPropagation();
		guestDisplay.classList.toggle('active');
		guestDropdown.classList.toggle('show');
	});

	document.addEventListener('click', (e) => {
		if (!e.target.closest('.guest-selector')) {
			guestDisplay.classList.remove('active');
			guestDropdown.classList.remove('show');
		}
	});

	function increaseGuest(type) {
		const limits = { adults: 10, children: 10, rooms: 5 };
		if (guests[type] < limits[type]) {
			guests[type]++;
			updateGuestDisplay();
		}
	}

	function decreaseGuest(type) {
		const minimums = { adults: 1, children: 0, rooms: 1 };
		if (guests[type] > minimums[type]) {
			guests[type]--;
			updateGuestDisplay();
		}
	}

	function updateGuestDisplay() {
		const totalGuests = guests.adults + guests.children;
		const summaryText = `${totalGuests} khách, ${guests.rooms} phòng`;

		document.getElementById('guestSummary').textContent = summaryText;
		document.getElementById('adultsCount').textContent = guests.adults;
		document.getElementById('childrenCount').textContent = guests.children;
		document.getElementById('roomsCount').textContent = guests.rooms;

		document.getElementById('adultsInput').value = guests.adults;
		document.getElementById('childrenInput').value = guests.children;
		document.getElementById('roomsInput').value = guests.rooms;
	}
	function scrollCarousel(direction) {
        const scrollWrapper = document.getElementById('destinationScrollWrapper');
        const scrollDistance = 300; 
        if (direction === 'next') {
            scrollWrapper.scrollBy({
                left: scrollDistance,
                behavior: 'smooth'
            });
        } else if (direction === 'prev') {
            scrollWrapper.scrollBy({
                left: -scrollDistance,
                behavior: 'smooth'
            });
        }
    }
	</script>
</body>
</html>