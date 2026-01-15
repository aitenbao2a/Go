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

.hero {
	background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
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
	border-color: #4a5568;
	background: white;
	box-shadow: 0 0 0 3px rgba(74, 85, 104, 0.1);
	transform: translateY(-2px);
}

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
	border-color: #4a5568;
	background: white;
	box-shadow: 0 0 0 3px rgba(74, 85, 104, 0.1);
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
	color: #4a5568;
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
	color: #4a5568;
	font-size: 1.3rem;
	cursor: pointer;
	transition: all 0.3s ease;
	display: flex;
	align-items: center;
	justify-content: center;
}

.guest-btn:hover {
	border-color: #4a5568;
	background: #4a5568;
	color: white;
	transform: scale(1.1);
}

.guest-count {
	font-weight: 600;
	color: #2d3748;
	min-width: 30px;
	text-align: center;
}

.btn-search {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 14px 32px;
	background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
	color: white;
	border: none;
	border-radius: 12px;
	font-size: 1rem;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(45, 55, 72, 0.3);
	white-space: nowrap;
}

.btn-search:hover {
	transform: translateY(-3px);
	box-shadow: 0 6px 25px rgba(45, 55, 72, 0.4);
}

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
	background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
	border-radius: 2px;
}

.carousel-container {
	position: relative;
	display: flex;
	align-items: center;
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
	cursor: pointer;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.nav-button:hover {
	background-color: #f0f4f8;
	color: #4a5568;
	transform: translateY(-50%) scale(1.05);
}

.prev-button {
	left: -20px;
}

.next-button {
	right: -20px;
}

.destinations-grid {
	display: flex;
	width: max-content;
	gap: 25px;
	padding: 20px 0;
}

.destination-card {
	flex: 0 0 250px;
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

.destination-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 40px rgba(45, 55, 72, 0.15);
}

.destination-image {
	width: 120px;
	height: 120px;
	margin: 0 auto 20px;
	border-radius: 18px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #f5f5f5;
	transition: transform 0.4s ease;
}

.destination-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.destination-card:hover .destination-image {
	transform: scale(1.08);
}

.destination-info {
	text-align: center;
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

.hotels-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
	gap: 24px;
}

.hotel-card {
	background: #fff;
	border-radius: 20px;
	overflow: hidden;
	cursor: pointer;
	transition: transform 0.25s ease, box-shadow 0.25s ease;
}

.hotel-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
}

.hotel-image {
	width: 100%;
	height: 220px;
	overflow: hidden;
	background: #f2f2f2;
}

.hotel-image img {
	width: 100%;
	height: 100%;
	min-width: 100%;
	min-height: 100%;
	object-fit: cover;
	display: block;
}

.hotel-details {
	padding: 16px;
	display: flex;
	flex-direction: column;
	gap: 12px;
}

.hotel-name {
	font-size: 18px;
	font-weight: 700;
}

.hotel-location {
	font-size: 14px;
	color: #777;
}

.hotel-features {
	display: flex;
	flex-wrap: wrap;
	gap: 6px;
}

.feature-tag {
	background: #f3f6ff;
	padding: 4px 10px;
	border-radius: 20px;
	font-size: 12px;
}

.hotel-footer {
	margin-top: auto;
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
	background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
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
	color: #4a5568;
	padding: 8px 14px;
	border-radius: 20px;
	font-size: 0.85rem;
	font-weight: 500;
	transition: all 0.3s ease;
}

.feature-tag:hover {
	background: #4a5568;
	color: white;
	transform: translateY(-2px);
}

.hotel-footer {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	padding-top: 20px;
	border-top: 2px solid #f7fafc;
	margin-top: auto;
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
	color: #2d3748;
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

.features-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 30px;
	margin-top: 40px;
}

.feature-item {
	background: white;
	padding: 40px 30px;
	border-radius: 16px;
	text-align: center;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.feature-item:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(45, 55, 72, 0.15);
}

.feature-icon {
	font-size: 3.5rem;
	margin-bottom: 20px;
}

