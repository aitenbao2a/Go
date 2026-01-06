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
/* ===== SEARCH RESULTS PAGE - CHỈ CSS ĐẸP, KHÔNG THAY ĐỔI HTML ===== */

/* Search Container */
.search-container {
    max-width: 1400px;
    margin: 40px auto;
    padding: 0 30px;
    display: grid;
    grid-template-columns: 280px 1fr;
    gap: 32px;
    align-items: start;
}

/* ===== FILTER SIDEBAR ===== */
.filter-sidebar {
    position: sticky;
    top: 100px;
    background: white;
    border-radius: 20px;
    padding: 28px 24px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
}

.filter-sidebar:hover {
    box-shadow: 0 6px 30px rgba(0, 0, 0, 0.12);
}

.filter-group {
    margin-bottom: 28px;
    padding-bottom: 24px;
    border-bottom: 2px solid #f3f4f6;
}

.filter-group:last-child {
    margin-bottom: 0;
    padding-bottom: 0;
    border-bottom: none;
}

.filter-title {
    display: block;
    font-size: 1.05rem;
    font-weight: 700;
    color: #1a202c;
    margin-bottom: 16px;
    letter-spacing: -0.01em;
}

.filter-group > div {
    display: flex;
    align-items: center;
    padding: 10px 8px;
    border-radius: 10px;
    transition: all 0.3s ease;
    cursor: pointer;
    margin-bottom: 8px;
}

.filter-group > div:hover {
    background: #f9fafb;
}

.filter-group input[type="checkbox"] {
    width: 20px;
    height: 20px;
    margin-right: 12px;
    cursor: pointer;
    accent-color: #6366f1;
    border-radius: 6px;
}

.filter-group > div:has(input:checked) {
    background: #eef2ff;
    font-weight: 600;
}

/* ===== HOTEL LIST ===== */
.hotel-list {
    display: flex;
    flex-direction: column;
    gap: 24px;
}

/* ===== NO RESULT ===== */
.no-result {
    background: white;
    padding: 80px 40px;
    border-radius: 24px;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    animation: fadeIn 0.6s ease;
}

.no-result h3 {
    font-size: 2rem;
    font-weight: 700;
    color: #1a202c;
    margin-bottom: 16px;
}

.no-result p {
    font-size: 1.05rem;
    color: #6b7280;
    margin-bottom: 12px;
    line-height: 1.6;
}

.no-result strong {
    color: #6366f1;
    font-weight: 600;
}

/* ===== HOTEL CARD ===== */
.hotel-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    display: grid;
    grid-template-columns: 340px 1fr;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    animation: slideUp 0.6s ease;
}

.hotel-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 16px 40px rgba(0, 0, 0, 0.15);
}

/* Hotel Image */
.hotel-img-wrapper {
    position: relative;
    height: 100%;
    min-height: 280px;
    overflow: hidden;
    background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
}

.hotel-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
}

.hotel-card:hover .hotel-img {
    transform: scale(1.1);
}

/* Hotel Info */
.hotel-info {
    padding: 32px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 24px;
}

.hotel-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 16px;
    margin-bottom: 16px;
}

.hotel-name {
    font-size: 1.75rem;
    font-weight: 800;
    color: #1a202c;
    margin: 0;
    line-height: 1.3;
    letter-spacing: -0.02em;
    flex: 1;
}

.rating-box {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 8px 16px;
    background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
    color: white;
    border-radius: 12px;
    font-weight: 700;
    font-size: 1.1rem;
    box-shadow: 0 4px 12px rgba(251, 191, 36, 0.3);
    white-space: nowrap;
}

.rating-box i {
    font-size: 0.9rem;
}

.hotel-address {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 0.95rem;
    color: #6b7280;
    margin: 0 0 12px 0;
    line-height: 1.5;
}

.hotel-address i {
    color: #6366f1;
    flex-shrink: 0;
}

.amenities-preview {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    font-size: 0.9rem;
    color: #4b5563;
    margin: 0;
    line-height: 1.6;
}

