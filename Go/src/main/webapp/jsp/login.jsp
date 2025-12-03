<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Go - Đăng nhập</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<style>

/* ===== OVERLAY ===== */
.modal {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.55);
    backdrop-filter: blur(3px);
    z-index: 9999;
    align-items: center;
    justify-content: center;
}

.modal.active {
    display: flex;
    animation: fadeIn .3s ease forwards;
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity: 1;}
}

/* ===== MODAL BOX ===== */
.modal-content {
    background: #fff;
    border-radius: 18px;
    padding: 40px 34px;
    width: 92%;
    max-width: 430px;
    max-height: 90vh;
    overflow-y: auto;
    box-shadow: 0 12px 45px rgba(0,0,0,0.15);
    animation: popup .35s ease;
}

@keyframes popup {
    from { transform: translateY(25px); opacity: 0;}
    to { transform: translateY(0); opacity: 1;}
}

/* ===== CLOSE BUTTON ===== */
.modal-close {
    position: absolute;
    top: 18px;
    right: 22px;
    font-size: 30px;
    cursor: pointer;
    color: #999;
    transition: .2s;
}

.modal-close:hover {
    color: #333;
}

/* ===== TITLES ===== */
.modal-title {
    font-size: 27px;
    font-weight: 700;
    color: #222;
    margin-bottom: 4px;
    text-align: center;
}

.modal-subtitle {
    text-align: center;
    font-size: 14px;
    color: #555;
    margin-bottom: 26px;
    line-height: 1.5;
}

/* ===== SOCIAL BUTTONS ===== */
.social-btn {
    width: 100%;
    padding: 12px;
    border-radius: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    border: none;
    margin-bottom: 12px;
    transition: .25s;
}

.social-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}

.btn-google { background: #4285F4; color: #fff; }
.btn-facebook { background: #1877F2; color: #fff; }
.btn-apple { background: #000; color: #fff; }

/* ===== DIVIDER ===== */
.divider {
    position: relative;
    text-align: center;
    margin: 22px 0;
    color: #999;
    font-size: 14px;
}

.divider::before, .divider::after {
    content: "";
    position: absolute;
    top: 50%;
    height: 1px;
    width: 40%;
    background: #ddd;
}

.divider::before { left: 0;}
.divider::after { right: 0;}

/* ===== FORM ===== */
.form-group { margin-bottom: 16px; }

.form-label {
    font-size: 14px;
    margin-bottom: 6px;
    display: block;
    font-weight: 500;
}

.form-input {
    width: 100%;
    padding: 12px 14px;
    border-radius: 12px;
    border: 1.8px solid #ccc;
    font-size: 14px;
    transition: .25s;
}

.form-input:focus {
    border-color: #667eea;
    box-shadow: 0 0 8px rgba(102,126,234,0.35);
    outline: none;
}

/* ===== SUBMIT ===== */
.btn-continue {
    width: 100%;
    padding: 14px;
    border-radius: 28px;
    background: #667eea;
    border: none;
    color: #fff;
    font-weight: 700;
    cursor: pointer;
    transition: .28s;
    font-size: 16px;
}

.btn-continue:hover {
    background: #5568d3;
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(102,126,234,0.35);
}

/* ===== SMALL TEXT ===== */
.forgot {
    text-align: center;
    margin-top: 18px;
}

.forgot a {
    color: #667eea;
    font-size: 14px;
    text-decoration: none;
}

.forgot a:hover { text-decoration: underline; }

</style>
</head>

<body>

<div class="modal" id="loginModal">
    <div class="modal-content">

        <span class="modal-close" onclick="closeModal()">&times;</span>

        <h2 class="modal-title">Đăng nhập hoặc tạo tài khoản</h2>
        <p class="modal-subtitle">Đăng ký miễn phí và trải nghiệm dịch vụ du lịch tốt nhất cùng Go!</p>

        <button class="social-btn btn-google">Đăng nhập bằng Google</button>
        <button class="social-btn btn-facebook">Đăng nhập bằng Facebook</button>
        <button class="social-btn btn-apple">Đăng nhập bằng Apple</button>

        <div class="divider">hoặc</div>

        <form onsubmit="handleLogin(event)">
            <div class="form-group">
                <label class="form-label">Email</label>
                <input type="email" class="form-input" placeholder="email@example.com" required>
            </div>

            <div class="form-group">
                <label class="form-label">Mật khẩu</label>
                <input type="password" class="form-input" placeholder="Nhập mật khẩu" required>
            </div>

            <button type="submit" class="btn-continue">Đăng nhập</button>
        </form>

        <div class="forgot">
            <a href="#">Quên mật khẩu?</a>
        </div>

    </div>
</div>

<script>
function openModal() {
    document.getElementById("loginModal").classList.add("active");
}

function closeModal() {
    document.getElementById("loginModal").classList.remove("active");
}

function handleLogin(e) {
    e.preventDefault();
    alert("Đăng nhập thành công!");
    closeModal();
}

// click bên ngoài để tắt
document.getElementById("loginModal").addEventListener("click", function(e){
    if (e.target === this) closeModal();
});
</script>

</body>
</html>
