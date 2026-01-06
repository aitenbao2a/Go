
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
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(135deg, #f5f7fa 0%, #e8ecf1 100%);
	color: #2d3748;
	line-height: 1.6;
	overflow-x: hidden;
}

.container {
	padding: 0 30px;
	margin-left: 5%;
	margin-right: 5%;
}

/* ===== HERO SECTION ===== */
.hero {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	padding: 120px 0 150px;
	position: relative;
	overflow: hidden;
}

.hero::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background:
		url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><circle cx="50" cy="50" r="2" fill="white" opacity="0.1"/></svg>');
	animation: float 20s linear infinite;
}

@
keyframes float { 0% {
	transform: translateY(0);
}

100

	
%
{
transform

	
:

	
translateY
(

	
-100px

	
)
;

	
}
}
.hero-title {
	font-size: 3.5rem;
	font-weight: 700;
	color: white;
	text-align: center;
	margin-bottom: 15px;
	position: relative;
	z-index: 1;
	animation: fadeInDown 0.8s ease-out;
	text-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
}

.hero-subtitle {
	font-size: 1.3rem;
	color: rgba(255, 255, 255, 0.95);
	text-align: center;
	margin-bottom: 50px;
	position: relative;
	z-index: 1;
	animation: fadeInUp 0.8s ease-out 0.2s both;
}

/* ===== SEARCH BOX ===== */
.search-box {
	background: white;
	border-radius: 20px;
	padding: 40px;
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
	position: relative;
	z-index: 1;
	animation: fadeInUp 0.8s ease-out 0.4s both;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.search-box:hover {
	transform: translateY(-5px);
	box-shadow: 0 25px 70px rgba(0, 0, 0, 0.2);
}

.search-form {
	display: grid;
	grid-template-columns: 2fr 1.2fr 1.2fr 1.5fr auto;
	gap: 20px;
	align-items: end;
}

.form-field {
	position: relative;
}

.form-label {
	display: block;
	font-size: 0.9rem;
	font-weight: 600;
	color: #4a5568;
	margin-bottom: 8px;
}

.form-input {
	width: 100%;
	padding: 14px 16px;
	border: 2px solid #e2e8f0;
	border-radius: 12px;
	font-size: 1rem;
	transition: all 0.3s ease;
	background: #f8fafc;
}

.form-input:focus {
	outline: none;
	border-color: #667eea;
	background: white;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
	transform: translateY(-2px);
}

.form-input:hover {
	border-color: #cbd5e0;
}

/* ===== GUEST SELECTOR ===== */
.guest-selector {
	position: relative;
}

.guest-display {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 14px 16px;
	border: 2px solid #e2e8f0;
	border-radius: 12px;
	cursor: pointer;
	transition: all 0.3s ease;
	background: #f8fafc;
}

.guest-display:hover {
	border-color: #cbd5e0;
	background: white;
}

.guest-display.active {
	border-color: #667eea;
	background: white;
	box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.guest-text {
	display: flex;
	align-items: center;
	gap: 10px;
	font-size: 1rem;
	color: #2d3748;
}

.guest-icon {
	width: 20px;
	height: 20px;
	color: #667eea;
}

.dropdown-icon {
	width: 20px;
	height: 20px;
	transition: transform 0.3s ease;
}

.guest-display.active .dropdown-icon {
	transform: rotate(180deg);
}

.guest-dropdown {
	position: absolute;
	top: calc(100% + 10px);
	left: 0;
	right: 0;
	background: white;
	border-radius: 16px;
	box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
	padding: 20px;
	z-index: 100;
	opacity: 0;
	visibility: hidden;
	transform: translateY(-10px);
	transition: all 0.3s ease;
}

.guest-dropdown.show {
	opacity: 1;
	visibility: visible;
	transform: translateY(0);
}

.guest-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px 0;
	border-bottom: 1px solid #e2e8f0;
}

.guest-row:last-child {
	border-bottom: none;
}

.guest-label-main {
	display: block;
	font-weight: 600;
	color: #2d3748;
}

.guest-label-sub {
	display: block;
	font-size: 0.85rem;
	color: #718096;
}

.guest-controls {
	display: flex;
	align-items: center;
	gap: 15px;
}

.guest-btn {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 2px solid #e2e8f0;
	background: white;
	color: #667eea;
	font-size: 1.3rem;
	cursor: pointer;
	transition: all 0.3s ease;
	display: flex;
	align-items: center;
	justify-content: center;
}

.guest-btn:hover {
	border-color: #667eea;
	background: #667eea;
	color: white;
	transform: scale(1.1);
}

.guest-count {
	font-weight: 600;
	color: #2d3748;
	min-width: 30px;
	text-align: center;
}

/* ===== SEARCH BUTTON ===== */
.btn-search {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 14px 32px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
	white-space: nowrap;
}

.btn-search:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 25px rgba(102, 126, 234, 0.5);
}

