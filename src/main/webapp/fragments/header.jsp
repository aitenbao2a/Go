<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="header">
    <div class="header-top">
        <div class="header-top-left">
            <a href="#">Tải ứng dụng</a> 
            <a href="#">Hỗ trợ</a> 
            <a href="#">Trở thành đối tác</a>
        </div>
        <div class="currency">VND | VI</div>
    </div>
    
    <div class="header-main">
        <div class="logo" onclick="window.location.href='index.jsp'" style="cursor: pointer;">
            <div class="logo-circles">
                <div class="circle circle-1"></div>
                <div class="circle circle-2"></div>
                <div class="circle circle-3"></div>
                <div class="circle circle-4"></div>
                <div class="circle circle-5"></div>
            </div>
            <div class="logo-text">agoda</div>
        </div>

        <nav class="nav-links">
            <a href="#" class="nav-link"> <span class="badge">Hot</span> Máy bay + Khách sạn</a> 
            <a href="#" class="nav-link">Chỗ ở</a> 
            <a href="#" class="nav-link">Chuyến bay</a> 
            <a href="#" class="nav-link"> <span class="badge">Mới</span> Phương tiện</a>
        </nav>

        <div class="user-actions">
            <%
                //Lấy thông tin userEmail từ Session (Do LoginServlet gửi sang)
                String userEmail = (String) session.getAttribute("userEmail");
                // Kiểm tra: Nếu userEmail KHÁC NULL nghĩa là ĐÃ ĐĂNG NHẬP
                if (userEmail != null) {
            %>
                <div style="display: flex; align-items: center; gap: 10px;">
                    <span style="font-weight: 600; color: #333; font-size: 14px;">
                        <i class="fa-solid fa-user"></i> <%= userEmail %>
                    </span>
                    
                    <a href="LoginServlet?action=logout" 
                       style="padding: 8px 15px; border: 1px solid #ffcccc; background-color: #fff5f5; color: #d32f2f; border-radius: 4px; text-decoration: none; font-size: 14px; font-weight: 600;">
                       Đăng xuất
                    </a>
                </div>

            <%
                } else {
            %>
                <button class="btn-signin" onclick="openModal()">Đăng nhập</button>
                <button class="btn-signup">Tạo tài khoản</button>
            <%
                }
            %>
        </div>
    </div>
</header>