<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<style>
/* Page background */
.page-background {
    min-height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    position: relative;
    overflow: hidden;
}

.page-background::before {
    content: '';
    position: absolute;
    top: -50%;
    right: -50%;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
    animation: float 15s ease-in-out infinite;
}

.page-background::after {
    content: '';
    position: absolute;
    bottom: -50%;
    left: -50%;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, rgba(255,255,255,0.08) 0%, transparent 70%);
    animation: float 20s ease-in-out infinite reverse;
}

/* Modal container - for popup modals */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    backdrop-filter: blur(8px);
    z-index: 1000;
    align-items: center;
    justify-content: center;
    animation: fadeIn 0.3s ease;
}

.modal.active {
    display: flex;
}

/* Form container - for default centered layout */
.form-container-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 160px);
    padding: 80px 20px;
    box-sizing: border-box;
    position: relative;
    z-index: 1;
}

/* Khối form card */
.auth-card {
    background: white;
    border-radius: 24px;
    padding: 40px;
    max-width: 480px;
    width: 90%;
    position: relative;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
    transition: all 0.4s ease;
    animation: slideUp 0.6s cubic-bezier(0.4, 0, 0.2, 1);
}

.auth-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.35);
}

.modal-content {
    background: white;
    border-radius: 24px;
    padding: 40px;
    max-width: 500px;
    width: 90%;
    max-height: 90vh;
    overflow-y: auto;
    position: relative;
    animation: slideUp 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
}

.modal-close {
    position: absolute;
    top: 20px;
    right: 25px;
    font-size: 32px;
    font-weight: 300;
    color: #a0aec0;
    cursor: pointer;
    transition: color 0.3s ease;
    line-height: 1;
}

.modal-close:hover {
    color: #4a5568;
}

.modal-title {
    font-size: 2rem;
    font-weight: 800;
    background: linear-gradient(90deg, #00c6ff, #0072ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
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
        transform: translateY(50px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

@keyframes float {
    0%, 100% {
        transform: translate(0, 0) rotate(0deg);
    }
    33% {
        transform: translate(30px, -30px) rotate(120deg);
    }
    66% {
        transform: translate(-20px, 20px) rotate(240deg);
    }
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="page-background">
    <!-- Login Form - Default Display -->
    <div class="form-container-wrapper">
        <div class="auth-card">
            <h2 class="modal-title">ĐĂNG NHẬP</h2>
            
            <button class="social-btn btn-google">
                <img src="${pageContext.request.contextPath}/images/logo_google.png"
                    class="logo_google-img" height="20" width="20"> Đăng nhập bằng Google
            </button>
            
            <button class="social-btn btn-facebook">
                <img src="${pageContext.request.contextPath}/images/logo_facebook.webp"
                    class="logo_facebook-img" height="20" width="20"> Đăng nhập bằng Facebook
            </button>
            
            <button class="social-btn btn-apple">
                <img src="${pageContext.request.contextPath}/images/logo_apple.png"
                    class="logo_apple-img" height="20" width="20"> Đăng nhập bằng Apple
            </button>
            
            <div class="divider">Hoặc</div>
            
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-input" name="email" placeholder="id@email.com" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Mật khẩu</label>
                    <input type="password" class="form-input" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                
                <button type="submit" class="btn-continue">Đăng nhập</button>
            </form>
            
            <div style="display: flex; justify-content: center; margin-top: 20px; gap: 30px;">
                <a href="login_error_login.jsp" style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">Quên mật khẩu?</a>
                <a href="#" id="headerRegisterBtn" style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">Tạo tài khoản</a>
            </div>
        </div>
    </div>
</div>

<!-- Register Modal -->
<div class="modal" id="registerModal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeLoginModal('register')">&times;</span>
        <h2 class="modal-title">TẠO TÀI KHOẢN</h2>
        
        <button class="social-btn btn-google">
            <img src="${pageContext.request.contextPath}/images/logo_google.png"
                class="logo_google-img" height="20" width="20"> Đăng nhập bằng Google
        </button>
        
        <button class="social-btn btn-facebook">
            <img src="${pageContext.request.contextPath}/images/logo_facebook.webp"
                class="logo_facebook-img" height="20" width="20"> Đăng nhập bằng Facebook
        </button>
        
        <button class="social-btn btn-apple">
            <img src="${pageContext.request.contextPath}/images/logo_apple.png"
                class="logo_apple-img" height="20" width="20"> Đăng nhập bằng Apple
        </button>
        
        <div class="divider">Hoặc</div>
        
        <form>
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" class="form-input" name="email" placeholder="id@email.com" required>
            </div>
            <div class="form-group">
                <label class="form-label">Mật khẩu</label>
                <input type="password" class="form-input" name="password" placeholder="Nhập mật khẩu" required>
            </div>
            <div class="form-group">
                <label class="form-label">Xác nhận mật khẩu</label>
                <input type="password" class="form-input" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
            </div>
            <button id="continueRegisterBtn" type="button" class="btn-continue">Tiếp tục</button>
        </form>
        
        <div style="text-align: center; margin-top: 20px;">
            <a href="#" id="backToLoginBtn" style="color: #667eea; text-decoration: none; font-size: 14px; font-weight: 500;">Đã có tài khoản</a>
        </div>
    </div>
</div>

<!-- Confirm Register -->
<div class="modal" id="continueRegisterModal">
    <div class="modal-content">
        <span class="modal-close" onclick="closeLoginModal('continueRegister')">&times;</span>
        <h2 class="modal-title">TẠO TÀI KHOẢN</h2>
        <form action="${pageContext.request.contextPath}/confirmRegister" method="post">
            <div class="form-group">
                <label class="form-label">Họ và tên</label>
                <input type="text" class="form-input" name="fullName" placeholder="Nguyễn Văn A" required>
            </div>
            <div class="form-group">
                <label class="form-label">Số điện thoại</label>
                <input type="tel" class="form-input" name="phoneNumber" placeholder="0123456789" required>
            </div>
            <div class="form-group">
                <label class="form-label">Giới tính</label>
                <select name="gender" class="form-input" required>
                    <option value="">Chọn giới tính</option>
                    <option value="male">Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">Năm sinh</label>
                <input type="number" class="form-input" name="birthYear" placeholder="Ví dụ: 2005" required min="1900" max="2025">
            </div>
            
            <button type="submit" class="btn-continue">Xong</button>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
// Modal logic
const registerModal = document.getElementById('registerModal');
const continueRegisterModal = document.getElementById('continueRegisterModal');

// Show Register modal when clicking "Tạo tài khoản"
document.getElementById('headerRegisterBtn')?.addEventListener('click', (e) => {
    e.preventDefault();
    registerModal.classList.add('active');
});

// Back to Login - close register modal
document.getElementById('backToLoginBtn')?.addEventListener('click', (e) => {
    e.preventDefault();
    registerModal.classList.remove('active');
});

// Show Continue Register modal when clicking "Tiếp tục"
document.getElementById('continueRegisterBtn')?.addEventListener('click', () => {
    registerModal.classList.remove('active');
    continueRegisterModal.classList.add('active');
});

// Close specific modal
function closeLoginModal(modalType) {
    if (modalType === 'register') {
        registerModal.classList.remove('active');
    } else if (modalType === 'continueRegister') {
        continueRegisterModal.classList.remove('active');
    }
}

// Close modal when clicking outside
window.addEventListener('click', (event) => {
    if (event.target === registerModal) {
        registerModal.classList.remove('active');
    }
    if (event.target === continueRegisterModal) {
        continueRegisterModal.classList.remove('active');
    }
});
</script>
</body>
</html>