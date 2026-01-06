<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
:root {
    --primary: #6366f1;
    --primary-soft: #eef2ff;
    --gray-100: #f9fafb;
    --gray-200: #f3f4f6;
    --gray-400: #9ca3af;
    --gray-600: #4b5563;
    --gray-800: #1f2937;
}

/* Layout */
.search-container {
    max-width: 1280px;
    margin: 36px auto 60px;
    padding: 0 20px;
    display: grid;
    grid-template-columns: 280px 1fr;
    gap: 28px;
}

/* Sidebar */
.filter-sidebar {
    background: #fff;
    border-radius: 18px;
    padding: 22px 20px;
    box-shadow: 0 6px 22px rgba(0,0,0,.06);
}

.filter-title {
    display: block;
    font-weight: 700;
    margin-bottom: 12px;
    color: var(--gray-800);
}

.filter-group {
    margin-bottom: 18px;
    padding-bottom: 14px;
    border-bottom: 1px solid var(--gray-200);
}

.filter-group:last-child {
    margin-bottom: 0;
    border-bottom: 0;
}

.filter-group div {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 6px 6px;
    border-radius: 10px;
    cursor: pointer;
    transition: .25s;
}

.filter-group div:hover {
    background: var(--gray-100);
}

.filter-group input {
    accent-color: var(--primary);
}

/* Hotel List */
.hotel-list {
    display: flex;
    flex-direction: column;
    gap: 18px;
}

.hotel-card {
    display: grid;
    grid-template-columns: 320px 1fr;
    background: white;
    border-radius: 18px;
    overflow: hidden;
    box-shadow: 0 8px 22px rgba(0,0,0,.08);
    transition: .35s;
}

.hotel-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 18px 36px rgba(0,0,0,.12);
}

.hotel-img-wrapper {
    background: var(--primary-soft);
}

.hotel-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

/* Info */
.hotel-info {
    padding: 22px 24px;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.hotel-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

.hotel-name {
    margin: 0;
    font-size: 1.4rem;
    font-weight: 800;
}

.rating-box {
    padding: 6px 12px;
    background: linear-gradient(135deg,#fbbf24,#f59e0b);
    color: #fff;
    border-radius: 10px;
    font-weight: 700;
}

.hotel-address,
.amenities-preview {
    margin: 0;
    color: var(--gray-600);
    font-size: .95rem;
}

/* Footer */
.hotel-footer {
    margin-top: auto;
    padding-top: 14px;
    border-top: 1px solid var(--gray-200);
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.price-value {
    color: var(--primary);
    font-size: 1.9rem;
    font-weight: 800;
}

.btn-detail {
    padding: 12px 20px;
    background: linear-gradient(135deg,#6366f1,#7c3aed);
    color: #fff;
    border-radius: 12px;
    text-decoration: none;
    font-weight: 700;
    transition: .25s;
}

.btn-detail:hover {
    opacity: .9;
}

/* No results */
.no-result {
    padding: 60px 30px;
    background: #fff;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 8px 22px rgba(0,0,0,.08);
}

/* Responsive */
@media (max-width: 1024px) {
    .search-container { grid-template-columns: 1fr; }
    .filter-sidebar { order: 2; }
}

@media (max-width: 768px) {
    .hotel-card { grid-template-columns: 1fr; }
    .hotel-img-wrapper { height: 220px; }
}
</style>
</head>

<body>

<jsp:include page="headerHome.jsp" />

<div class="search-container">

    <!-- SIDEBAR -->
    <aside class="filter-sidebar">
        <div class="filter-group">
            <span class="filter-title">Hạng sao</span>
            <div><input type="checkbox"> 5 sao</div>
            <div><input type="checkbox"> 4 sao</div>
            <div><input type="checkbox"> 3 sao</div>
        </div>

        <div class="filter-group">
            <span class="filter-title">Tiện ích</span>
            <div><input type="checkbox"> Wifi miễn phí</div>
            <div><input type="checkbox"> Hồ bơi</div>
            <div><input type="checkbox"> Bãi đỗ xe</div>
        </div>
    </aside>

    <!-- MAIN -->
    <main class="hotel-list">

        <div>
            <h2>Kết quả tìm kiếm: “${param.keyword}”</h2>
            <p style="color:#6b7280">
                Tìm thấy ${listHotels != null ? listHotels.size() : 0} chỗ nghỉ
            </p>
        </div>

        <c:if test="${empty listHotels}">
            <div class="no-result">
                <h3>Không tìm thấy chỗ nghỉ phù hợp</h3>
                <p>Vui lòng thử từ khóa khác hoặc chỉnh lại bộ lọc.</p>
                <a href="view/index.jsp" class="btn-detail">Về trang chủ</a>
            </div>
        </c:if>

        <c:forEach var="h" items="${listHotels}">
            <div class="hotel-card">

                <div class="hotel-img-wrapper">
                    <c:set var="imageArray" value="${fn:split(h.images, ',')}"/>
                    <c:set var="firstImage"
                           value="${(not empty imageArray) ? imageArray[0] : 'https://via.placeholder.com/400x260'}"/>
                    <img src="${firstImage}" class="hotel-img">
                </div>

                <div class="hotel-info">

                    <div class="hotel-header">
                        <h3 class="hotel-name">${h.hotelName}</h3>
                        <div class="rating-box">${h.starRating} ★</div>
                    </div>

                    <p class="hotel-address">
                        ${h.address}<c:if test="${not empty h.city}">, ${h.city}</c:if>
                    </p>

                    <p class="amenities-preview">${h.amenities}</p>

                    <div class="hotel-footer">
                        <div>
                            <span>Giá từ</span><br>
                            <span class="price-value">
                                <fmt:formatNumber value="${h.minPrice}" type="currency" currencySymbol="₫"
                                                  maxFractionDigits="0"/>
                            </span>
                        </div>

                        <a href="hotel-detail?id=${h.hotelId}" class="btn-detail">
                            Xem phòng
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
