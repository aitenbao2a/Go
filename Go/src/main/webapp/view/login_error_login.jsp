<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GO - Du lịch là trải nghiệm</title>
<style>
/* 1. PHÔNG NỀN - Chuyển sang tông xanh da trời nhạt */
.page-background {
    min-height: 100vh;
    background: linear-gradient(135deg, #a1c4fd 0%, #c2e9fb 100%);
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
    background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
    animation: float 15s ease-in-out infinite;
}

.page-background::after {
    content: '';
    position: absolute;
    bottom: -50%;
    left: -50%;
    width: 100%;
    height: 100%;
    background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, transparent 70%);
    animation: float 20s ease-in-out infinite reverse;
}

/* 2. MODAL & CARD */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(8px);
    z-index: 1000;
    align-items: center;
    justify-content: center;
    animation: fadeIn 0.3s ease;
}

.modal.active {
    display: flex;
}

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

.auth-card {
    background: white;
    border-radius: 24px;
    padding: 40px;
    max-width: 480px;
    width: 90%;
    position: relative;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    transition: all 0.4s ease;
    animation: slideUp 0.6s cubic-bezier(0.4, 0, 0.2, 1);
}

.auth-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 30px 80px rgba(0, 0, 0, 0.2);
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
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
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

.modal-title {
    font-size: 2rem;
    font-weight: 800;
    background: linear-gradient(90deg, #4facfe, #0072ff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-align: center;
    margin-bottom: 12px;
    letter-spacing: 1px;
}

/* 3. INPUT & BUTTONS */
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
    border-color: #4facfe;
    outline: none;
    box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.2);
}

.btn-continue {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #4facfe 0%, #0072ff 100%);
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
    box-shadow: 0 6px 20px rgba(79, 172, 254, 0.4);
}

.auth-link {
    color: #4facfe;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: color 0.3s ease;
}

.auth-link:hover {
    color: #0072ff;
    text-decoration: underline;
}

/* GIỮ NGUYÊN CÁC STYLE KHÁC */
.divider { text-align: center; margin: 25px 0; color: #a0aec0; position: relative; }
.divider::before, .divider::after { content: ''; position: absolute; top: 50%; width: 40%; height: 1px; background: #e2e8f0; }
.divider::before { left: 0; } .divider::after { right: 0; }
.form-group { margin-bottom: 20px; }
.form-label { display: block; margin-bottom: 6px; font-weight: 600; color: #4a5568; font-size: 0.95rem; }

.social-btn {
    width: 100%; padding: 14px; border: 2px solid #e2e8f0; border-radius: 12px;
    background: white; font-size: 1rem; font-weight: 600; cursor: pointer;
    display: flex; align-items: center; justify-content: center; gap: 12px;
    margin-bottom: 12px; transition: all 0.3s ease;
}
.social-btn:hover { transform: translateY(-2px); box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); }
.btn-google { color: #ea4335; border-color: #ea4335; }
.btn-facebook { color: #1877f2; border-color: #1877f2; }
.btn-apple { color: #000; border-color: #000; }

@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
@keyframes slideUp { from { transform: translateY(50px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
@keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    33% { transform: translate(30px, -30px) rotate(120deg); }
    66% { transform: translate(-20px, 20px) rotate(240deg); }
}
</style>
</head>
<body>
<jsp:include page="header.jsp" />

    <div class="page-background">
        <div class="form-container-wrapper">
            <div class="auth-card">
                <h2 class="modal-title">ĐĂNG NHẬP</h2>
                <button class="social-btn btn-google">
                    <img src="${pageContext.request.contextPath}/images/logo_google.png" height="20" width="20">
                    Đăng nhập bằng Google
                </button>

                <button class="social-btn btn-facebook">
                    <img src="${pageContext.request.contextPath}/images/logo_facebook.webp" height="20" width="20"> 
                    Đăng nhập bằng Facebook
                </button>
                <button class="social-btn btn-apple">
                    <img src="${pageContext.request.contextPath}/images/logo_apple.png" height="20" width="20">
                    Đăng nhập bằng Apple
                </button>
                
                <div class="divider">Hoặc</div>
                
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label class="form-label">Email</label> 
                        <input type="email" class="form-input" name="email" value="${emailValue}" placeholder="id@email.com" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Mật khẩu</label> 
                        <input type="password" class="form-input" name="password" placeholder="Nhập mật khẩu" required>
                    </div>

                    <c:if test="${not empty loginError}">
                        <div style="color: #f56565; font-size: 0.85rem; margin-top: 5px;">${loginError}</div>
                    </c:if>
                    <button type="submit" class="btn-continue">Đăng nhập</button>
                </form>
                
                <div style="display: flex; justify-content: center; margin-top: 20px; gap: 20px;">
                    <a href="${pageContext.request.contextPath}/view/login_error_login.jsp" class="auth-link">Quên mật khẩu</a> 
                    <a href="#" id="headerRegisterBtn" class="auth-link">Tạo tài khoản</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal ${not empty emailError || not empty passwordError ? 'active' : ''}" id="registerModal">
        <div class="modal-content">
            <span class="modal-close" onclick="closeRegisterModal()">&times;</span>
            <h2 class="modal-title">TẠO TÀI KHOẢN</h2>
            <button class="social-btn btn-google">
                <img src="${pageContext.request.contextPath}/images/logo_google.png" height="20" width="20"> Đăng nhập bằng Google
            </button>
            <div class="divider">Hoặc</div>
            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <label class="form-label">Email</label> 
                    <input type="email" class="form-input" name="email" placeholder="id@email.com" value="${emailValue}">
                </div>
                <div class="form-group">
                    <label class="form-label">Mật khẩu</label> 
                    <input type="password" class="form-input" name="password" placeholder="Nhập mật khẩu">
                </div>
                <div class="form-group">
                    <label class="form-label">Xác nhận mật khẩu</label> 
                    <input type="password" class="form-input" name="confirmPassword" placeholder="Xác nhận mật khẩu">
                </div>
                <button type="submit" class="btn-continue">Tiếp tục</button>
            </form>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

<script>
const registerModal = document.getElementById('registerModal');

document.getElementById('headerRegisterBtn')?.addEventListener('click', (e) => {
    e.preventDefault();
    registerModal.classList.add('active');
});

function closeRegisterModal() {
    registerModal.classList.remove('active');
}

window.addEventListener('click', (event) => {
    if (event.target === registerModal) {
        closeRegisterModal();
    }
});
</script>
</body>
</html>