.feature-title {
	font-size: 1.3rem;
	font-weight: 700;
	color: #2d3748;
	margin-bottom: 12px;
}

.feature-desc {
	color: #718096;
	line-height: 1.6;
}

.tips-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
	gap: 25px;
	margin-top: 40px;
}

.tip-card {
	background: white;
	padding: 35px 25px;
	border-radius: 16px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: all 0.3s ease;
	border-left: 4px solid #4a5568;
}

.tip-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
}

.tip-image {
	font-size: 3rem;
	margin-bottom: 15px;
}

.tip-title {
	font-size: 1.2rem;
	font-weight: 700;
	color: #2d3748;
	margin-bottom: 10px;
}

.tip-desc {
	color: #718096;
	line-height: 1.6;
	font-size: 0.95rem;
}

.stats-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	gap: 40px;
	text-align: center;
}

.stat-item {
	color: white;
}

.stat-number {
	font-size: 3.5rem;
	font-weight: 800;
	margin-bottom: 10px;
	text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
	color: #2d3748;
}

.stat-label {
	font-size: 1.1rem;
	opacity: 0.95;
	font-weight: 500;
	color: #4a5568;
}

.offers-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
	margin-top: 40px;
}

.offer-card {
	background: white;
	border-radius: 20px;
	padding: 35px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
	position: relative;
	overflow: hidden;
	transition: all 0.3s ease;
	border: 2px solid transparent;
}

.offer-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 15px 40px rgba(45, 55, 72, 0.15);
	border-color: #4a5568;
}

.offer-badge {
	position: absolute;
	top: 20px;
	right: 20px;
	background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
	color: white;
	padding: 8px 16px;
	border-radius: 20px;
	font-weight: 700;
	font-size: 0.85rem;
	box-shadow: 0 4px 15px rgba(245, 87, 108, 0.3);
}

.offer-content {
	margin-top: 10px;
}

.offer-title {
	font-size: 1.5rem;
	font-weight: 800;
	color: #2d3748;
	margin-bottom: 15px;
}

.offer-desc {
	color: #718096;
	line-height: 1.6;
	margin-bottom: 20px;
}

.offer-code {
	background: #f7fafc;
	color: #2d3748;
	padding: 12px 20px;
	border-radius: 10px;
	font-weight: 700;
	display: inline-block;
	margin-bottom: 20px;
	border: 2px dashed #cbd5e0;
}

.offer-btn {
	width: 100%;
	padding: 14px;
	background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
	color: white;
	border: none;
	border-radius: 12px;
	font-weight: 700;
	font-size: 1rem;
	cursor: pointer;
	transition: all 0.3s ease;
}

.offer-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(45, 55, 72, 0.3);
}

.newsletter-box {
	background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
	padding: 60px 50px;
	border-radius: 24px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 40px;
	box-shadow: 0 15px 50px rgba(45, 55, 72, 0.25);
}

.newsletter-content {
	flex: 1;
}

.newsletter-title {
	font-size: 2.2rem;
	font-weight: 800;
	color: white;
	margin-bottom: 12px;
}

.newsletter-desc {
	color: rgba(255, 255, 255, 0.9);
	font-size: 1.1rem;
}

.newsletter-form {
	flex: 1;
	display: flex;
	gap: 15px;
}

