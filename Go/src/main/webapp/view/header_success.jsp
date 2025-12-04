<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css">
</head>
<body>

<header class="header">
    <div class="header-main">
        <!-- LOGO -->
        <div class="logo" onclick="window.location.reload()">
            <img src="<%= request.getContextPath() %>/images/logo.png" class="logo-img">
            <div class="logo-text">GO</div>
        </div>

        <!-- WEATHER WIDGET -->
        <div class="weather-widget">
            <img id="weatherIcon" class="weather-icon"
                src="<%= request.getContextPath() %>/images/tm.png" alt="icon">
            <div class="weather-scroll" id="weatherText">Đang tải...</div>
        </div>

        <!-- USER ACTIONS -->
        <div class="user-actions">
            <%
                String username = (String) session.getAttribute("user");
                if (username != null) {
            %>
            <div class="user-greeting">
                Xin chào, <%= username %>!
            </div>
            <form action="<%= request.getContextPath() %>/logout" method="post">
                <button class="btn-logout">Đăng xuất</button>
            </form>
            <%
                } else {
            %>
            <button id="headerLoginBtn" class="btn-signin">Đăng nhập</button>
            <button id="headerRegisterBtn" class="btn-register">Đăng ký</button>
            <%
                }
            %>
        </div>
    </div>
</header>

<!-- JS section -->
<script>
    // Demo JS: hiện weather tạm thời để tránh lỗi fetch
    document.addEventListener("DOMContentLoaded", function() {
        const weatherText = document.getElementById("weatherText");
        const weatherIcon = document.getElementById("weatherIcon");

        // Thay "Đang tải..." bằng dữ liệu tĩnh (sau này bạn có thể fetch API)
        weatherText.innerText = "30°C — Ho Chi Minh";
        weatherIcon.src = "<%= request.getContextPath() %>/images/tm.png";
    });
</script>

</body>
</html>
