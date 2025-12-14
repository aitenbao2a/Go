<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<style>
.header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    position: sticky;
    top: 0;
    z-index: 1000;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    padding: 0 24px;
}
.header-main {
    display: flex;
    align-items: center;
    gap: 20px;
    height: 70px;
}
.logo {
    display: flex;
    align-items: center;
    cursor: pointer;
}
.logo-img {
    height: 35px;
    width: auto;
    transform: scale(2);
    margin-right: 10px;
}
.logo-text {
    font-size: 32px;
    font-weight: 700;
    letter-spacing: -1px;
}
.user-actions {
    display: flex;
    gap: 16px;
    align-items: center;
    position: relative;
}
.btn-signin, .btn-register {
    padding: 10px 24px;
    border-radius: 24px;
    border: 2px solid white;
    background: transparent;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}
.btn-register {
    background: white;
    color: #667eea;
}
.btn-signin:hover {
    background: white;
    color: #667eea;
}
.btn-register:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3);
}

/* User Info Display - nằm ngang */
.user-info-wrapper {
    position: relative;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 6px 16px 6px 6px;
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(4px);
    border-radius: 24px;
    cursor: pointer;
    transition: all 0.3s;
}

.user-info:hover {
    background: rgba(255,255,255,0.3);
}

.user-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: white;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #667eea;
    font-weight: 700;
    font-size: 16px;
    flex-shrink: 0;
}

.user-name {
    font-weight: 600;
    font-size: 15px;
    color: white;
    max-width: 150px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

/* Dropdown Menu */
.user-dropdown {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
    min-width: 280px;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-10px);
    transition: all 0.3s ease;
    z-index: 1001;
}

.user-dropdown.show {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
}

.dropdown-header {
    padding: 20px;
    border-bottom: 1px solid #e2e8f0;
}

.dropdown-user-info {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
}

.dropdown-avatar {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 700;
    font-size: 20px;
}

.dropdown-user-details {
    flex: 1;
}

.dropdown-user-name {
    font-weight: 700;
    font-size: 16px;
    color: #1a202c;
    margin-bottom: 4px;
}

.dropdown-user-email {
    font-size: 13px;
    color: #718096;
}

.dropdown-menu {
    padding: 8px 0;
}

.dropdown-item {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 20px;
    color: #2d3748;
    text-decoration: none;
    transition: background 0.2s;
    cursor: pointer;
}

.dropdown-item:hover {
    background: #f7fafc;
}

.dropdown-item-icon {
    font-size: 18px;
    width: 24px;
    text-align: center;
}

.dropdown-item-text {
    flex: 1;
    font-size: 14px;
    font-weight: 500;
}

.dropdown-divider {
    height: 1px;
    background: #e2e8f0;
    margin: 8px 0;
}

.dropdown-item.logout {
    color: #e53e3e;
    border-top: 1px solid #e2e8f0;
    margin-top: 8px;
}

.dropdown-item.logout:hover {
    background: #fff5f5;
}

.weather-widget {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 8px 12px;
    border-radius: 12px;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(4px);
    overflow: hidden;
    flex-grow: 1; 
    margin-left: 20px;
}

.weather-scroll {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
    animation: scrollText 12s linear infinite;
    flex-grow: 1; 
}

@keyframes scrollText {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}
</style>
</head>
<body>

<%
    // Lấy user từ session
    model.User user = (model.User) session.getAttribute("user");
    String displayName = "";
    String userEmail = "";
    String avatarLetter = "?";
    
    if (user != null) {
        userEmail = user.getEmail() != null ? user.getEmail() : "";
        
        // Nếu có fullName thì dùng fullName, không thì dùng email
        if (user.getFullName() != null && !user.getFullName().trim().isEmpty()) {
            displayName = user.getFullName();
        } else {
            displayName = userEmail;
        }
        
        // Lấy chữ cái đầu
        if (!displayName.isEmpty()) {
            avatarLetter = displayName.substring(0, 1).toUpperCase();
        }
    }
    
    request.setAttribute("user", user);
    request.setAttribute("displayName", displayName);
    request.setAttribute("userEmail", userEmail);
    request.setAttribute("avatarLetter", avatarLetter);
%>

