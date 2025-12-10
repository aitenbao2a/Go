<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<style>

.form-container-wrapper {
    display: flex;
    justify-content: center; 
    align-items: center;   
    min-height: calc(100vh - 100px); 
    background: linear-gradient(135deg, #f0f4f8 0%, #e8edf3 100%);
    padding: 30px 20px; 
    box-sizing: border-box; 
}

/* Khối form card */
.auth-card { 
    background: white;
    border-radius: 24px;
    padding: 40px;
    max-width: 480px;
    width: 90%;
    position: relative;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
    transition: opacity 0.4s ease, transform 0.4s ease;
}

/* Ẩn/Hiện form */
.form-hidden {
    display: none !important; 
}
.modal-title {
    font-size: 2rem;
    font-weight: 800;
    background: linear-gradient(90deg, #00c6ff, #0072ff); 
    -webkit-background-clip: text;
    color: transparent;
    text-align: center;
    margin-bottom: 12px;
    letter-spacing: 1px;
}

.divider {
    text-align: center;
    margin: 25px 0;
    color: #a0aec0;
    position: relative;
}

.divider::before,
.divider::after {
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

.form-label {
    display: block;
    margin-bottom: 6px;
    font-weight: 600;
    color: #4a5568;
    font-size: 0.95rem;
}

.form-input {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #e2e8f0;
    border-radius: 12px;
    font-size: 1rem;
    box-sizing: border-box; 
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-input:focus {
    border-color: #667eea;
    outline: none;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);
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


.btn-continue {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />

    <div class="form-container-wrapper">
        
        <div class="auth-card" id="loginFormCard">
            <h2 class="modal-title">ĐĂNG NHẬP</h2>

            <button class="social-btn btn-google">
                <img src="${pageContext.request.contextPath}/images/logo_google.png"
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
                    class="logo_apple-img" height="20" width="20"> Đăng nhập bằng
                Apple
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
                <a href="#" onclick="showRegister(event)"
                    style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
                    Quên mật khẩu? </a>
                <a href="#" onclick="showRegister(event)"
                    style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
                    Tạo tài khoản </a>
            </div>

        </div>

        <div class="auth-card form-hidden" id="registerFormCard">
            <h2 class="modal-title">TẠO TÀI KHOẢN</h2>
            
            <button class="social-btn btn-google">
                <img src="${pageContext.request.contextPath}/images/logo_google.png"
                    class="logo_google-img" height="20" width="20" viewBox="0 0 18 18">
                Đăng ký bằng Google
            </button>
            <button class="social-btn btn-facebook">
                <img
                    src="${pageContext.request.contextPath}/images/logo_facebook.webp"
                    class="logo_facebook-img" height="20" width="20"
                    viewBox="0 0 18 18"> Đăng ký bằng Facebook
            </button>
            <button class="social-btn btn-apple">
                <img src="${pageContext.request.contextPath}/images/logo_apple.png"
                    class="logo_apple-img" height="20" width="20" viewBox="0 0 18 18">
                Đăng ký bằng Apple
            </button>
            
            <div class="divider">Hoặc</div>

            <form action="${pageContext.request.contextPath}/register" method="post">
                 <div class="form-group">
                    <label class="form-label">Tên đầy đủ</label> <input type="text"
                        class="form-input" name="fullName" placeholder="Nguyễn Văn A"
                        required>
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label> <input type="email"
                        class="form-input" name="email" placeholder="id@email.com"
                        required>
                </div>
                <div class="form-group">
                    <label class="form-label">Mật khẩu</label> <input type="password"
                        class="form-input" name="password" placeholder="Nhập mật khẩu (ít nhất 8 ký tự)"
                        required>
                </div>
                <button type="submit" class="btn-continue">Tạo tài khoản</button>
            </form>

            <div style="text-align: center; margin-top: 20px;">
                <a href="#" onclick="showLogin(event)"
                    style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">
                    Đã có tài khoản? Đăng nhập </a>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />

	<script>
    // CLEAN CODE: Khai báo biến
    const loginCard = document.getElementById('loginFormCard');
    const registerCard = document.getElementById('registerFormCard');
    const headerLoginBtn = document.getElementById('headerLoginBtn'); 

    /**
     * Hiển thị Form Đăng nhập và ẩn Form Đăng ký
     * @param {Event} [event] - Sự kiện click (nếu có)
     */
    function showLogin(event) {
        if(event) event.preventDefault();
        registerCard.classList.add('form-hidden');
        loginCard.classList.remove('form-hidden');
    }

    /**
     * Hiển thị Form Đăng ký và ẩn Form Đăng nhập
     * @param {Event} [event] - Sự kiện click (nếu có)
     */
    function showRegister(event) {
        if(event) event.preventDefault();
        loginCard.classList.add('form-hidden');
        registerCard.classList.remove('form-hidden');
    }
    
    // Sự kiện: Khi ấn nút Đăng nhập trên Header (Giả sử headerLoginBtn tồn tại)
    if (headerLoginBtn) {
        headerLoginBtn.addEventListener('click', (event) => {
            showLogin(event);
        });
    }
	</script>

</body>
</html>