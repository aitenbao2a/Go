<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>${hotel.hotelName}-Chitiết</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
.detail-container {
	max-width: 1100px;
	margin: 20px auto;
	padding: 0 20px;
} /* Header khách sạn */
.hotel-header-detail {
	margin-bottom: 30px;
}

.hotel-title {
	font-size: 32px;
	font-weight: bold;
	color: #2d3748;
}

.hotel-address-detail {
	color: #718096;
	margin-top: 5px;
}

.rating-summary {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-top: 10px;
}

.rating-score {
	font-size: 20px;
	font-weight: bold;
	color: #f6ad55;
}

.gallery-grid {
	display: grid;
	grid-template-columns: 2fr 1.2fr;
	gap: 12px;
	height: 420px;
	margin-bottom: 40px;
}

.gallery-item {
	position: relative;
	overflow: hidden;
	border-radius: 18px;
}

.gallery-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform .35s ease, filter .35s ease;
}

.gallery-item:hover img {
	transform: scale(1.05);
	filter: brightness(1.05);
} /* Cột bên phải chia 2 ảnh nhỏ */
.gallery-side {
	display: grid;
	grid-template-rows: 1fr 1fr;
	gap: 12px;
} /* Danh sách phòng */
.room-section {
	background: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	margin-bottom: 40px;
}

.section-title {
	font-size: 24px;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee;
	padding-bottom: 10px;
}

.room-card {
	display: flex;
	border: 1px solid #e2e8f0;
	border-radius: 8px;
	margin-bottom: 20px;
	overflow: hidden;
}

.room-img {
	width: 250px;
	height: 180px;
	object-fit: cover;
}

.room-info {
	padding: 20px;
	flex: 1;
	display: flex;
	justify-content: space-between;
}

.room-desc h4 {
	font-size: 18px;
	margin-bottom: 10px;
}

.room-features span {
	display: block;
	font-size: 14px;
	color: #666;
	margin-bottom: 5px;
}

.room-price-action {
	text-align: right;
	min-width: 150px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.price-tag {
	font-size: 22px;
	color: #e53e3e;
	font-weight: bold;
	display: block;
	margin-bottom: 10px;
}

.btn-book {
	background: #667eea;
	color: white;
	padding: 10px 20px;
	border-radius: 6px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.2s;
}

.btn-book:hover {
	background: #5a67d8;
} /* Hotel Features Section */
.hotel-features {
	background: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	margin-bottom: 40px;
}

.features-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 25px;
	margin-top: 20px;
}

.feature-item {
	display: flex;
	gap: 12px;
	align-items: flex-start;
}

.feature-icon {
	width: 40px;
	height: 40px;
	background: #f7fafc;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-shrink: 0;
}

.feature-icon i {
	color: #667eea;
	font-size: 18px;
}

.feature-content h4 {
	font-size: 15px;
	margin: 0 0 5px 0;
	color: #2d3748;
}

.feature-content p {
	font-size: 13px;
	color: #718096;
	margin: 0;
	line-height: 1.5;
} /* Reviews Section - TỐI ƯU */
.reviews-section {
	background: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	margin-bottom: 40px;
}

.review-card {
	padding: 20px 0;
	border-bottom: 1px solid #f0f0f0;
}

.review-card:last-child {
	border-bottom: none;
}

.review-header {
	display: flex;
	gap: 12px;
	margin-bottom: 12px;
}

.user-avatar {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
	flex-shrink: 0;
}

.review-user-info {
	flex: 1;
}

.review-user-info h5 {
	margin: 0 0 4px 0;
	font-size: 15px;
	color: #2d3748;
	font-weight: 600;
}

.review-rating {
	color: #f6ad55;
	font-size: 14px;
	margin: 3px 0;
}

.review-date {
	font-size: 12px;
	color: #a0aec0;
}

.review-comment {
	color: #4a5568;
	line-height: 1.6;
	font-size: 14px;
	margin-left: 57px;
} /* Review Form - COMPACT */
.review-form {
	background: #f7fafc;
	padding: 20px;
	border-radius: 8px;
	margin-bottom: 25px;
}

.review-form h4 {
	margin: 0 0 15px 0;
	font-size: 16px;
}

.form-group {
	margin-bottom: 12px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-weight: 600;
	color: #2d3748;
	font-size: 14px;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	justify-content: flex-end;
	gap: 3px;
	font-size: 22px;
}

.star-rating input[type="radio"] {
	display: none;
}

.star-rating label {
	cursor: pointer;
	color: #cbd5e0;
	transition: color 0.2s;
}

