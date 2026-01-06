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
	background: rgba(255, 255, 255, 0.15);
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

@
keyframes scrollText { 0% {
	transform: translateX(-100%);
}

100


%
{
transform


:


translateX
(


100
%


)
;


}
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
		<div class="modal" id="loginModal">
			<div class="modal-content">
				<span class="modal-close" onclick="closeLoginModal()">&times;</span>

				<h2 class="modal-title">ĐĂNG NHẬP</h2>

				<button class="social-btn btn-google">
					<img
						src="${pageContext.request.contextPath}/images/logo_google.png"
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
						class="logo_apple-img" height="20" width="20"> Đăng nhập
					bằng Apple
				</button>

				<div class="divider">Hoặc</div>

				<form action="${pageContext.request.contextPath}/login"
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
					<img
						src="${pageContext.request.contextPath}/images/logo_google.png"
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
		<div class="header-main">
			<!-- LOGO -->
			<a href="index.jsp"> <img
				src="${pageContext.request.contextPath}/images/logo.png"
				class="logo-img">

			</a>
			<!-- WEATHER WIDGET -->
			<div class="weather-widget">
				<div class="weather-scroll" id="weatherText">Đang tải...</div>
			</div>

			<!-- USER ACTIONS -->
			<div class="user-actions">
				<button id="headerLoginBtn" class="btn-signin">ĐĂNG NHẬP</button>
				<button id="headerRegisterBtn" class="btn-register">TẠO TÀI
					KHOẢN</button>
			</div>
		</div>
	</header>

	<script>
	//Login Modal Functions
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