.newsletter-input {
	flex: 1;
	padding: 16px 20px;
	border: none;
	border-radius: 12px;
	font-size: 1rem;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.newsletter-input:focus {
	outline: none;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.newsletter-btn {
	padding: 16px 35px;
	background: white;
	color: #2d3748;
	border: none;
	border-radius: 12px;
	font-weight: 700;
	font-size: 1rem;
	cursor: pointer;
	transition: all 0.3s ease;
	white-space: nowrap;
}

.newsletter-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(255, 255, 255, 0.3);
	background: #f7fafc;
}

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
	animation: slideUp 0.4s ease;
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
	-webkit-text-fill-color: transparent;
	text-align: center;
	margin-bottom: 12px;
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
	background: linear-gradient(135deg, #2d3748 0%, #4a5568 100%);
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
	box-shadow: 0 6px 20px rgba(45, 55, 72, 0.3);
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
@media ( max-width : 1280px) {
	.search-form {
		grid-template-columns: 1.5fr 1fr 1fr 1.2fr auto;
	}
	.hotels-grid {
		grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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
	.hotels-grid {
		grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	}
}

@media ( max-width : 768px) {
	.search-form {
		grid-template-columns: 1fr;
	}
	.hotels-grid {
		grid-template-columns: 1fr;
	}
	.features-grid, .tips-grid, .offers-grid {
		grid-template-columns: 1fr;
	}
	.newsletter-box {
		flex-direction: column;
		padding: 40px 30px;
		text-align: center;
	}
	.newsletter-form {
		width: 100%;
		flex-direction: column;
	}
	.newsletter-btn {
		width: 100%;
	}
	.stats-grid {
		grid-template-columns: repeat(2, 1fr);
		gap: 30px;
	}
	.stat-number {
		font-size: 2.5rem;
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
					height="20" width="20"> Đăng nhập bằng Google
			</button>
			<button class="social-btn btn-facebook">
				<img
					src="${pageContext.request.contextPath}/images/logo_facebook.webp"
					height="20" width="20"> Đăng nhập bằng Facebook
			</button>
			<button class="social-btn btn-apple">
				<img src="${pageContext.request.contextPath}/images/logo_apple.png"
					height="20" width="20"> Đăng nhập bằng Apple
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
					height="20" width="20"> Đăng nhập bằng Google
			</button>
			<button class="social-btn btn-facebook">
				<img
					src="${pageContext.request.contextPath}/images/logo_facebook.webp"
					height="20" width="20"> Đăng nhập bằng Facebook
			</button>
			<button class="social-btn btn-apple">
				<img src="${pageContext.request.contextPath}/images/logo_apple.png"
					height="20" width="20"> Đăng nhập bằng Apple
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
					<label class="form-label">Xác nhận mật khẩu</label> <input
						type="password" class="form-input" name="confirmPassword"
						placeholder="Xác nhận mật khẩu" required>
				</div>
				<button type="submit" class="btn-continue">Tiếp tục</button>
			</form>
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
					<div class="form-field">
						<label class="form-label">Điểm đến</label> <input type="text"
							class="form-input" name="keyword" placeholder="Bạn muốn đi đâu?"
							required>
					</div>
					<div class="form-field">
						<label class="form-label">Nhận phòng</label> <input type="date"
							class="form-input" name="checkin" id="checkInDate" required>
					</div>
					<div class="form-field">
						<label class="form-label">Trả phòng</label> <input type="date"
							class="form-input" name="checkout" id="checkOutDate" required>
					</div>
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
							<input type="hidden" name="adults" id="adultsInput" value="2">
							<input type="hidden" name="children" id="childrenInput" value="0">
							<input type="hidden" name="rooms" id="roomsInput" value="1">
						</div>
					</div>
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
		<!-- Features Section -->
		<section class="section" style="background: white; padding: 60px 0;">
			<div class="container">
				<h2 class="section-title">Tại sao chọn Go Travel?</h2>
				<div class="features-grid">
					<div class="feature-item">
						<div class="feature-icon">💰</div>
						<h3 class="feature-title">Giá tốt nhất</h3>
						<p class="feature-desc">So sánh giá từ hàng triệu khách sạn để
							tìm deal tốt nhất cho bạn</p>
					</div>
					<div class="feature-item">
						<div class="feature-icon">🔒</div>
						<h3 class="feature-title">Thanh toán an toàn</h3>
						<p class="feature-desc">Bảo mật thông tin thanh toán với công
							nghệ mã hóa tiên tiến</p>
					</div>
					<div class="feature-item">
						<div class="feature-icon">⚡</div>
						<h3 class="feature-title">Xác nhận nhanh</h3>
						<p class="feature-desc">Nhận xác nhận đặt phòng ngay lập tức
							qua email và SMS</p>
					</div>
					<div class="feature-item">
						<div class="feature-icon">💬</div>
						<h3 class="feature-title">Hỗ trợ 24/7</h3>
						<p class="feature-desc">Đội ngũ chăm sóc khách hàng sẵn sàng
							hỗ trợ bạn mọi lúc mọi nơi</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Popular Destinations -->
		<section class="section">
			<div class="container">
				<h2 class="section-title">Điểm đến phổ biến</h2>
				<div class="carousel-container">
					<button class="nav-button prev-button"
						onclick="scrollCarousel('prev')">&lt;</button>
					<div class="scroll-wrapper" id="destinationScrollWrapper">
						<div class="destinations-grid">
							<c:choose>
								<c:when test="${not empty destinations}">
									<c:forEach var="dest" items="${destinations}">
										<div class="destination-card"
											onclick="location.href='${pageContext.request.contextPath}/search?keyword=${dest.cityName}'">
											<div class="destination-image">${dest.icon != null ? dest.icon : '🏙️'}</div>
											<div class="destination-info">
												<div class="destination-name">${dest.cityName}</div>
												<div class="destination-properties">
													<fmt:formatNumber value="${dest.hotelCount}" type="number" />
													khách sạn
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Hồ Chí Minh'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/saigon.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Thành Phố Hồ Chí Minh</div>
											<div class="destination-properties">1,523 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Đà Nẵng'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/danang.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Đà Nẵng</div>
											<div class="destination-properties">1,523 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Hà Nội'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/hanoi.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Hà Nội</div>
											<div class="destination-properties">1,892 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Nha Trang'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/nhatrang.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Nha Trang</div>
											<div class="destination-properties">986 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Vũng Tàu'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/vungtau.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Vũng Tàu</div>
											<div class="destination-properties">1,200 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Phú Quốc'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/phuquoc.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Phú Quốc</div>
											<div class="destination-properties">1,150 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Hội An'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/hoian.webp"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Hội An</div>
											<div class="destination-properties">3,623 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Quy Nhơn'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/quinhon.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Quy Nhơn</div>
											<div class="destination-properties">523 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Cần Thơ'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/cantho.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Cần Thơ</div>
											<div class="destination-properties">2,230 khách sạn</div>
										</div>
									</div>
									<div class="destination-card"
										onclick="location.href='${pageContext.request.contextPath}/search?keyword=Đà Lạt'">
										<div class="destination-image">
											<img
												src="${pageContext.request.contextPath}/images/dalat.jpg"
												alt="Destination">
										</div>
										<div class="destination-info">
											<div class="destination-name">Đà Lạt</div>
											<div class="destination-properties">1,523 khách sạn</div>
										</div>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<button class="nav-button next-button"
						onclick="scrollCarousel('next')">&gt;</button>
				</div>
			</div>
		</section>

		<!-- Travel Tips Section -->
		<section class="section"
			style="background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);">
			<div class="container">
				<h2 class="section-title">Mẹo du lịch hữu ích</h2>
				<div class="tips-grid">
					<div class="tip-card">
						<div class="tip-image">📅</div>
						<h3 class="tip-title">Đặt phòng sớm</h3>
						<p class="tip-desc">Đặt phòng trước 2-3 tháng để có giá tốt
							nhất, đặc biệt trong mùa cao điểm</p>
					</div>
					<div class="tip-card">
						<div class="tip-image">🗓️</div>
						<h3 class="tip-title">Linh hoạt ngày đi</h3>
						<p class="tip-desc">Du lịch vào giữa tuần thường rẻ hơn cuối
							tuần 20-30%</p>
					</div>
					<div class="tip-card">
						<div class="tip-image">🎫</div>
						<h3 class="tip-title">Săn deal khuyến mãi</h3>
						<p class="tip-desc">Theo dõi các chương trình flash sale để
							nhận ưu đãi lên đến 50%</p>
					</div>
					<div class="tip-card">
						<div class="tip-image">⭐</div>
						<h3 class="tip-title">Đọc review kỹ</h3>
						<p class="tip-desc">Tham khảo đánh giá từ khách thực tế để
							chọn khách sạn phù hợp</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Stats Section -->
		<section class="section" style="background: white; padding: 80px 0;">
			<div class="container">
				<div class="stats-grid">
					<div class="stat-item">
						<div class="stat-number">2M+</div>
						<div class="stat-label">Khách sạn</div>
					</div>
					<div class="stat-item">
						<div class="stat-number">50M+</div>
						<div class="stat-label">Đặt phòng thành công</div>
					</div>
					<div class="stat-item">
						<div class="stat-number">200+</div>
						<div class="stat-label">Quốc gia</div>
					</div>
					<div class="stat-item">
						<div class="stat-number">4.8/5</div>
						<div class="stat-label">Đánh giá khách hàng</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Special Offers Section -->
		<section class="section" style="background: white;">
			<div class="container">
				<h2 class="section-title">Ưu đãi đặc biệt</h2>
				<div class="offers-grid">
					<div class="offer-card">
						<div class="offer-badge">HOT 🔥</div>
						<div class="offer-content">
							<h3 class="offer-title">Giảm 30% Cuối Tuần</h3>
							<p class="offer-desc">Áp dụng cho booking từ thứ 6-chủ nhật
								tại các khách sạn 4-5 sao</p>
							<div class="offer-code">Code: WEEKEND30</div>
							<button class="offer-btn">Đặt ngay</button>
						</div>
					</div>
					<div class="offer-card">
						<div class="offer-badge">MỚI ✨</div>
						<div class="offer-content">
							<h3 class="offer-title">Tích Điểm Nhận Quà</h3>
							<p class="offer-desc">Đặt 5 đêm - tặng 1 đêm miễn phí cho lần
								booking tiếp theo</p>
							<div class="offer-code">Tự động áp dụng</div>
							<button class="offer-btn">Tìm hiểu</button>
						</div>
					</div>
					<div class="offer-card">
						<div class="offer-badge">SALE 💎</div>
						<div class="offer-content">
							<h3 class="offer-title">Flash Sale Hàng Ngày</h3>
							<p class="offer-desc">Giảm đến 50% cho khách sạn được chọn,
								số lượng có hạn</p>
							<div class="offer-code">10:00 - 22:00</div>
							<button class="offer-btn">Xem deal</button>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Newsletter Section -->
		<section class="section"
			style="background: linear-gradient(135deg, #f5f7fa 0%, #e8ecf1 100%);">
			<div class="container">
				<div class="newsletter-box">
					<div class="newsletter-content">
						<h2 class="newsletter-title">Đăng ký nhận tin khuyến mãi</h2>
						<p class="newsletter-desc">Nhận thông báo về các deal hot và
							ưu đãi độc quyền qua email</p>
					</div>
					<form
						action="${pageContext.request.contextPath}/view/login_error_register.jsp"
						method="post">
						<input type="email" name="email"
							placeholder="Nhập email của bạn..." required>
						<button type="submit">Đăng ký</button>
					</form>
				</div>
			</div>
		</section>

		<!-- Featured Hotels -->
		<section class="section"
			style="background: white; margin: 0; padding: 80px 0;">
			<div class="container">
				<h2 class="section-title">Khách sạn đề xuất</h2>

				<c:choose>
					<c:when test="${not empty featuredHotels}">
						<div class="hotels-grid">
							<c:forEach var="hotel" items="${featuredHotels}">
								<div class="hotel-card"
									onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=${hotel.hotelId}'">
									<div class="hotel-image">
										<c:choose>
											<c:when test="${not empty hotel.images}">
												<c:set var="imageArray"
													value="${fn:split(hotel.images, ',')}" />
												<c:set var="firstImage"
													value="${(not empty imageArray) ? imageArray[0] : ''}" />
												<img src="${firstImage}" alt="${hotel.hotelName}">
											</c:when>
											<c:otherwise>
												<div class="hotel-image-placeholder">🏨</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="hotel-details">
										<div>
											<div class="hotel-name">${hotel.hotelName}</div>
											<div class="hotel-rating">
												<span class="stars"> <c:forEach begin="1"
														end="${hotel.starRating}">★</c:forEach>
												</span>
												<c:if test="${not empty hotel.reviewScore}">
													<span class="review-score"> <fmt:formatNumber
															value="${hotel.reviewScore}" maxFractionDigits="1" />
													</span>
												</c:if>
												<c:if test="${not empty hotel.reviewCount}">
													<span class="review-count"> (<fmt:formatNumber
															value="${hotel.reviewCount}" type="number" /> đánh giá)
													</span>
												</c:if>
											</div>
											<div class="hotel-location">
												📍 ${hotel.address}
												<c:if test="${not empty hotel.city}">, ${hotel.city}</c:if>
											</div>
										</div>
										<c:if test="${not empty hotel.amenities}">
											<div class="hotel-features">
												<c:set var="amenitiesArray"
													value="${fn:split(hotel.amenities, ',')}" />
												<c:forEach var="amenity" items="${amenitiesArray}" begin="0"
													end="3">
													<span class="feature-tag">${fn:trim(amenity)}</span>
												</c:forEach>
											</div>
										</c:if>
										<div class="hotel-footer">
											<c:if
												test="${not empty hotel.discount and hotel.discount > 0}">
												<span class="discount-badge">-${hotel.discount}% hôm
													nay</span>
											</c:if>
											<div class="price-info">
												<div class="price-label">Giá mỗi đêm từ</div>
												<div class="price">
													<span class="price-currency">₫</span>
													<fmt:formatNumber value="${hotel.minPrice}" type="number"
														maxFractionDigits="0" />
												</div>
												<div class="price-note">Đã bao gồm thuế và phí</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</c:when>
					<c:otherwise>
						<div class="hotels-grid">

							<!-- Hotel 1 -->
							<div class="hotel-card"
								onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=1'">
								<div class="hotel-image">
									<img
										src="${pageContext.request.contextPath}/database/images/grandpalace/gp1.jpg"
										alt="Grand Palace Đà Nẵng" loading="lazy">
								</div>

								<div class="hotel-details">
									<div>
										<div class="hotel-name">Grand Palace Đà Nẵng</div>
										<div class="hotel-rating">
											<span class="stars">★★★★★</span> <span class="review-score">9.2</span>
											<span class="review-count">(2,847 đánh giá)</span>
										</div>
										<div class="hotel-location">📍 Võ Nguyên Giáp, Đà Nẵng</div>
									</div>

									<div class="hotel-features">
										<span class="feature-tag">🏊 Pool</span> <span
											class="feature-tag">💆 Spa</span> <span class="feature-tag">📶
											WiFi</span>
									</div>

									<div class="hotel-footer">
										<div class="price-info">
											<div class="price-label">Giá mỗi đêm từ</div>
											<div class="price">
												<span class="price-currency">₫</span>950,000
											</div>
											<div class="price-note">Đã bao gồm thuế và phí</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Hotel 2 -->
							<div class="hotel-card"
								onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=2'">
								<div class="hotel-image">
									<img
										src="${pageContext.request.contextPath}/database/images/cityinn/ci1.jpg"
										alt="City Inn Hà Nội" loading="lazy">
								</div>

								<div class="hotel-details">
									<div>
										<div class="hotel-name">City Inn Hà Nội</div>
										<div class="hotel-rating">
											<span class="stars">★★★★☆</span> <span class="review-score">8.8</span>
											<span class="review-count">(1,420 đánh giá)</span>
										</div>
										<div class="hotel-location">📍 Phố Huế, Hà Nội</div>
									</div>

									<div class="hotel-features">
										<span class="feature-tag">💪 Gym</span> <span
											class="feature-tag">🍴 Restaurant</span> <span
											class="feature-tag">📶 WiFi</span>
									</div>

									<div class="hotel-footer">
										<div class="price-info">
											<div class="price-label">Giá mỗi đêm từ</div>
											<div class="price">
												<span class="price-currency">₫</span>780,000
											</div>
											<div class="price-note">Đã bao gồm thuế và phí</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Hotel 5 -->
							<div class="hotel-card"
								onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=5'">
								<div class="hotel-image">
									<img
										src="${pageContext.request.contextPath}/database/images/danang/dn1.jpg"
										alt="Resort Biển Đà Nẵng" loading="lazy">
								</div>

								<div class="hotel-details">
									<div>
										<div class="hotel-name">Resort Biển Đà Nẵng</div>
										<div class="hotel-rating">
											<span class="stars">★★★★★</span> <span class="review-score">9.3</span>
											<span class="review-count">(3,020 đánh giá)</span>
										</div>
										<div class="hotel-location">📍 Võ Nguyên Giáp, Đà Nẵng</div>
									</div>

									<div class="hotel-features">
										<span class="feature-tag">🍳 Dinner</span> <span
											class="feature-tag">🧭 Pool</span> <span
											class="feature-tag">📶 WiFi</span>
									</div>

									<div class="hotel-footer">
										<div class="price-info">
											<div class="price-label">Giá mỗi đêm từ</div>
											<div class="price">
												<span class="price-currency">₫</span>1,000,000
											</div>
											<div class="price-note">Đã bao gồm thuế và phí</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Hotel 4 -->
							<div class="hotel-card"
								onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=4'">
								<div class="hotel-image">
									<img
										src="${pageContext.request.contextPath}/database/images/hanoi/hnck1.jpg"
										alt="Hà Nội Cổ Kính Inn" loading="lazy">
								</div>

								<div class="hotel-details">
									<div>
										<div class="hotel-name">Hà Nội Cổ Kính Inn</div>
										<div class="hotel-rating">
											<span class="stars">★★★★☆</span> <span class="review-score">8.7</span>
											<span class="review-count">(1,150 đánh giá)</span>
										</div>
										<div class="hotel-location">📍 Hàng Bông, Phố Cổ Hà Nội</div>
									</div>

									<div class="hotel-features">
										<span class="feature-tag">🍳 Breakfast</span> <span
											class="feature-tag">🧭 Tour</span> <span
											class="feature-tag">📶 WiFi</span>
									</div>

									<div class="hotel-footer">
										<div class="price-info">
											<div class="price-label">Giá mỗi đêm từ</div>
											<div class="price">
												<span class="price-currency">₫</span>850,000
											</div>
											<div class="price-note">Đã bao gồm thuế và phí</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Hotel 3 -->
							<div class="hotel-card"
								onclick="location.href='${pageContext.request.contextPath}/hotel-detail?id=3'">
								<div class="hotel-image">
									<img
										src="${pageContext.request.contextPath}/database/images/saigon/sgp1.jpg"
										alt="Sài Gòn Panorama" loading="lazy">
								</div>

								<div class="hotel-details">
									<div>
										<div class="hotel-name">Sài Gòn Panorama</div>
										<div class="hotel-rating">
											<span class="stars">★★★★★</span> <span class="review-score">9.0</span>
											<span class="review-count">(2,110 đánh giá)</span>
										</div>
										<div class="hotel-location">📍 Nguyễn Huệ, TP.HCM</div>
									</div>

									<div class="hotel-features">
										<span class="feature-tag">🏊 Pool</span> <span
											class="feature-tag">💆 Spa</span> <span class="feature-tag">💪
											Gym</span>
									</div>

									<div class="hotel-footer">
										<div class="price-info">
											<div class="price-label">Giá mỗi đêm từ</div>
											<div class="price">
												<span class="price-currency">₫</span>990,000
											</div>
											<div class="price-note">Đã bao gồm thuế và phí</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</c:otherwise>

				</c:choose>
			</div>
		</section>
	</main>

	<jsp:include page="footer.jsp" />

	<script>
		// Login Modal
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