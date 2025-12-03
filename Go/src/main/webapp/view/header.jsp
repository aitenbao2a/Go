<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>

	<header class="header">
		<div class="header-main">
			<!-- LOGO -->
			<div class="logo" onclick="window.location.reload()">
				<img src="${pageContext.request.contextPath}/images/logo.png"
					class="logo-img">
				<div class="logo-text">GO</div>
			</div>

			<!-- WEATHER WIDGET -->
			<div class="weather-widget">
				<img id="weatherIcon" class="weather-icon"
					src="${pageContext.request.contextPath}/images/tm.png" alt="icon">
				<div class="weather-scroll" id="weatherText">Đang tải...</div>
			</div>

			<!-- USER ACTIONS -->
			<div class="user-actions">
				<button id="headerLoginBtn" class="btn-signin">Đăng nhập</button>
				<button id="headerRegisterBtn" class="btn-register">Đăng ký</button>
			</div>
		</div>
	</header>
	<script>
	async function loadWeather() {
	    const city = { name: "Ho Chi Minh", lat: 10.75, lon: 106.67 };
	    const url = `${window.location.origin}${contextPath}/weather?lat=${city.lat}&lon=${city.lon}`;

	    try {
	        const res = await fetch(url);
	        if (!res.ok) throw new Error("Server error " + res.status);
	        const data = await res.json();
	        const temp = Math.round(data.current_weather.temperature) + "°C";

	        document.getElementById("weatherText").innerText = `${temp} — ${city.name}`;
	        document.getElementById("weatherIcon").src = contextPath + "/images/tm.png";
	    } catch (e) {
	        console.error("Lỗi:", e);
	        document.getElementById("weatherText").innerText = "Không tải được dữ liệu";
	        document.getElementById("weatherIcon").src = contextPath + "/images/error.png";
	    }
	}
</script>
</body>
</html>