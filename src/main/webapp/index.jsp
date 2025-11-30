<%@page import="model.Hotel"%>
<%@page import="java.util.List"%>
<%@page import="dao.HotelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Agoda - Đặt phòng khách sạn</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<%
        String errorMsg = (String) request.getAttribute("errorMessage");
        String emailInput = (String) request.getAttribute("emailInput");
        if (errorMsg != null) {
    %>
        <script>
            // 1. Hiện thông báo
            alert("<%= errorMsg %>");
            
            // 2. Tự động mở lại modal để nhập lại
            window.addEventListener('load', function() {
                const modal = document.getElementById('login-modal');
                if(modal) {
                    modal.classList.add('active'); // Mở modal
                    // Điền lại email cũ cho tiện
                    const emailField = document.querySelector('input[name="email"]');
                    if(emailField) emailField.value = "<%= emailInput %>";
                }
            });
        </script>
    <%
        }
    %>
    <jsp:include page="fragments/header.jsp" />

    <section class="hero">
        <h1 class="hero-title">Tìm nơi ở tiếp theo của bạn</h1>
        <p class="hero-subtitle">Khám phá ưu đãi tại khách sạn, nhà và nhiều hơn nữa...</p>
    </section>

    <div class="search-container">
        <div class="agoda-search-box">
            <div class="tabs">
                <button class="tab active">🏨 Khách sạn</button>
                <button class="tab">🏠 Nhà & Căn hộ</button>
            </div>

            <form action="index.jsp" method="GET">
                <div class="search-row">
                    <div class="search-field">
                        <label>Điểm đến</label>
                        <input type="text" name="keyword" placeholder="Nhập điểm du lịch hoặc tên khách sạn">
                    </div>
                    <div class="search-field">
                        <label>Nhận phòng</label>
                        <input type="date" name="checkinDate" id="checkinDate">
                    </div>
                    <div class="search-field">
                        <label>Trả phòng</label>
                        <input type="date" name="checkoutDate" id="checkoutDate">
                    </div>
                    <div class="search-field">
                        <label>Khách</label>
                        <select>
                            <option>2 người lớn · 1 phòng</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="search-btn">TÌM KIẾM</button>
            </form>
        </div>
    </div>

    <main class="main-content" id="hotels-section">
        <h2 class="section-title">Khách sạn nổi bật tại Việt Nam</h2>
        <div class="hotels-grid">
            <%
            try {
                dao.HotelDAO dao = new dao.HotelDAO();
                List<model.Hotel> hotels = dao.getAllHotels();

                if (hotels == null || hotels.isEmpty()) {
            %>
                    <div style="grid-column: 1/-1; text-align:center; padding:20px; color:red;">
                        <h3>⚠️ Không có dữ liệu!</h3>
                        <p>Vui lòng kiểm tra Database.</p>
                    </div>
            <%
                } else {
                    for (model.Hotel h : hotels) {
            %>
                    <div class="hotel-card">
                        <div class="hotel-image" style="background-image: url('images/<%= h.getImageIcon() %>');">
                             <% if(h.getDiscount() > 0) { %>
                                <span class="discount-badge">-<%= h.getDiscount() %>%</span>
                             <% } %>
                        </div>
                        <div class="hotel-details">
                            <div class="hotel-name"><%= h.getName() %></div>
                            <div class="hotel-rating">
                                <% for(int i=0; i<h.getStars(); i++) { %> <i class="fa-solid fa-star"></i> <% } %>
                            </div>
                            <div class="hotel-location">📍 <%= h.getLocation() %></div>
                            <div class="hotel-footer">
                                <div class="review-info">
                                    <span class="score"><%= h.getScore() %></span>
                                    <span>(<%= h.getReviewCount() %> đánh giá)</span>
                                </div>
                                <div class="price-info">
                                    <div class="price"><%= h.getPriceFormatted() %> ₫</div>
                                </div>
                            </div>
                        </div>
                    </div>
            <%
                    }
                }
            } catch (Exception e) {
            %>
                <div style="grid-column: 1/-1; color: red;">Lỗi: <%= e.getMessage() %></div>
            <% } %>
        </div>
    </main>
	
    <jsp:include page="fragments/modal_login.jsp" />
    
    <jsp:include page="fragments/footer.jsp" />

<script type="text/javascript">
        // Hàm mở modal (Được gọi từ nút Đăng nhập ở Header)
        function openModal() {
            console.log("Đang gọi hàm openModal..."); // Kiểm tra xem nút có hoạt động không
            
            var modal = document.getElementById("login-modal");
            if (modal) {
                modal.style.display = "flex"; // Ép hiển thị bằng CSS inline
                modal.classList.add("active");
                console.log("Đã tìm thấy modal và mở lên!");
            } else {
                alert("LỖI: Không tìm thấy thẻ có id='login-modal'. Hãy kiểm tra file modal_login.jsp!");
            }
        }

        // Hàm đóng modal
        function closeModal() {
            var modal = document.getElementById("login-modal");
            if (modal) {
                modal.style.display = "none";
                modal.classList.remove("active");
            }
        }

        // Bấm ra ngoài thì đóng
        window.onclick = function(event) {
            var modal = document.getElementById("login-modal");
            if (event.target == modal) {
                closeModal();
            }
        }
    <script src="js/script.js"></script>
    <script>
        // Script xử lý ngày tháng
        const checkinInput = document.getElementById("checkinDate");
        const checkoutInput = document.getElementById("checkoutDate");
        if(checkinInput) {
            const today = new Date().toISOString().split('T')[0];
            checkinInput.setAttribute("min", today);
            checkinInput.addEventListener("change", function() {
                if (this.value) {
                    const nextDay = new Date(new Date(this.value).getTime() + 86400000);
                    checkoutInput.setAttribute("min", nextDay.toISOString().split('T')[0]);
                }
            });
        }
    </script>
</body>
</html>