.amenities-preview i {
    color: #6366f1;
    margin-top: 4px;
    flex-shrink: 0;
}

/* Hotel Footer */
.hotel-footer {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    gap: 24px;
    padding-top: 24px;
    border-top: 2px solid #f3f4f6;
}

.price-box {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.price-label {
    font-size: 0.8rem;
    color: #6b7280;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    font-weight: 600;
}

.price-value {
    font-size: 2.25rem;
    font-weight: 800;
    color: #6366f1;
    line-height: 1;
    letter-spacing: -0.02em;
}

.btn-detail {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 16px 32px;
    background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
    color: white;
    border-radius: 14px;
    font-size: 1.05rem;
    font-weight: 700;
    text-decoration: none;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 16px rgba(99, 102, 241, 0.3);
    white-space: nowrap;
    position: relative;
    overflow: hidden;
}

.btn-detail::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.2);
    transform: translate(-50%, -50%);
    transition: width 0.6s ease, height 0.6s ease;
}

.btn-detail:hover::before {
    width: 300px;
    height: 300px;
}

.btn-detail:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(99, 102, 241, 0.4);
}

.btn-detail i {
    transition: transform 0.3s ease;
    position: relative;
    z-index: 1;
}

.btn-detail:hover i {
    transform: translateX(4px);
}

/* ===== ANIMATIONS ===== */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* ===== RESPONSIVE ===== */
@media (max-width: 1200px) {
    .search-container {
        grid-template-columns: 260px 1fr;
        gap: 24px;
    }
    
    .hotel-card {
        grid-template-columns: 300px 1fr;
    }
}

@media (max-width: 1024px) {
    .search-container {
        grid-template-columns: 1fr;
    }
    
    .filter-sidebar {
        position: static;
        order: 2;
    }
    
    .hotel-list {
        order: 1;
    }
}

@media (max-width: 768px) {
    .search-container {
        padding: 0 20px;
        margin: 20px auto;
    }
    
    .hotel-card {
        grid-template-columns: 1fr;
    }
    
    .hotel-img-wrapper {
        min-height: 220px;
    }
    
    .hotel-info {
        padding: 24px;
    }
    
    .hotel-name {
        font-size: 1.4rem;
    }
    
    .hotel-footer {
        flex-direction: column;
        align-items: stretch;
        gap: 16px;
    }
    
    .btn-detail {
        width: 100%;
        justify-content: center;
    }
}

@media (max-width: 480px) {
    .hotel-header {
        flex-direction: column;
        gap: 12px;
    }
    
    .rating-box {
        align-self: flex-start;
    }
    
    .price-value {
        font-size: 1.75rem;
    }
}
</style>
</head>
<body>

	<jsp:include page="headerHome.jsp" />

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
				<p style="color: #718096;">Tìm thấy ${listHotels != null ? listHotels.size() : 0} chỗ nghỉ</p>
			</div>

			<c:if test="${empty listHotels}">
				<div class="no-result">
					<img src="https://cdn-icons-png.flaticon.com/512/6134/6134065.png"
						alt="No result"
						style="width: 80px; margin-bottom: 20px; opacity: 0.5;">
					<h3>Không tìm thấy khách sạn nào!</h3>
					<p>
						Rất tiếc, chúng tôi không tìm thấy chỗ nghỉ nào phù hợp với từ khóa 
						"<strong>${param.keyword}</strong>".
					</p>
					<p>Hãy thử tìm kiếm địa điểm khác hoặc kiểm tra lại chính tả.</p>
					<a href="view/index.jsp" class="btn-detail" style="margin-top: 15px;">Về trang chủ</a>
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
						<a href="hotel-detail?id=${h.hotelId}" class="btn-detail">
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
								<span class="price-label">Giá mỗi đêm từ</span> 
								<span class="price-value">
									<fmt:formatNumber value="${h.minPrice}" type="currency" 
										currencySymbol="₫" maxFractionDigits="0" />
								</span>
							</div>
							
								Xem phòng <i class="fas fa-arrow-right"></i>
						</div>
					</div>
				</div>
			</c:forEach>

		</main>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>