<header class="header">
    <div class="header-main">
        <!-- LOGO -->
        <a href="${pageContext.request.contextPath}/view/home.jsp"> 
            <img src="${pageContext.request.contextPath}/images/logo.png" class="logo-img">
        </a>
        
        <!-- WEATHER WIDGET -->
        <div class="weather-widget">
            <div class="weather-scroll" id="weatherText">Đang tải...</div>
        </div>

        <!-- USER ACTIONS -->
        <div class="user-actions">
            <% if (user != null) { %>
                <!-- User đã đăng nhập -->
                <div class="user-info-wrapper">
                    <div class="user-info" id="userInfoBtn" title="<%= displayName %>">
                        <div class="user-avatar"><%= avatarLetter %></div>
                        <span class="user-name"><%= displayName %></span>
                    </div>
                    
                    <!-- Dropdown Menu -->
                    <div class="user-dropdown" id="userDropdown">
                        <div class="dropdown-header">
                            <div class="dropdown-user-info">
                                <div class="dropdown-avatar"><%= avatarLetter %></div>
                                <div class="dropdown-user-details">
                                    <div class="dropdown-user-name"><%= displayName %></div>
                                    <div class="dropdown-user-email"><%= userEmail %></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/view/editProfile.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">👤</span>
                                <span class="dropdown-item-text">Tài khoản của tôi</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/bookings.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">📋</span>
                                <span class="dropdown-item-text">Đơn đặt chỗ</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">🔔</span>
                                <span class="dropdown-item-text">Tin nhắn từ chỗ nghỉ</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/rewards.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">💰</span>
                                <span class="dropdown-item-text">Tiền Go</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">💳</span>
                                <span class="dropdown-item-text">Thưởng hoàn tiền mặt</span>
                            </a>
                            
                            <div class="dropdown-divider"></div>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">❤️</span>
                                <span class="dropdown-item-text">Danh sách yêu thích</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">⭐</span>
                                <span class="dropdown-item-text">Nhận xét của tôi</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">🎁</span>
                                <span class="dropdown-item-text">PointsMAX</span>
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/view/support.jsp" class="dropdown-item">
                                <span class="dropdown-item-icon">💬</span>
                                <span class="dropdown-item-text">Hỗ trợ của tôi</span>
                            </a>
                            
                            <div class="dropdown-item logout" onclick="logout()">
                                <span class="dropdown-item-icon">🚪</span>
                                <span class="dropdown-item-text">THOÁT</span>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else { %>
                <!-- User chưa đăng nhập -->
                <button id="headerLoginBtn" class="btn-signin">ĐĂNG NHẬP</button>
                <button id="headerRegisterBtn" class="btn-register">TẠO TÀI KHOẢN</button>
            <% } %>
        </div>
    </div>
</header>

<script>
// ================= WEATHER JS =================
const apiKey = "e11b1d25626ae44cadbdee1348b080d0";
const cities = ["Ho Chi Minh", "Hanoi", "Da Nang", "Hai Phong", "Can Tho", "Nha Trang", "Hue"];

function getRandomCity() {
    return cities[Math.floor(Math.random() * cities.length)];
}

async function loadWeather() {
    const city = getRandomCity();
    const textEl = document.getElementById("weatherText");

    try {
        const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&lang=vi&appid=${apiKey}`;
        const res = await fetch(url);
        if (!res.ok) throw new Error("API lỗi");
        const data = await res.json();

        const temp = Math.round(data.main.temp) + "°C";
        const desc = data.weather[0].description;

        textEl.innerText = `${temp} — ${desc} — ${city}`;
    } catch (e) {
        textEl.innerText = "Không tải được dữ liệu";
    }
}

// Load ngay và auto refresh mỗi 15 giây
loadWeather();
setInterval(loadWeather, 15000);

// ================= USER DROPDOWN =================
const userInfoBtn = document.getElementById('userInfoBtn');
const userDropdown = document.getElementById('userDropdown');

if (userInfoBtn && userDropdown) {
    // Toggle dropdown khi click vào user info
    userInfoBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        userDropdown.classList.toggle('show');
    });
    
    // Đóng dropdown khi click ra ngoài
    document.addEventListener('click', (e) => {
        if (!userDropdown.contains(e.target) && !userInfoBtn.contains(e.target)) {
            userDropdown.classList.remove('show');
        }
    });
    
    // Ngăn dropdown đóng khi click vào bên trong
    userDropdown.addEventListener('click', (e) => {
        e.stopPropagation();
    });
}

// ================= LOGOUT FUNCTION =================
function logout() {
    if (confirm('Bạn có chắc chắn muốn đăng xuất?')) {
        window.location.href = '${pageContext.request.contextPath}/logout';
    }
}
</script>

</body>
</html>