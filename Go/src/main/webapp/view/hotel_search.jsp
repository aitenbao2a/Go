<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>10 khách sạn tốt nhất ở Hồ Chí Minh - Go Travel</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<style>
/* Hotel Search Page Styles */

/* Page Header */
.page-header {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	padding: 30px 0 20px;
	color: white;
}

.breadcrumb {
	font-size: 13px;
	margin-bottom: 15px;
	opacity: 0.9;
}

.breadcrumb a {
	color: white;
	text-decoration: none;
	transition: opacity 0.3s;
}

.breadcrumb a:hover {
	opacity: 0.8;
}

.breadcrumb .separator {
	margin: 0 8px;
}

.page-title {
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 25px;
	letter-spacing: -0.5px;
}

/* Filter Tabs */
.filter-tabs {
	display: flex;
	gap: 10px;
	overflow-x: auto;
	padding-bottom: 5px;
	-webkit-overflow-scrolling: touch;
}

.filter-tabs::-webkit-scrollbar {
	height: 4px;
}

.filter-tabs::-webkit-scrollbar-thumb {
	background: rgba(255, 255, 255, 0.3);
	border-radius: 2px;
}

.filter-tab {
	display: flex;
	align-items: center;
	gap: 6px;
	padding: 10px 18px;
	background: rgba(255, 255, 255, 0.15);
	border: 1px solid rgba(255, 255, 255, 0.3);
	border-radius: 8px;
	color: white;
	font-size: 14px;
	font-weight: 500;
	cursor: pointer;
	white-space: nowrap;
	transition: all 0.3s ease;
	backdrop-filter: blur(10px);
}

.filter-tab:hover {
	background: rgba(255, 255, 255, 0.25);
	transform: translateY(-2px);
}

.filter-tab.active {
	background: white;
	color: #667eea;
	border-color: white;
}

.tab-icon {
	font-size: 16px;
}

.filter-tab svg {
	opacity: 0.8;
}

/* Main Layout */
.main-wrapper {
	background-color: #f8f9fa;
	padding: 30px 0;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 15px;
}

.content-layout {
	display: grid;
	grid-template-columns: 260px 1fr;
	gap: 30px;
}