.btn-search:active {
	transform: translateY(-1px);
}

/* ===== SECTIONS ===== */
.section {
	padding: 80px 0;
}

.section-title {
	font-size: 2.5rem;
	font-weight: 700;
	color: #2d3748;
	margin-bottom: 40px;
	position: relative;
	display: inline-block;
}

.section-title::after {
	content: '';
	position: absolute;
	bottom: -10px;
	left: 0;
	width: 60px;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	border-radius: 2px;
}

.section-padding {
	box-sizing: border-box;
}

.scroll-wrapper {
	width: 100%;
	overflow-x: auto;
	padding-bottom: 15px;
	scroll-behavior: smooth;
	scrollbar-width: none;
}

.scroll-wrapper::-webkit-scrollbar {
	display: none;
}

.carousel-container {
	position: relative;
	display: flex;
	align-items: center;
}

.nav-button {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 10;
	background: white;
	color: #4a5568;
	border: none;
	border-radius: 50%;
	width: 48px;
	height: 48px;
	font-size: 1.6rem;
	line-height: 1;
	cursor: pointer;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1), 0 0 0 1px rgba(0, 0, 0, 0.05);
	transition: all 0.3s ease;
}

.nav-button:hover {
	background-color: #f0f4f8;
	color: #667eea;
	transform: translateY(-50%) scale(1.05);
	box-shadow: 0 8px 25px rgba(102, 126, 234, 0.25);
}

.nav-button:disabled {
	opacity: 0.5;
	cursor: not-allowed;
	transform: translateY(-50%) scale(1);
	box-shadow: none;
}

.prev-button {
	left: -20px;
}

.next-button {
	right: -20px;
}

.destinations-grid {
	display: grid;
	grid-template-columns: repeat(10, 250px);
	width: max-content;
	gap: 25px;
	grid-auto-rows: 1fr;
}

.destination-card {
	background: white;
	border-radius: 16px;
	padding: 30px;
	cursor: pointer;
	transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
	position: relative;
	overflow: hidden;
	height: 100%;
}

.destination-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	opacity: 0;
	transition: opacity 0.4s ease;
}

.destination-card:hover::before {
	opacity: 0.05;
}

.destination-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 40px rgba(102, 126, 234, 0.2);
}

.destination-image {
	font-size: 3.5rem;
	text-align: center;
	margin-bottom: 20px;
	transition: transform 0.4s ease;
}

.destination-card:hover .destination-image {
	transform: scale(1.1) rotate(5deg);
}

.destination-info {
	text-align: center;
	position: relative;
	z-index: 1;
}

.destination-name {
	font-size: 1.3rem;
	font-weight: 700;
	color: #2d3748;
	margin-bottom: 8px;
}

.destination-properties {
	color: #718096;
	font-size: 0.95rem;
}

/* ===== HOTELS GRID ===== */
.hotels-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 40px;
}

.hotel-card {
	background: white;
	border-radius: 20px;
	overflow: hidden;
	cursor: pointer;
	transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
}

.hotel-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
}

.hotel-image {
	height: 250px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	position: relative;
	overflow: hidden;
}

.hotel-image-placeholder {
	font-size: 6rem;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	color: white;
	transition: transform 0.4s ease;
}

.hotel-card:hover .hotel-image-placeholder {
	transform: scale(1.1);
}

.hotel-details {
	padding: 25px;
}

.hotel-name {
	font-size: 1.5rem;
	font-weight: 700;
	color: #2d3748;
	margin-bottom: 10px;
}

.hotel-rating {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 10px;
}

.stars {
	color: #fbbf24;
	font-size: 0.9rem;
}

.review-score {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	padding: 4px 10px;
	border-radius: 8px;
	font-weight: 700;
	font-size: 0.9rem;
}

.review-count {
	color: #718096;
	font-size: 0.9rem;
}

.hotel-location {
	color: #718096;
	font-size: 0.95rem;
	margin-bottom: 15px;
}

.hotel-features {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-bottom: 20px;
}

.feature-tag {
	background: #f0f4ff;
	color: #667eea;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 0.85rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.feature-tag:hover {
	background: #667eea;
	color: white;
	transform: translateY(-2px);
}

