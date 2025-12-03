<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/login.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap')
	;

body {
	margin: 0;
	padding: 0;
	font-family: 'Poppins', sans-serif;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #667eea, #764ba2);
}

.container {
	width: 380px;
	padding: 40px;
	border-radius: 25px;
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(12px);
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
	color: white;
	text-align: center;
	animation: fadeIn 0.7s ease;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h2 {
	margin-bottom: 25px;
	font-size: 32px;
	font-weight: 600;
	letter-spacing: 1px;
}

.input-box {
	width: 100%;
	margin: 15px 0;
}

input {
	width: 100%;
	padding: 14px;
	border-radius: 12px;
	background: rgba(255, 255, 255, 0.2);
	border: none;
	outline: none;
	font-size: 16px;
	color: #fff;
	transition: 0.3s;
}

input::placeholder {
	color: #eee;
}

input:focus {
	background: rgba(255, 255, 255, 0.3);
}

.btn {
	width: 100%;
	padding: 14px;
	margin-top: 15px;
	background: linear-gradient(135deg, #43cea2, #185a9d);
	border: none;
	color: #fff;
	font-size: 18px;
	font-weight: bold;
	border-radius: 12px;
	cursor: pointer;
	transition: 0.3s;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.social-box {
	margin-top: 25px;
	display: flex;
	justify-content: space-around;
}

.social-btn {
	width: 50px;
	height: 50px;
	background: rgba(255, 255, 255, 0.2);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	transition: 0.3s;
	text-decoration: none;
	color: white;
}

.social-btn:hover {
	background: rgba(255, 255, 255, 0.4);
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.social-btn svg {
	width: 24px;
	height: 24px;
}

.social-title {
	width: 100%;
	margin-bottom: 10px;
	text-align: center;
	font-size: 14px;
	opacity: 0.9;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Đăng nhập</h2>

		<!-- FORM ĐĂNG NHẬP THƯỜNG -->
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div class="input-box">
				<input type="text" name="username" placeholder="Tên đăng nhập"
					required>
			</div>
			<div class="input-box">
				<input type="password" name="password" placeholder="Mật khẩu"
					required>
			</div>
			<button class="btn" type="submit">Đăng nhập</button>
		</form>

		<div class="social-title">Hoặc đăng nhập bằng</div>
		<div class="social-box">
			<!-- GOOGLE -->
			<a class="social-btn"
				href="${pageContext.request.contextPath}/index.jsp"
				onclick="googleSignIn(event)"> <svg
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 488 512">
					<path fill="#fff"
						d="M488 261.8c0-17.8-1.6-35-4.6-51.6H249v97.8h134.4c-5.8 31-23.3 57.3-49.5 75v62.4h79.8c46.8-43 73.3-106.4 73.3-183.6z" /></svg>
			</a>
			<!-- FACEBOOK -->
			<a class="social-btn"
				href="${pageContext.request.contextPath}/index.jsp"
				onclick="facebookSignIn()"> <svg
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
					<path fill="#fff"
						d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.3 44.38-121.3 124.72v70.62H22.89V288h81.17v224h100.2V288z" /></svg>
			</a>
			<!-- GITHUB -->
			<a class="social-btn"
				href="${pageContext.request.contextPath}/index.jsp"
				onclick="githubSignIn()"> <svg
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512">
					<path fill="#fff"
						d="M165.9 397.4c0 2-2.3 3.7-5.2 3.7-2.9 0-5.2-1.6-5.2-3.7 0-2 2.3-3.7 5.2-3.7 2.9 0 5.2 1.6 5.2 3.7zm-31.1-8.3c-.7 1.5-2.7 2-4.4 1-1.7-1-2.3-2.7-1.6-4.2.7-1.5 2.7-2 4.4-1 1.7.9 2.3 2.7 1.6 4.2zM248 8C111 8 0 119 0 256c0 110.5 71.6 204.3 171 237.2 12.5 2.3 17-5.4 17-12 0-5.9-.2-21.5-.3-42.3-69.6 15.1-84.3-33.6-84.3-33.6-11.4-29-27.8-36.7-27.8-36.7-22.7-15.5 1.7-15.2 1.7-15.2 25.1 1.8 38.3 25.7 38.3 25.7 22.3 38.2 58.5 27.2 72.8 20.8 2.3-16.2 8.7-27.2 15.8-33.5-55.5-6.3-113.8-27.7-113.8-123.3 0-27.3 9.8-49.7 25.9-67.2-2.6-6.3-11.2-31.6 2.5-65.9 0 0 21-6.7 68.8 25.7 20-5.6 41.5-8.3 62.9-8.4 21.3.1 42.9 2.8 62.9 8.4 47.8-32.4 68.8-25.7 68.8-25.7 13.7 34.3 5.1 59.6 2.5 65.9 16.1 17.5 25.9 39.9 25.9 67.2 0 95.8-58.4 117-114 123.1 8.9 7.7 16.8 22.9 16.8 46.2 0 33.4-.3 60.3-.3 68.5 0 6.7 4.5 14.5 17.1 12C424.4 460.3 496 366.5 496 256 496 119 385 8 248 8z" /></svg>
			</a>
			<!-- LINKEDIN -->
			<a class="social-btn"
				href="${pageContext.request.contextPath}/index.jsp"
				onclick="linkedinSignIn()"> <svg
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
					<path fill="#fff"
						d="M100.28 448H7.4V148.9h92.88zm-46.44-340a53.89 53.89 0 1 1 53.89-53.89 53.88 53.88 0 0 1-53.88 53.88zM447.9 448h-92.4V302.4c0-34.7-.7-79.2-48.3-79.2-48.3 0-55.7 37.7-55.7 76.6V448h-92.6V148.9h88.9v40.8h1.3c12.4-23.5 42.6-48.3 87.7-48.3 93.8 0 111.1 61.8 111.1 142.3V448z" /></svg>
			</a>
		</div>
	</div>

	<!-- GOOGLE SDK -->
	<script src="https://accounts.google.com/gsi/client" async defer></script>

	<!-- FACEBOOK SDK -->
	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>