/* Sidebar Filters */
.sidebar-filters {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.filter-group {
	background: white;
	border-radius: 12px;
	padding: 20px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.filter-title {
	font-size: 16px;
	font-weight: 600;
	color: #1a1a1a;
	margin-bottom: 15px;
}

.filter-options {
	display: flex;
	flex-direction: column;
	gap: 12px;
}

/* Custom Checkbox */
.filter-checkbox {
	display: flex;
	align-items: center;
	cursor: pointer;
	position: relative;
}

.filter-checkbox input[type="checkbox"] {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

.checkbox-custom {
	width: 20px;
	height: 20px;
	border: 2px solid #d1d5db;
	border-radius: 4px;
	margin-right: 10px;
	flex-shrink: 0;
	transition: all 0.3s ease;
	position: relative;
}

.filter-checkbox input[type="checkbox"]:checked+.checkbox-custom {
	background: #667eea;
	border-color: #667eea;
}

.filter-checkbox input[type="checkbox"]:checked+.checkbox-custom::after
	{
	content: '✓';
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	font-size: 14px;
	font-weight: bold;
}

.checkbox-label {
	font-size: 14px;
	color: #4b5563;
	user-select: none;
}

.filter-checkbox:hover .checkbox-custom {
	border-color: #667eea;
}

/* Price Range Filter */
.price-range-inputs {
	display: flex;
	align-items: center;
	gap: 10px;
}

.price-input {
	flex: 1;
	padding: 10px;
	border: 1px solid #e5e7eb;
	border-radius: 6px;
	font-size: 14px;
	transition: border-color 0.3s;
}

.price-input:focus {
	outline: none;
	border-color: #667eea;
}

.price-separator {
	color: #9ca3af;
	font-weight: 500;
}

/* Hotels Container */
.hotels-container {
	display: flex;
	flex-direction: column;
	gap: 25px;
}

.results-info {
	background: white;
	padding: 15px 20px;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.results-count {
	font-size: 14px;
	color: #6b7280;
	margin: 0;
}

.results-count strong {
	color: #1a1a1a;
	font-weight: 600;
}

/* Hotel Item */
.hotel-item {
	background: white;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
}

.hotel-item:hover {
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
	transform: translateY(-4px);
}

.hotel-content {
	display: grid;
	grid-template-columns: 280px 1fr 240px;
	gap: 20px;
	padding: 20px;
}

/* Hotel Images */
.hotel-images {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.main-image {
	position: relative;
	width: 100%;
	height: 200px;
	border-radius: 12px;
	overflow: hidden;
}

.verified-badge {
	position: absolute;
	top: 12px;
	left: 12px;
	background: #10b981;
	width: 28px;
	height: 28px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 2;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
}

.hotel-main-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease; /* Đã sửa lỗi cắt cụt */
}

/* Bắt đầu bổ sung CSS cho các phần bị thiếu/bị cắt */
.image-thumbnails {
	display: flex;
	gap: 8px;
}

.thumbnail-img {
	width: 80px;
	height: 60px;
	object-fit: cover;
	border-radius: 8px;
	cursor: pointer;
	opacity: 0.8;
	transition: opacity 0.3s;
}

.thumbnail-img:hover {
	opacity: 1;
}

.more-photos {
	flex: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f3f4f6;
	border-radius: 8px;
	color: #4b5563;
	font-size: 13px;
	cursor: pointer;
	transition: background 0.3s;
}

.more-photos:hover {
	background: #e5e7eb;
}

/* Hotel Info */
.hotel-info {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.hotel-header {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.hotel-name {
	font-size: 18px;
	font-weight: 700;
	color: #1a1a1a;
	line-height: 1.3;
}

.hotel-rating {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.rating-stars {
	color: gold;
	font-size: 16px;
}

.hotel-location {
	display: flex;
	align-items: center;
	gap: 5px;
	font-size: 13px;
	color: #6b7280;
	text-decoration: none;
	transition: color 0.3s;
}

.hotel-location:hover {
	color: #667eea;
}

/* Amenities */
.hotel-amenities {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.amenity-badge {
	display: flex;
	align-items: center;
	gap: 5px;
	padding: 5px 10px;
	background: #eef2ff;
	border-radius: 6px;
	font-size: 12px;
	color: #4338ca;
	font-weight: 500;
}

.amenity-badge svg {
	color: #667eea;
}

.amenity-more {
	padding: 5px 10px;
	background: #f3f4f6;
	border-radius: 6px;
	font-size: 12px;
	color: #6b7280;
	font-weight: 500;
}

/* Description */
.hotel-description {
	font-size: 14px;
	color: #4b5563;
	line-height: 1.5;
	margin: 0;
}

.read-more {
	color: #667eea;
	text-decoration: none;
	font-weight: 500;
}

.read-more:hover {
	text-decoration: underline;
}

/* Pricing Section */
.hotel-pricing {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	justify-content: space-between;
	text-align: right;
	gap: 15px;
}

.review-badge {
	display: flex;
	gap: 10px;
	align-items: center;
}

.review-score-large {
	background: #059669;
	color: white;
	font-size: 24px;
	font-weight: 700;
	padding: 10px 15px;
	border-radius: 8px;
	min-width: 50px;
	text-align: center;
}

.review-details {
	text-align: left;
}

.review-label {
	font-size: 14px;
	font-weight: 600;
	color: #1a1a1a;
}

.review-count {
	font-size: 12px;
	color: #6b7280;
}

.price-container {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	gap: 10px;
}

.price-label {
	font-size: 12px;
	color: #6b7280;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.price-amount {
	font-size: 28px;
	font-weight: 700;
	color: #e83e8c; /* Màu hồng nổi bật cho giá */
}

.price-currency {
	font-size: 16px;
	margin-left: 5px;
}

.btn-check-availability {
	background: #ff6f61; /* Màu nổi bật cho nút */
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: background 0.3s ease, transform 0.1s;
	width: 100%;
	max-width: 200px;
}

.btn-check-availability:hover {
	background: #e55d54;
}

.btn-check-availability:active {
	transform: scale(0.98);
}

/* Promotional Section */
.promo-section, .flight-deals-section, .destinations-section {
	background: white;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
	margin-bottom: 25px;
}

.section-title {
	font-size: 20px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 15px;
}

.promo-carousel {
	display: flex;
	gap: 15px;
	overflow-x: auto;
	padding-bottom: 10px;
}

.promo-card {
	min-width: 220px;
	height: 120px;
	border-radius: 10px;
	color: white;
	display: flex;
	align-items: center;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
}

.promo-card:hover {
	transform: translateY(-5px);
}

.promo-content {
	display: flex;
	flex-direction: column;
	gap: 5px;
}

.promo-icon {
	font-size: 24px;
}

.promo-title {
	font-size: 18px;
	font-weight: 700;
	margin: 0;
}

.promo-desc {
	font-size: 14px;
	opacity: 0.9;
	margin: 0;
}

/* Flight Deals Section */
.deals-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 15px;
}

.deal-card {
	position: relative;
	overflow: hidden;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s;
}

.deal-card:hover {
	transform: scale(1.02);
}

.deal-image {
	width: 100%;
	height: 120px;
	object-fit: cover;
	display: block;
}

.deal-badge {
	position: absolute;
	top: 10px;
	right: 10px;
	background: #ff6f61;
	color: white;
	padding: 5px 10px;
	border-radius: 5px;
	font-size: 12px;
	font-weight: 600;
}

/* Destinations Section */
.destinations-carousel {
	display: flex;
	gap: 15px;
	overflow-x: auto;
	padding-bottom: 10px;
}

.destination-item {
	position: relative;
	min-width: 250px;
	height: 160px;
	border-radius: 10px;
	overflow: hidden;
	cursor: pointer;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.destination-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.5s;
}

.destination-item:hover .destination-img {
	transform: scale(1.05);
}

.destination-overlay {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
	background: linear-gradient(to top, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0));
	color: white;
	padding: 15px;
}

.destination-name {
	font-size: 16px;
	font-weight: 700;
	margin: 0;
}

.destination-price {
	font-size: 14px;
	opacity: 0.9;
	margin-top: 5px;
}

/* Responsive Adjustments (Quan trọng để hiển thị đúng trên di động) */
@media ( max-width : 1024px) {
	.content-layout {
		grid-template-columns: 1fr; /* Sidebar sẽ nằm trên */
	}
	.sidebar-filters {
		order: 2; /* Đẩy sidebar xuống dưới */
	}
	.hotels-container {
		order: 1; /* Đẩy danh sách khách sạn lên trên */
	}
}

@media ( max-width : 768px) {
	.hotel-content {
		grid-template-columns: 1fr; /* Hotel card xếp dọc */
		gap: 15px;
	}
	.hotel-images {
		height: auto;
	}
	.main-image {
		height: 250px;
	}
	.hotel-pricing {
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		text-align: left;
		border-top: 1px solid #f3f4f6;
		padding-top: 15px;
		margin-top: 15px;
	}
	.price-container {
		align-items: flex-start;
	}
	.btn-check-availability {
		max-width: none;
	}
}
</style>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="search-container">

		<aside class="filter-sidebar">
			<div class="filter-group">
				<span class="filter-title">Hạng sao</span>
				<div>
					<input type="checkbox"> 5 sao
				</div>
				<div>
					<input type="checkbox"> 4 sao
				</div>
				<div>
					<input type="checkbox"> 3 sao
				</div>
			</div>
			<div class="filter-group">
				<span class="filter-title">Tiện ích</span>
				<div>
					<input type="checkbox"> Wifi miễn phí
				</div>
				<div>
					<input type="checkbox"> Hồ bơi
				</div>
				<div>
					<input type="checkbox"> Bãi đỗ xe
				</div>
			</div>
		</aside>

		<main class="hotel-list">

			<div style="margin-bottom: 20px;">
				<h2>Kết quả tìm kiếm cho: "${param.keyword}"</h2>
				<p style="color: #718096;">Tìm thấy ${listHotels != null ? listHotels.size() : 0}
					chỗ nghỉ</p>
			</div>

			<c:if test="${empty listHotels}">
				<div class="no-result">
					<img src="https://cdn-icons-png.flaticon.com/512/6134/6134065.png"
						alt="No result"
						style="width: 80px; margin-bottom: 20px; opacity: 0.5;">
					<h3>Không tìm thấy khách sạn nào!</h3>
					<p>
						Rất tiếc, chúng tôi không tìm thấy chỗ nghỉ nào phù hợp với từ
						khóa "<strong>${param.keyword}</strong>".
					</p>
					<p>Hãy thử tìm kiếm địa điểm khác hoặc kiểm tra lại chính tả.</p>
					<a href="view/index.jsp" class="btn-detail" style="margin-top: 15px;">Về
						trang chủ</a>
				</div>
			</c:if>

			<c:forEach var="h" items="${listHotels}">
				<div class="hotel-card">
					<div class="hotel-img-wrapper">
						<c:set var="imageArray" value="${fn:split(h.images, ',')}" />
						<c:set var="firstImage"
							value="${(not empty imageArray) ? imageArray[0] : 'https://via.placeholder.com/300x200?text=No+Image'}" />

						<img src="${firstImage}" alt="${h.hotelName}" class="hotel-img"
							onerror="this.src='https://via.placeholder.com/300x200?text=Error+Image'">
					</div>

					<div class="hotel-info">
						<div>
							<div class="hotel-header">
								<h3 class="hotel-name">${h.hotelName}</h3>
								<div class="rating-box">
									<span>${h.starRating}</span> <i class="fas fa-star"></i>
								</div>
							</div>

							<p class="hotel-address">
								<i class="fas fa-map-marker-alt"></i> ${h.address}
								<c:if test="${not empty h.city}">, ${h.city}</c:if>
							</p>

							<p class="amenities-preview">
								<i class="fas fa-concierge-bell"></i> ${h.amenities}
							</p>
						</div>

						<div class="hotel-footer">
							<div class="price-box">
								<span class="price-label">Giá mỗi đêm từ</span> <span
									class="price-value"> <fmt:formatNumber
										value="${h.minPrice}" type="currency" currencySymbol="₫"
										maxFractionDigits="0" />
								</span>
							</div>
							<a href="booking.jsp?hotelId=${h.hotelId}" class="btn-detail">Xem
								phòng <i class="fas fa-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</main>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>