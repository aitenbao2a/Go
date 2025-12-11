<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautiful Search Box</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .hero {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 16px;
            text-shadow: 0 2px 20px rgba(0,0,0,0.2);
        }

        .hero-subtitle {
            font-size: 20px;
            opacity: 0.95;
        }

        .search-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .search-box {
            background: white;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            padding: 40px;
            position: relative;
            overflow: hidden;
        }

        .search-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2, #f093fb);
        }

        .search-tabs {
            display: flex;
            gap: 12px;
            margin-bottom: 32px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 16px;
        }

        .search-tab {
            padding: 12px 24px;
            border: none;
            background: transparent;
            border-radius: 12px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: all 0.3s;
            color: #666;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-tab:hover {
            background: #f8f9ff;
            color: #667eea;
        }

        .search-tab.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }

        .search-form {
            display: grid;
            grid-template-columns: 2fr 1.2fr 1.2fr 1.5fr auto;
            gap: 20px;
            align-items: end;
        }

        .form-field {
            position: relative;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #666;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input-wrapper {
            position: relative;
        }

        .form-input {
            width: 100%;
            padding: 16px 16px 16px 48px;
            border: 2px solid #e8e8e8;
            border-radius: 16px;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s;
            background: white;
        }

        .form-input:hover {
            border-color: #d0d0d0;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            color: #667eea;
        }

        /* Guest Selector */
        .guest-selector {
            position: relative;
        }

        .guest-display {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px;
            border: 2px solid #e8e8e8;
            border-radius: 16px;
            cursor: pointer;
            transition: all 0.3s;
            background: white;
            min-height: 56px;
        }

        .guest-display:hover {
            border-color: #d0d0d0;
        }

        .guest-display.active {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }

        .guest-text {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 500;
            color: #333;
        }

        .guest-icon {
            width: 20px;
            height: 20px;
            color: #667eea;
        }

        .dropdown-icon {
            width: 20px;
            height: 20px;
            color: #999;
            transition: transform 0.3s;
        }

        .guest-display.active .dropdown-icon {
            transform: rotate(180deg);
        }

        .guest-dropdown {
            position: absolute;
            top: calc(100% + 8px);
            left: 0;
            right: 0;
            background: white;
            border-radius: 16px;
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
            padding: 20px;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transform: translateY(-10px);
            transition: all 0.3s;
        }

        .guest-dropdown.show {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .guest-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .guest-row:last-child {
            border-bottom: none;
        }

        .guest-label-main {
            font-weight: 600;
            font-size: 15px;
            color: #333;
            display: block;
            margin-bottom: 4px;
        }

        .guest-label-sub {
            font-size: 13px;
            color: #999;
        }

        .guest-controls {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .guest-btn {
            width: 36px;
            height: 36px;
            border: 2px solid #e8e8e8;
            border-radius: 50%;
            background: white;
            color: #667eea;
            font-size: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .guest-btn:hover {
            border-color: #667eea;
            background: #667eea;
            color: white;
            transform: scale(1.1);
        }

        .guest-btn:disabled {
            opacity: 0.3;
            cursor: not-allowed;
            transform: scale(1);
        }

        .guest-count {
            font-weight: 700;
            font-size: 16px;
            min-width: 30px;
            text-align: center;
            color: #333;
        }

        /* Search Button */
        .btn-search {
            padding: 16px 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 16px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.3s;
            box-shadow: 0 8px 24px rgba(102, 126, 234, 0.4);
            white-space: nowrap;
        }

        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(102, 126, 234, 0.5);
        }

        .btn-search:active {
            transform: translateY(0);
        }

        .btn-search svg {
            width: 20px;
            height: 20px;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .search-form {
                grid-template-columns: 1fr;
            }

            .btn-search {
                justify-content: center;
            }

            .hero-title {
                font-size: 36px;
            }
        }

        @media (max-width: 640px) {
            .search-box {
                padding: 24px;
            }

            .hero-title {
                font-size: 28px;
            }

            .hero-subtitle {
                font-size: 16px;
            }

            .search-tabs {
                overflow-x: auto;
                padding-bottom: 12px;
            }
        }

        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .search-box {
            animation: slideIn 0.6s ease-out;
        }

        /* Date input styling */
        input[type="date"] {
            position: relative;
            cursor: pointer;
        }

        input[type="date"]::-webkit-calendar-picker-indicator {
            cursor: pointer;
            opacity: 0.6;
        }
    </style>
</head>
<body>
    <div class="hero">
        <h1 class="hero-title">Tìm khách sạn ưng ý của bạn</h1>
        <p class="hero-subtitle">Tìm kiếm và so sánh hơn 2 triệu khách sạn trên toàn thế giới</p>
    </div>

    <div class="search-container">
        <div class="search-box">
            <div class="search-tabs">
                <button class="search-tab active">
                    🏨 Khách sạn
                </button>
                <button class="search-tab">
                    ✈️ Chuyến bay
                </button>
                <button class="search-tab">
                    🏠 Nhà nghỉ
                </button>
                <button class="search-tab">
                    🚗 Thuê xe
                </button>
            </div>

            <form class="search-form" action="search" method="get">
                <!-- Destination -->
                <div class="form-field">
                    <label class="form-label">📍 Điểm đến</label>
                    <div class="form-input-wrapper">
                        <svg class="input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                        </svg>
                        <input type="text" class="form-input" name="destination" 
                               placeholder="Bạn muốn đi đâu?" required>
                    </div>
                </div>

                <!-- Check-in Date -->
                <div class="form-field">
                    <label class="form-label">📅 Nhận phòng</label>
                    <div class="form-input-wrapper">
                        <svg class="input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                        <input type="date" class="form-input" name="checkin" id="checkInDate" required>
                    </div>
                </div>

                <!-- Check-out Date -->
                <div class="form-field">
                    <label class="form-label">📅 Trả phòng</label>
                    <div class="form-input-wrapper">
                        <svg class="input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                        <input type="date" class="form-input" name="checkout" id="checkOutDate" required>
                    </div>
                </div>

                <!-- Guest & Room Selector -->
                <div class="form-field">
                    <label class="form-label">👥 Khách & Phòng</label>
                    <div class="guest-selector">
                        <div class="guest-display" id="guestDisplay">
                            <span class="guest-text">
                                <svg class="guest-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                          d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                                </svg>
                                <span id="guestSummary">2 khách, 1 phòng</span>
                            </span>
                            <svg class="dropdown-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                            </svg>
                        </div>

                        <div class="guest-dropdown" id="guestDropdown">
                            <!-- Adults -->
                            <div class="guest-row">
                                <div class="guest-label">
                                    <span class="guest-label-main">Người lớn</span>
                                    <span class="guest-label-sub">Từ 13 tuổi trở lên</span>
                                </div>
                                <div class="guest-controls">
                                    <button type="button" class="guest-btn" onclick="decreaseGuest('adults')">−</button>
                                    <span class="guest-count" id="adultsCount">2</span>
                                    <button type="button" class="guest-btn" onclick="increaseGuest('adults')">+</button>
                                </div>
                            </div>

                            <!-- Children -->
                            <div class="guest-row">
                                <div class="guest-label">
                                    <span class="guest-label-main">Trẻ em</span>
                                    <span class="guest-label-sub">Từ 2-12 tuổi</span>
                                </div>
                                <div class="guest-controls">
                                    <button type="button" class="guest-btn" onclick="decreaseGuest('children')">−</button>
                                    <span class="guest-count" id="childrenCount">0</span>
                                    <button type="button" class="guest-btn" onclick="increaseGuest('children')">+</button>
                                </div>
                            </div>

                            <!-- Rooms -->
                            <div class="guest-row">
                                <div class="guest-label">
                                    <span class="guest-label-main">Phòng</span>
                                </div>
                                <div class="guest-controls">
                                    <button type="button" class="guest-btn" onclick="decreaseGuest('rooms')">−</button>
                                    <span class="guest-count" id="roomsCount">1</span>
                                    <button type="button" class="guest-btn" onclick="increaseGuest('rooms')">+</button>
                                </div>
                            </div>
                        </div>

                        <!-- Hidden inputs -->
                        <input type="hidden" name="adults" id="adultsInput" value="2">
                        <input type="hidden" name="children" id="childrenInput" value="0">
                        <input type="hidden" name="rooms" id="roomsInput" value="1">
                    </div>
                </div>

                <!-- Search Button -->
                <button type="submit" class="btn-search">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    Tìm kiếm
                </button>
            </form>
        </div>
    </div>

    <script>
        // Date Setup
        const today = new Date();
        const tomorrow = new Date(today);
        tomorrow.setDate(today.getDate() + 1);
        const dayAfter = new Date(today);
        dayAfter.setDate(today.getDate() + 3);

        document.getElementById('checkInDate').valueAsDate = tomorrow;
        document.getElementById('checkOutDate').valueAsDate = dayAfter;

        // Guest Selector Logic
        const guests = {
            adults: 2,
            children: 0,
            rooms: 1
        };

        const guestDisplay = document.getElementById('guestDisplay');
        const guestDropdown = document.getElementById('guestDropdown');

        guestDisplay.addEventListener('click', (e) => {
            e.stopPropagation();
            guestDisplay.classList.toggle('active');
            guestDropdown.classList.toggle('show');
        });

        document.addEventListener('click', (e) => {
            if (!e.target.closest('.guest-selector')) {
                guestDisplay.classList.remove('active');
                guestDropdown.classList.remove('show');
            }
        });

        function increaseGuest(type) {
            const limits = { adults: 10, children: 10, rooms: 5 };
            if (guests[type] < limits[type]) {
                guests[type]++;
                updateGuestDisplay();
            }
        }

        function decreaseGuest(type) {
            const minimums = { adults: 1, children: 0, rooms: 1 };
            if (guests[type] > minimums[type]) {
                guests[type]--;
                updateGuestDisplay();
            }
        }

        function updateGuestDisplay() {
            const totalGuests = guests.adults + guests.children;
            document.getElementById('guestSummary').textContent = 
                `${totalGuests} khách, ${guests.rooms} phòng`;
            
            document.getElementById('adultsCount').textContent = guests.adults;
            document.getElementById('childrenCount').textContent = guests.children;
            document.getElementById('roomsCount').textContent = guests.rooms;

            document.getElementById('adultsInput').value = guests.adults;
            document.getElementById('childrenInput').value = guests.children;
            document.getElementById('roomsInput').value = guests.rooms;
        }
    </script>
</body>
</html>