.star-rating input[type="radio"]:checked ~ label, .star-rating label:hover,
	.star-rating label:hover ~ label {
	color: #f6ad55;
}

textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #e2e8f0;
	border-radius: 6px;
	font-family: inherit;
	font-size: 14px;
	resize: vertical;
	box-sizing: border-box;
}

.btn-submit {
	background: #48bb78;
	color: white;
	padding: 10px 24px;
	border: none;
	border-radius: 6px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.2s;
	font-size: 14px;
}

.btn-submit:hover {
	background: #38a169;
}

.alert {
	padding: 12px 16px;
	border-radius: 6px;
	margin-bottom: 15px;
	font-size: 14px;
}

.alert-success {
	background: #c6f6d5;
	color: #22543d;
	border: 1px solid #9ae6b4;
}

.alert-error {
	background: #fed7d7;
	color: #742a2a;
	border: 1px solid #fc8181;
}

.empty-reviews {
	text-align: center;
	color: #a0aec0;
	padding: 30px 0;
	font-size: 14px;
}
</style>
</head>
<body>
	<jsp:include page="headerHome.jsp" />
	<div class="detail-container">
		<div class="hotel-header-detail">
			<h1 class="hotel-title">${hotel.hotelName}</h1>
			<p class="hotel-address-detail">
				<i class="fas fa-map-marker-alt"></i> ${hotel.address},
				${hotel.city}
			</p>
			<div class="rating-summary">
				<div style="color: #f6ad55;">
					<c:forEach begin="1" end="${hotel.starRating}">
						<i class="fas fa-star"></i>
					</c:forEach>
				</div>
				<c:if test="${reviewCount > 0}">
					<div class="rating-score">
						<fmt:formatNumber value="${averageRating}" maxFractionDigits="1" />
						/ 5
					</div>
					<span style="color: #718096;">(${reviewCount} đánh giá)</span>
				</c:if>
			</div>
		</div>
		<c:set var="imgs" value="${fn:split(hotel.images, ',')}" />
		<div class="gallery-grid">
			<!-- Ảnh lớn -->
			<div class="gallery-item">
				<img
					src="${(not empty imgs[0]) ? imgs[0] : 'https://via.placeholder.com/900x600'}">
			</div>
			<!-- Hai ảnh nhỏ bên phải -->
			<div class="gallery-side">
				<div class="gallery-item">
					<img
						src="${(not empty imgs[1]) ? imgs[1] : 'https://via.placeholder.com/450x300'}">
				</div>
				<div class="gallery-item">
					<img
						src="${(not empty imgs[2]) ? imgs[2] : 'https://via.placeholder.com/450x300'}">
				</div>
			</div>
		</div>
		<div style="margin-bottom: 40px;">
			<h3>Giới thiệu</h3>
			<p style="line-height: 1.6; color: #4a5568;">${hotel.description}</p>
		</div>
		<!-- HOTEL FEATURES SECTION -->
		<div class="hotel-features">
			<h3 class="section-title">Tiện nghi nổi bật</h3>
			<div class="features-grid">
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-wifi"></i>
					</div>
					<div class="feature-content">
						<h4>Miễn phí Wi-Fi</h4>
						<p>Kết nối internet tốc độ cao trong toàn bộ khách sạn</p>
					</div>
				</div>
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-swimming-pool"></i>
					</div>
					<div class="feature-content">
						<h4>Bể bơi</h4>
						<p>Hồ bơi ngoài trời với view tuyệt đẹp</p>
					</div>
				</div>
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-utensils"></i>
					</div>
					<div class="feature-content">
						<h4>Nhà hàng</h4>
						<p>Phục vụ các món ăn đặc sản địa phương và quốc tế</p>
					</div>
				</div>
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-dumbbell"></i>
					</div>
					<div class="feature-content">
						<h4>Phòng tập gym</h4>
						<p>Trang thiết bị hiện đại, mở cửa 24/7</p>
					</div>
				</div>
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-concierge-bell"></i>
					</div>
					<div class="feature-content">
						<h4>Dịch vụ phòng 24/7</h4>
						<p>Phục vụ tận tình mọi lúc mọi nơi</p>
					</div>
				</div>
				<div class="feature-item">
					<div class="feature-icon">
						<i class="fas fa-parking"></i>
					</div>
					<div class="feature-content">
						<h4>Bãi đỗ xe</h4>
						<p>Chỗ đỗ xe rộng rãi, an toàn và miễn phí</p>
					</div>
				</div>
			</div>
			<div
				style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #eee;">
				<p>
					<strong>Các tiện nghi khác:</strong> ${hotel.amenities}
				</p>
			</div>
		</div>
		<div class="room-section">
			<h3 class="section-title">Phòng trống hiện có</h3>
			<c:forEach var="room" items="${listRooms}">
				<div class="room-card">
					<c:set var="rImgs" value="${fn:split(room.images, ',')}" />
					<img
						src="${(not empty rImgs[0]) ? rImgs[0] : 'https://via.placeholder.com/300'}"
						class="room-img">
					<div class="room-info">
						<div class="room-desc">
							<h4>${room.roomType}</h4>
							<div class="room-features">
								<span><i class="fas fa-user"></i> Tối đa ${room.capacity}
									người</span> <span><i class="fas fa-expand"></i>
									${room.description}</span>
							</div>
						</div>
						<div class="room-price-action">
							<span class="price-tag"> <fmt:formatNumber
									value="${room.pricePerNight}" groupingUsed="true" /> VND
							</span> <a
								href="${pageContext.request.contextPath}/booking?hotelId=${hotel.hotelId}&roomId=${room.roomId}"
								class="btn-book"> Đặt ngay </a>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:if test="${empty listRooms}">
				<p style="text-align: center; color: #e53e3e;">Hiện tại khách
					sạn này đã hết phòng trống.</p>
			</c:if>
		</div>
		<!-- REVIEWS SECTION - TỐI ƯU -->
		<div class="reviews-section">
			<h3 class="section-title">
				Đánh giá từ khách hàng
				<c:if test="${reviewCount > 0}">
					<span style="color: #718096; font-size: 16px; font-weight: normal;">(${reviewCount}
						đánh giá)</span>
				</c:if>
			</h3>
			<!-- Messages -->
			<c:if test="${not empty sessionScope.success}">
				<div class="alert alert-success">${sessionScope.success}</div>
				<c:remove var="success" scope="session" />
			</c:if>
			<c:if test="${not empty sessionScope.error}">
				<div class="alert alert-error">${sessionScope.error}</div>
				<c:remove var="error" scope="session" />
			</c:if>
			<!-- Review Form -->
			<c:if test="${not empty sessionScope.user}">
				<div class="review-form">
					<h4>Viết đánh giá của bạn</h4>
					<form action="${pageContext.request.contextPath}/addReview"
						method="post">
						<input type="hidden" name="hotelId" value="${hotel.hotelId}">
						<div class="form-group">
							<label>Đánh giá:</label>
							<div class="star-rating">
								<input type="radio" name="rating" value="5" id="star5" required>
								<label for="star5"><i class="fas fa-star"></i></label> <input
									type="radio" name="rating" value="4" id="star4"> <label
									for="star4"><i class="fas fa-star"></i></label> <input
									type="radio" name="rating" value="3" id="star3"> <label
									for="star3"><i class="fas fa-star"></i></label> <input
									type="radio" name="rating" value="2" id="star2"> <label
									for="star2"><i class="fas fa-star"></i></label> <input
									type="radio" name="rating" value="1" id="star1"> <label
									for="star1"><i class="fas fa-star"></i></label>
							</div>
						</div>
						<div class="form-group">
							<label for="comment">Nhận xét:</label>
							<textarea name="comment" id="comment" rows="3"
								placeholder="Chia sẻ trải nghiệm của bạn..." required></textarea>
						</div>
						<button type="submit" class="btn-submit">Gửi đánh giá</button>
					</form>
				</div>
			</c:if>
			<!-- Reviews List -->
			<c:choose>
				<c:when test="${not empty listReviews}">
					<c:forEach var="review" items="${listReviews}">
						<div class="review-card">
							<div class="review-header">
								<img
									src="${(not empty review.userAvatar) ? review.userAvatar : 'https://ui-avatars.com/api/?name=User&background=667eea&color=fff'}"
									alt="${review.userName}" class="user-avatar">
								<div class="review-user-info">
									<h5>${review.userName}</h5>
									<div class="review-rating">
										<c:forEach begin="1" end="${review.rating}">
											<i class="fas fa-star"></i>
										</c:forEach>
										<c:forEach begin="1" end="${5 - review.rating}">
											<i class="far fa-star"></i>
										</c:forEach>
									</div>
									<div class="review-date">
										<fmt:formatDate value="${review.createdAt}"
											pattern="dd/MM/yyyy HH:mm" />
									</div>
								</div>
							</div>
							<div class="review-comment">${review.comment}</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="empty-reviews">Chưa có đánh giá nào. Hãy là người
						đầu tiên đánh giá!</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>