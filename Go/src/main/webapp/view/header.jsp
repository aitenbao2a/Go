<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    height: 40px;
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
.weather-icon {
    width: 36px;
    height: 36px;
    object-fit: contain;
    flex-shrink: 0;
}
.weather-scroll {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    white-space: nowrap;
    animation: scrollText 12s linear infinite;
    flex-grow: 1; 
    margin-left: 36px;
}
@keyframes scrollText {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* ================= HERO (nếu cần) ================= */
.hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 60px 24px 120px;
    text-align: center;
    color: white;
}
.hero-title {
    font-size: 48px;
    font-weight: 700;
    margin-bottom: 16px;
}
.hero-subtitle {
    font-size: 20px;
    opacity: 0.95;
    margin-bottom: 40px;
}
</style>
</head>
<body>

<header class="header">
    <div class="header-main">
        <!-- LOGO -->
        <div class="logo" onclick="window.location.reload()">
            <img src="${pageContext.request.contextPath}/images/logo.png" class="logo-img">
            <div class="logo-text">GO</div>
        </div>

        <!-- WEATHER WIDGET -->
         <div class="weather-widget">
            <div class="weather-scroll" id="weatherText">Thành Phố Hồ Chí Minh - Trời nắng - 25C</div>
        </div>

        <!-- USER ACTIONS -->
        <div class="user-actions">
            <button id="headerLoginBtn" class="btn-signin">ĐĂNG NHẬP</button>
            <button id="headerRegisterBtn" class="btn-register">TẠO TÀI KHOẢN</button>
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
    const iconEl = document.getElementById("weatherIcon");

    try {
        const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&lang=vi&appid=${apiKey}`;
        const res = await fetch(url);
        if (!res.ok) throw new Error("API lỗi");
        const data = await res.json();

        const temp = Math.round(data.main.temp) + "°C";
        const desc = data.weather[0].description;

        textEl.innerText = `${temp} — ${desc} — ${city}`;
        iconEl.src = `https://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
    } catch (e) {
        textEl.innerText = "Không tải được dữ liệu";
        iconEl.src = "${pageContext.request.contextPath}/images/error.png";
    }
}

// Load ngay và auto refresh mỗi 15 giây
loadWeather();
setInterval(loadWeather, 15000);
</script>

</body>
</html>