.hotel-footer {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	padding-top: 20px;
	border-top: 2px solid #f7fafc;
}

.discount-badge {
	background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
	color: white;
	padding: 8px 16px;
	border-radius: 20px;
	font-weight: 600;
	font-size: 0.9rem;
	animation: pulse 2s infinite;
}

@
keyframes pulse { 0%, 100% {
	transform: scale(1);
}

50

	
%
{
transform

	
:

	
scale
(

	
1
.05

	
)
;

	
}
}
.price-info {
	text-align: right;
}

.price-label {
	font-size: 0.85rem;
	color: #718096;
	margin-bottom: 5px;
}

.price {
	font-size: 2rem;
	font-weight: 700;
	color: #667eea;
	line-height: 1;
}

.price-currency {
	font-size: 1.2rem;
}

.price-note {
	font-size: 0.8rem;
	color: #718096;
	margin-top: 5px;
}

/* ===== MODAL ===== */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	backdrop-filter: blur(8px);
	z-index: 1000;
	align-items: center;
	justify-content: center;
	animation: fadeIn 0.3s ease;
}

.modal.active {
	display: flex;
}

.modal-content {
	background: white;
	border-radius: 24px;
	padding: 40px;
	max-width: 500px;
	width: 90%;
	max-height: 90vh;
	overflow-y: auto;
	position: relative;
	animation: slideUp 0.4s cubic-bezier(0.4, 0, 0.2, 1);
	box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
}

.modal-close {
	position: absolute;
	top: 20px;
	right: 20px;
	font-size: 2rem;
	color: #a0aec0;
	cursor: pointer;
	transition: all 0.3s ease;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
}

.modal-close:hover {
	background: #f7fafc;
	color: #2d3748;
	transform: rotate(90deg);
}

.modal-title {
	font-size: 2rem;
	font-weight: 800;
	background: linear-gradient(90deg, #00c6ff, #0072ff);
	-webkit-background-clip: text;
	color: transparent;
	text-align: center;
	margin-bottom: 12px;
	letter-spacing: 1px;
	opacity: 0;
	transform: translateY(-10px);
	animation: fadeSlideDown 0.6s ease forwards;
}

@
keyframes fadeSlideDown {to { opacity:1;
	transform: translateY(0);
}

}
.modal-subtitle {
	color: #718096;
	margin-bottom: 30px;
	line-height: 1.6;
}

.social-btn {
	width: 100%;
	padding: 14px;
	border: 2px solid #e2e8f0;
	border-radius: 12px;
	background: white;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 12px;
	margin-bottom: 12px;
	transition: all 0.3s ease;
}

.social-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.btn-google {
	color: #ea4335;
	border-color: #ea4335;
}

.btn-google:hover {
	background: #ea4335;
	color: white;
}

.btn-facebook {
	color: #1877f2;
	border-color: #1877f2;
}

.btn-facebook:hover {
	background: #1877f2;
	color: white;
}

.btn-apple {
	color: #000;
	border-color: #000;
}

.btn-apple:hover {
	background: #000;
	color: white;
}

.divider {
	text-align: center;
	margin: 25px 0;
	color: #a0aec0;
	position: relative;
}

.divider::before, .divider::after {
	content: '';
	position: absolute;
	top: 50%;
	width: 40%;
	height: 1px;
	background: #e2e8f0;
}

.divider::before {
	left: 0;
}

.divider::after {
	right: 0;
}

.form-group {
	margin-bottom: 20px;
}

.btn-continue {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	margin-top: 10px;
}

.btn-continue:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

.suggestions-box {
	position: absolute;
	background: white;
	width: 100%;
	max-height: 200px;
	overflow-y: auto;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	border-radius: 0 0 8px 8px;
	z-index: 1000;
	display: none; /* Mặc định ẩn */
}

.suggestion-item {
	padding: 10px 15px;
	cursor: pointer;
	border-bottom: 1px solid #eee;
}

.suggestion-item:hover {
	background-color: #f0f4f8;
}

/* Khung chứa danh sách */
.search-container {
	max-width: 1200px;
	margin: 30px auto;
	padding: 0 20px;
	display: grid;
	grid-template-columns: 260px 1fr; /* Cột Filter và Cột Danh sách */
	gap: 30px;
}

/* Sidebar lọc (cột trái) */
.filter-sidebar {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	border: 1px solid #eee;
	height: fit-content;
}

.filter-group {
	margin-bottom: 20px;
	padding-bottom: 15px;
	border-bottom: 1px solid #f0f0f0;
}

.filter-title {
	font-weight: 700;
	margin-bottom: 10px;
	display: block;
	color: #2d3748;
}

/* Danh sách khách sạn (cột phải) */
.hotel-list {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

/* Thẻ Card Khách sạn */
.hotel-card {
	display: flex;
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
	border: 1px solid #e2e8f0;
	transition: transform 0.2s, box-shadow 0.2s;
}

.hotel-card:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

/* Ảnh khách sạn */
.hotel-img-wrapper {
	width: 280px;
	min-width: 280px;
	height: 210px;
	position: relative;
}

.hotel-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Thông tin chi tiết */
.hotel-info {
	padding: 20px;
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.hotel-header {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}

.hotel-name {
	font-size: 20px;
	font-weight: 700;
	color: #2d3748;
	margin: 0 0 8px 0;
}

.hotel-address {
	font-size: 14px;
	color: #718096;
	margin-bottom: 8px;
}

.hotel-address i {
	color: #e53e3e; /* Màu đỏ icon map */
	margin-right: 5px;
}

.rating-box {
	display: flex;
	align-items: center;
	gap: 4px;
	color: #f6ad55; /* Màu vàng sao */
	font-weight: 600;
}

.amenities-preview {
	font-size: 13px;
	color: #4a5568;
	margin-top: 5px;
	background: #f7fafc;
	padding: 8px;
	border-radius: 6px;
	display: inline-block;
}

/* Phần chân card (Giá & Nút) */
.hotel-footer {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-top: 15px;
	padding-top: 15px;
	border-top: 1px solid #edf2f7;
}

.price-box {
	text-align: right;
}

.price-label {
	display: block;
	font-size: 12px;
	color: #718096;
}

.price-value {
	font-size: 24px;
	font-weight: 700;
	color: #e53e3e; /* Màu đỏ giá tiền */
}

/* Nút Xem phòng */
.btn-detail {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	padding: 10px 24px;
	border-radius: 8px;
	text-decoration: none;
	font-weight: 600;
	transition: opacity 0.2s;
}

.btn-detail:hover {
	opacity: 0.9;
	color: #fff;
	box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

/* Thông báo không có kết quả */
.no-result {
	text-align: center;
	padding: 40px;
	background: white;
	border-radius: 12px;
	color: #718096;
}

/* ===== ANIMATIONS ===== */
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
@
keyframes fadeInDown {from { opacity:0;
	transform: translateY(-30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes slideUp {from { opacity:0;
	transform: translateY(50px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* ===== RESPONSIVE ===== */
@media ( max-width : 1280px) {
	.search-form {
		grid-template-columns: 1.5fr 1fr 1fr 1.2fr auto;
	}
}

@media ( max-width : 1024px) {
	.search-form {
		grid-template-columns: 1fr 1fr;
		gap: 15px;
	}
	.btn-search {
		grid-column: 1/-1;
	}
	@media ( max-width : 768px) {
		.hotels-grid {
			grid-template-columns: 1fr;
		}
	}
	.search-form {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
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
				<a href="login_error_login.jsp"
					style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
					Quên mật khẩu? </a> <a href="login_error_register.jsp"
					style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
					Tạo tài khoản </a>
			</div>

		</div>
	</div>

	<!-- Register Modal -->
	<div class="modal" id="registerModal">
		<div class="modal-content">
			<span class="modal-close" onclick="closeRegisterModal()">&times;</span>
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
			<form action="${pageContext.request.contextPath}/register"
				method="post">
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
				<button id="continueRegisterBtn" class="btn-continue">Tiếp
					tục</button>
			</form>
			<div style="text-align: center; margin-top: 10px;"></div>
		</div>
	</div>


	<!-- Hero Section -->
	<section class="hero">
		<div class="container">
			<h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
			<p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách
				sạn trên toàn thế giới</p>
			<div class="search-box">
				<form class="search-form"
					action="${pageContext.request.contextPath}/search" method="get">
					<!-- Destination -->
					<div class="form-field">
						<label class="form-label">Điểm đến</label> <input type="text"
							class="form-input" name="keyword" placeholder="Bạn muốn đi đâu?"
							required>
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
		<jsp:include page="footer.jsp" />
	</main>
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
			// Register Modal
			const registerModal = document.getElementById('registerModal');
			const registerBtn = document.getElementById('headerRegisterBtn');
			
			if (registerBtn) {
				registerBtn.addEventListener('click', () => {
					registerModal.classList.add('active');
				});
			}
	
			function closeRegisterModal() {
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