    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
USE go_project;
drop database go_project;
CREATE TABLE User (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    passwordHash VARCHAR(255) NOT NULL,
    fullName VARCHAR(150),
    phone VARCHAR(20),
    dateOfBirth DATE,
    createdAt DATETIME DEFAULT NOW(),
    updatedAt DATETIME DEFAULT NOW() ON UPDATE NOW(),
    isActive BOOLEAN DEFAULT TRUE,
    role VARCHAR(50) NOT NULL DEFAULT 'REGISTERED'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE Hotel (
    hotelId INT PRIMARY KEY AUTO_INCREMENT,
    hotelName VARCHAR(255) NOT NULL,
    description TEXT,
    address VARCHAR(500),
    city VARCHAR(100),
    country VARCHAR(100),
    starRating INT CHECK (starRating >= 0 AND starRating <= 5),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    amenities TEXT,
    images TEXT,
    createdAt DATETIME DEFAULT NOW(),
    averageRating FLOAT DEFAULT 0,
    reviewCount INT DEFAULT 0,
    minPrice DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
	CREATE TABLE Room (
		roomId INT PRIMARY KEY AUTO_INCREMENT,
		hotelId INT NOT NULL,
		roomType VARCHAR(100) NOT NULL,
		description TEXT,
		capacity INT NOT NULL,
		pricePerNight DECIMAL(10,2) NOT NULL,
		totalRooms INT NOT NULL,
		availableRooms INT NOT NULL,
		amenities TEXT,
		images TEXT,
		CONSTRAINT fk_hotel_room FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    select * from booking;
	CREATE TABLE Booking (
		bookingId INT PRIMARY KEY AUTO_INCREMENT,
		userId INT NOT NULL,
		hotelId INT NOT NULL,
		roomId INT NOT NULL,
		checkInDate DATE NOT NULL,
		checkOutDate DATE NOT NULL,
		numberOfRooms INT NOT NULL,
		numberOfGuests INT NOT NULL,
		guestName VARCHAR(100) NOT NULL,
		guestEmail VARCHAR(100) NOT NULL,
		guestPhone VARCHAR(20) NOT NULL,
		specialRequests TEXT,
		totalAmount DECIMAL(10,2) NOT NULL,
		bookingStatus VARCHAR(50) DEFAULT 'Pending',
		createdAt DATETIME DEFAULT NOW(),
		paymentMethod VARCHAR(50),
		paymentStatus VARCHAR(50) DEFAULT 'Pending',
		CONSTRAINT fk_user_booking 
			FOREIGN KEY (userId) REFERENCES User(userId),
		CONSTRAINT fk_hotel_booking 
			FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
		CONSTRAINT fk_room_booking 
			FOREIGN KEY (roomId) REFERENCES Room(roomId)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    bookingId INT NOT NULL,
    paymentMethod VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    paymentStatus VARCHAR(50) NOT NULL,
    transactionId VARCHAR(100),
    paymentDate DATETIME DEFAULT NOW(),
    CONSTRAINT fk_booking_payment FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Review (
    reviewId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT NOT NULL,
    hotelId INT NOT NULL,
    bookingId INT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    createdAt DATETIME DEFAULT NOW(),
    userName VARCHAR(100),
    userAvatar VARCHAR(255),
    CONSTRAINT fk_user_review FOREIGN KEY (userId) REFERENCES User(userId),
    CONSTRAINT fk_hotel_review FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
    CONSTRAINT fk_booking_review FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO User (email, passwordHash, fullName, phone, dateOfBirth, isActive, role)
VALUES
('admin@gmail.com', '123admin456', 'Admin', null, null, TRUE, 'ADMIN'),
('giabao@gmail.com', 'Baocoioioi2016@', 'GiaBao', '0912345678', '1990-05-10', TRUE, 'REGISTERED'),
('aitenbao2a@gmail.com', '16012005', 'Gia Bảo', '0987654321', '1985-12-20', TRUE, 'REGISTERED'),
('charlie@2aexample.com', 'C#harlie8', 'Charlie Brown', '0901122334', '1992-03-15', TRUE, 'REGISTERED'),
('nguyenvana@gmail.com', 'AnA!1995_z', 'Nguyễn Văn A', '0912111004', '1995-01-25', TRUE, 'REGISTERED'),
('tranvanb@gmail.com', 'BTrA#2024v', 'Trần Văn B', '0903222115', '1988-11-12', TRUE, 'REGISTERED'),
('lethic@gmail.com', 'CLe$3210vY', 'Lê Thị C', '0989333226', '1998-07-01', TRUE, 'REGISTERED'),
('phamvand@gmail.com', 'DPhAm%4567Z', 'Phạm Văn D', '0977444337', '1993-04-19', TRUE, 'REGISTERED'),
('hoangthie@gmail.com', 'EHoAnG^5883a', 'Hoàng Thị E', '0945555448', '1983-09-30', TRUE, 'REGISTERED'),
('buidinhf@gmail.com', 'FBuI&6992b', 'Bùi Đình F', '0919666559', '1996-02-05', TRUE, 'REGISTERED'),
('vothihg@gmail.com', 'GvO*7111AcC', 'Võ Thị G', '0908777660', '1991-10-22', TRUE, 'REGISTERED'),
('doanquangh@gmail.com', 'Hdoan(8222Bd', 'Đoàn Quang H', '0987888771', '1987-06-14', TRUE, 'REGISTERED'),
('nguyenthihoa@gmail.com', 'Hoa9333!vW', 'Nguyễn Thị Hòa', '0912999882', '1994-08-08', TRUE, 'REGISTERED'),
('tranminhkhoi@gmail.com', 'Khoi@1444dE', 'Trần Minh Khôi', '0903000993', '1986-03-29', TRUE, 'REGISTERED'),
('lethanhlam@gmail.com', 'Lam#2555fG', 'Lê Thanh Lâm', '0989111004', '1999-12-03', TRUE, 'REGISTERED'),
('phamthingoc@gmail.com', 'Ngoc$3666hI', 'Phạm Thị Ngọc', '0977222115', '1992-05-17', TRUE, 'REGISTERED'),
('hoangvanphu@gmail.com', 'Phu%4777jK', 'Hoàng Văn Phú', '0945333226', '1984-01-07', TRUE, 'REGISTERED'),
('buiduyquang@gmail.com', 'QuAnG5888^lM', 'Bùi Duy Quang', '0919444337', '1997-11-21', TRUE, 'REGISTERED'),
('vothixuan@gmail.com', 'XuAn6999&nO', 'Võ Thị Xuân', '0908555448', '1990-06-28', TRUE, 'REGISTERED'),
('doanquocthang@gmail.com', 'ThAnG7000*pQ', 'Đoàn Quốc Thắng', '0987666559', '1985-02-10', TRUE, 'REGISTERED'),
('nguyenthanhtrung@gmail.com', 'TrUnG8111(rS', 'Nguyễn Thanh Trung', '0912777660', '1993-10-04', TRUE, 'REGISTERED'),
('tranvanhieu@gmail.com', 'HieU9222)tU', 'Trần Văn Hiếu', '0903888771', '1989-07-16', TRUE, 'REGISTERED'),
('lethuyduong@gmail.com', 'DuOnG1333!vW', 'Lê Thùy Dương', '0989999882', '1995-04-23', TRUE, 'REGISTERED'),
('phamvanluc@gmail.com', 'LuC2444@xY', 'Phạm Văn Lực', '0977000993', '1987-12-09', TRUE, 'REGISTERED'),
('hoangthihong@gmail.com', 'HoNg3555#zA', 'Hoàng Thị Hồng', '0945111004', '1998-09-02', TRUE, 'REGISTERED'),
('buiducminh@gmail.com', 'MiNh4666$Bc', 'Bùi Đức Minh', '0919222115', '1983-05-27', TRUE, 'REGISTERED'),
('vothithuy@gmail.com', 'ThUy5777%De', 'Võ Thị Thúy', '0908333226', '1996-01-18', TRUE, 'REGISTERED'),
('doanquocan@gmail.com', 'An6888^fGz', 'Đoàn Quốc An', '0987444337', '1991-11-06', TRUE, 'REGISTERED'),
('nguyenvantien@gmail.com', 'TieN7999&hI', 'Nguyễn Văn Tiến', '0912555448', '1985-08-11', TRUE, 'REGISTERED'),
('tranthinga@gmail.com', 'NgA8000*jK', 'Trần Thị Nga', '0903666559', '1994-03-07', TRUE, 'REGISTERED'),
('lethanhhieu@gmail.com', 'HieU9111(lM', 'Lê Thanh Hiếu', '0989777660', '1988-10-24', TRUE, 'REGISTERED'),
('phamvanloi@gmail.com', 'LoI1222)nO', 'Phạm Văn Lợi', '0977888771', '1997-06-13', TRUE, 'REGISTERED'),
('hoangthixinh@gmail.com', 'XiNh2333!pQ', 'Hoàng Thị Xinh', '0945999882', '1990-02-01', TRUE, 'REGISTERED'),
('buitronghiep@gmail.com', 'HieP3444@rS', 'Bùi Trọng Hiệp', '0919000993', '1986-12-25', TRUE, 'REGISTERED');

INSERT INTO Hotel (hotelId, hotelName, description, address, city, country, starRating, latitude, longitude, amenities, images, minPrice)
VALUES
(1,'Grand Palace','Luxury hotel with sea view','123 Beach Road','Miami','USA',5,25.774,-80.19,'Pool,Spa,WiFi','database/images/grandpalace/gp1.jpg,database/images/grandpalace/gp2.jpg,database/images/grandpalace/gp3.jpg',200.00),
(2,'City Inn','Comfortable city hotel','456 Downtown St','New York','USA',4,40.7128,-74.0060,'WiFi,Gym,Restaurant','database/images/cityinn/ci1.jpg,database/images/cityinn/ci2.jpg,database/images/cityinn/ci3.jpg',120.00),
(3,N'Khách sạn Sài Gòn Panorama',N'Khách sạn sang trọng ở trung tâm thành phố',N'79 Đường Nguyễn Huệ',N'Hồ Chí Minh',N'Việt Nam',5,10.7760,106.7019,'Pool,Spa,Gym,Restaurant','database/images/saigon/sgp1.jpg,database/images/saigon/sgp2.jpg,database/images/saigon/sgp3.jpg',185.00),
(4,N'Hà Nội Cổ Kính Inn',N'Nằm trong khu phố cổ, gần Hồ Gươm',N'36 Hàng Bông',N'Hà Nội',N'Việt Nam',4,21.0285,105.8542,'WiFi,Breakfast,TourDesk','database/images/hanoi/hnck1.jpg,database/images/hanoi/hnck2.jpg,database/images/hanoi/hnck3.jpg',95.00),
(5,N'Resort Biển Đà Nẵng',N'Khu nghỉ dưỡng sát biển, tầm nhìn tuyệt đẹp',N'516 Võ Nguyên Giáp',N'Đà Nẵng',N'Việt Nam',5,16.0680,108.2210,'Pool,PrivateBeach,Spa,Bar','database/images/danang/dn1.jpg,database/images/danang/dn2.jpg,database/images/danang/dn3.jpg,database/images/danang/dn4.jpg',250.00),
(6,N'Khách sạn Phố Hội',N'Nét kiến trúc truyền thống ở phố cổ',N'12 Lê Lợi',N'Hội An',N'Việt Nam',4,15.8794,108.3364,'Terrace,BikeRental,Restaurant','database/images/phohoi/ph1.jpg,database/images/phohoi/ph2.jpg,database/images/phohoi/ph3.jpg',110.00),
(7,N'Huế Imperial',N'Khách sạn lịch sử gần Đại Nội',N'150 Hùng Vương',N'Huế',N'Việt Nam',4,16.4637,107.5841,'Restaurant,Gym,Sauna','database/images/hue/h1.jpg,database/images/hue/h2.jpg,database/images/hue/h3.jpg',135.00),
(8,N'Nha Trang Ocean View',N'Khách sạn hiện đại nhìn ra biển',N'22 Trần Phú',N'Nha Trang',N'Việt Nam',4,12.2450,109.1917,'Pool,Bar,WiFi','database/images/nhatrang/nt1.jpg,database/images/nhatrang/nt2.jpg,database/images/nhatrang/nt3.jpg,database/images/nhatrang/nt4.jpg',105.00),
(9,N'Phú Quốc Marina',N'Khu nghỉ dưỡng biệt lập yên tĩnh',N'Ấp 4, Bãi Dài',N'Phú Quốc',N'Việt Nam',5,10.2300,103.9500,'Pool,Spa,WaterSports','database/images/phuquoc/pq1.jpg,database/images/phuquoc/pq2.jpg,database/images/phuquoc/pq3.jpg',220.00),
(10,N'Đà Lạt Mộng Mơ',N'Khách sạn kiểu Pháp lãng mạn',N'10 Triệu Việt Vương',N'Đà Lạt',N'Việt Nam',4,11.9404,108.4586,'Fireplace,Garden,Cafe','database/images/dalat/dl1.jpg,database/images/dalat/dl2.jpg,database/images/dalat/dl3.jpg,database/images/dalat/dl4.jpg',80.00),
(11,N'Cần Thơ Mekong Oasis',N'Nằm bên bờ sông Hậu',N'118 Hai Bà Trưng',N'Cần Thơ',N'Việt Nam',3,10.0337,105.7865,'RiverView,BoatTours,Breakfast','database/images/cantho/ct1.jpg,database/images/cantho/ct2.jpg,database/images/cantho/ct3.jpg',65.00),
(12,N'Hạ Long Bay View',N'Khách sạn có ban công nhìn ra vịnh',N'Khu Du lịch Bãi Cháy',N'Hạ Long',N'Việt Nam',5,20.9576,107.0322,'RooftopBar,Pool,Spa','database/images/halong/hl1.jpg,database/images/halong/hl2.jpg,database/images/halong/hl3.jpg',195.00),
(13,N'Khách sạn Kim Long',N'Tiện nghi, gần trung tâm mua sắm',N'234 Trần Hưng Đạo',N'Hồ Chí Minh',N'Việt Nam',3,10.7620,106.6800,'WiFi,Parking,AC','database/images/kimlong/kl1.jpg,database/images/kimlong/kl2.jpg,database/images/kimlong/kl3.jpg',55.00),
(14,N'Sapa Retreat',N'View núi non tuyệt đẹp, không gian ấm cúng',N'Fansipan Legend',N'Sapa',N'Việt Nam',4,22.3667,103.8433,'Hammam,Heating,Hiking','database/images/saparetreat/sr1.jpg,database/images/saparetreat/sr2.jpg,database/images/saparetreat/sr3.jpg,database/images/saparetreat/sr4.jpg',145.00),
(15,N'Vũng Tàu Lighthouse',N'Khách sạn gia đình gần bãi biển',N'120 Hạ Long',N'Vũng Tàu',N'Việt Nam',3,10.3444,107.0862,'KidsClub,BeachAccess','database/images/vungtau/vt1.jpg,database/images/vungtau/vt2.jpg,database/images/vungtau/vt3.jpg',75.00),
(16,N'Quy Nhơn Seafront',N'Khách sạn 4 sao mới, đối diện biển',N'20 Xuân Diệu',N'Quy Nhơn',N'Việt Nam',4,13.7845,109.2270,'Pool,Gym,Seaview','database/images/quynhon/qn1.jpg,database/images/quynhon/qn2.jpg,database/images/quynhon/qn3.jpg,database/images/quynhon/qn4.jpg',115.00),
(17,N'Thanh Hóa Sunset',N'Khách sạn nghỉ dưỡng ven biển Sầm Sơn',N'Bãi B, Sầm Sơn',N'Thanh Hóa',N'Việt Nam',3,19.8000,106.0000,'Breakfast,Terrace','database/images/thanhhoa/th1.jpg,database/images/thanhhoa/th2.jpg,database/images/thanhhoa/th3.jpg',70.00),
(18,N'Tuy Hòa Pearl',N'Khách sạn nhỏ xinh, phục vụ chuyên nghiệp',N'200 Độc Lập',N'Tuy Hòa',N'Việt Nam',3,13.0800,109.3000,'FreeParking,Laundry','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',60.00),
(19,N'Bình Thuận Ocean Star',N'Resort lãng mạn tại Mũi Né',N'Mũi Né, Phan Thiết',N'Bình Thuận',N'Việt Nam',5,10.9344,108.2830,'PrivatePool,Bar,Massage','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',280.00),
(20,N'Hà Giang Grand View',N'Khách sạn có tầm nhìn ra đồi núi',N'Tổ 1, Phố Cổ Đồng Văn',N'Hà Giang',N'Việt Nam',3,23.2800,105.3500,'MountainView,Heating','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',90.00),
(21,N'Ninh Bình Lotus',N'Khách sạn gần khu du lịch Tràng An',N'Thôn 4, Hoa Lư',N'Ninh Bình',N'Việt Nam',4,20.2500,105.9000,'BikeRental,Garden,Restaurant','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',118.00),
(22,N'Bạc Liêu Heritage',N'Khách sạn tiêu chuẩn quốc tế',N'12 Phạm Văn Đồng',N'Bạc Liêu',N'Việt Nam',3,9.2800,105.7300,'BusinessCenter,WiFi','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',68.00),
(23,'Tokyo Sky Tower Hotel','Modern design with panoramic city views','5-1 Marunouchi, Chiyoda','Tokyo','Japan',5,35.6895,139.6917,'Spa,Bar,Pool,Concierge','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',320.00),
(24,'Rome Historic Stay','Charming hotel near the Colosseum','Via Cavour 101','Rome','Italy',4,41.9028,12.4964,'Breakfast,Terrace,WiFi','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',160.00),
(25,'Bangkok Riverside','Budget hotel by Chao Phraya River','Soi 13 Charoen Krung','Bangkok','Thailand',3,13.7563,100.5018,'FerryAccess,Laundry,AC','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',45.00),
(26,'Dubai Marina Resort','Exclusive stay on the waterfront','Jumeirah Beach Residence','Dubai','UAE',5,25.2048,55.2708,'PrivateBeach,YachtRental,Gym','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',450.00),
(27,'London Central Suite','Apartment-style accommodations','21 Baker Street','London','UK',4,51.5074,0.1278,'Kitchenette,SelfCheckIn','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',210.00),
(28,'Sydney Harbour View','Iconic views of the Opera House','Circular Quay','Sydney','Australia',5,-33.8688,151.2093,'RooftopPool,Bar,Theater','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',290.00),
(29,'Istanbul Grand Bazaar Hotel','Traditional Turkish hospitality','Sultanahmet Square','Istanbul','Turkey',4,41.0082,28.9784,'Hammam,Breakfast,TeaRoom','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',140.00),
(30,'Rio de Janeiro Copacabana','Right on the famous beach','Av. Atlântica 1000','Rio de Janeiro','Brazil',3,-22.9068,-43.1729,'BeachService,Bar,WiFi','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',110.00),
(31,'Seoul Gangnam Place','Business hotel in the upscale district','Teheran-ro 25','Seoul','South Korea',4,37.5665,126.9780,'BusinessCenter,ConferenceRooms','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',175.00),
(32,'Toronto Downtown Hostel','Shared rooms and budget travel','20 Queen Street West','Toronto','Canada',2,43.6532,-79.3832,'SharedKitchen,Lockers,Lounge','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',30.00),
(33,'Cape Town Table View','Stunning views of Table Mountain','V&A Waterfront','Cape Town','South Africa',5,-33.9249,18.4241,'Spa,InfinityPool,WineTours','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',240.00),
(34,'Berlin Art Hotel','Eclectic design and gallery space','Oranienburger Straße 1','Berlin','Germany',4,52.5200,13.4050,'ArtGallery,Cafe,Bar','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',155.00),
(35,'Mexico City Palace','Located in the historic centre','Avenida Reforma 10','Mexico City','Mexico',4,19.4326,-99.1332,'RooftopTerrace,Sauna,Pool','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',180.00),
(36,'Phnom Penh Diamond','Luxury hotel near the Royal Palace','313 Preah Sisowath Quay','Phnom Penh','Cambodia',5,11.5564,104.9282,'Casino,FineDining,Pool','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',190.00),
(37,'San Francisco Bridge View','Overlooking the Golden Gate','1 Pier 39','San Francisco','USA',4,37.7749,-122.4194,'Balcony,PetFriendly','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',205.00),
(38,'Beijing Hutong Stay','Traditional courtyard experience','Jingshan Houjie','Beijing','China',3,39.9042,116.4074,'TeaHouse,BikeRental,Garden','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',75.00),
(39,'Amsterdam Canal House','Boutique hotel in a renovated canal house','Keizersgracht 10','Amsterdam','Netherlands',4,52.3702,4.8952,'BoutiqueShop,Breakfast','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',170.00),
(40,'Vienna Concert Hotel','Near the State Opera House','Opernring 2','Vienna','Austria',5,48.2082,16.3738,'MusicLounge,Spa,Valet','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',260.00),
(41,'New Delhi Royal Residency','Hotel with Mughal architectural inspiration','Connaught Place','New Delhi','India',4,28.6139,77.2090,'Pool,Catering,Events','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',130.00),
(42,'Hanoi Cozy Corner',N'Phòng trọ giá rẻ, tiện nghi cơ bản',N'15 Ngõ Huyện',N'Hà Nội',N'Việt Nam',2,21.0280,105.8500,'WiFi,CommonArea','database/images/all/all1.jpg,database/images/all/all2.jpg,database/images/all/all3.jpg',25.00);

INSERT INTO Room (roomId, hotelId, roomType, description, capacity, pricePerNight, totalRooms, availableRooms, amenities, images)
VALUES
(1, 1, 'Single', 'Single room with balcony', 1, 220.00, 10, 10, 'WiFi,TV', 'database/images/grandpalace/room1.jpg'),
(2, 1, 'Double', 'Double room with sea view', 2, 300.00, 5, 5, 'WiFi,TV,Balcony', 'database/images/grandpalace/room2.jpg'),
(6, 1, 'Executive Suite', N'Phòng Suite điều hành, có phòng khách riêng', 3, 550.00, 3, 2, 'WiFi,Jacuzzi,DiningArea,Bar', 'database/images/grandpalace/room3.jpg'),
(16, 1, 'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 380.00, 10, 10, 'WiFi,Balcony,Seaview', 'database/images/grandpalace/room4.jpg'),
(26, 1, 'Single Economy', N'Phòng đơn tiết kiệm', 1, 130.00, 10, 10, 'WiFi,AC', 'database/images/grandpalace/room5.jpg'),
(36, 1, 'Deluxe King', N'Phòng King Deluxe', 2, 400.00, 8, 6, 'WiFi,Balcony,CityView', 'database/images/grandpalace/room6.jpg'),
(46, 1, 'Superior Double', N'Phòng Double cao cấp, tầm nhìn ra biển', 2, 420.00, 10, 8, 'WiFi,TV,Balcony,Seaview', 'database/images/grandpalace/room7.jpg'),
(56, 1, 'Triple Room', N'Phòng 3 người lớn', 3, 390.00, 10, 10, 'WiFi,ThreeBeds', 'database/images/grandpalace/room8.jpg,database/images/miniRoom/room56b.jpg,database/images/miniRoom/room56c.jpg,database/images/miniRoom/room56d.jpg,database/images/miniRoom/room56e.jpg'),
(66, 1, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 250.00, 20, 19, 'WiFi,AC', 'database/images/grandpalace/room9.jpg,database/images/miniRoom/room66b.jpg,database/images/miniRoom/room66c.jpg,database/images/miniRoom/room66d.jpg,database/images/miniRoom/room66e.jpg'),
(76, 1, 'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 350.00, 15, 15, 'WiFi,Balcony,CityView', 'database/images/grandpalace/room10.jpg,database/images/miniRoom/room76b.jpg,database/images/miniRoom/room76c.jpg,database/images/miniRoom/room76d.jpg,database/images/miniRoom/room76e.jpg'),
(86, 1, 'Executive Double', N'Phòng điều hành 1 giường đôi', 2, 490.00, 5, 4, 'LoungeAccess,PremiumAmenities', 'database/images/grandpalace/room11.jpg,database/images/miniRoom/room86b.jpg,database/images/miniRoom/room86c.jpg,database/images/miniRoom/room86d.jpg,database/images/miniRoom/room86e.jpg'),

(3, 2, 'Standard', 'Standard room in city center', 2, 130.00, 8, 8, 'WiFi,TV', 'database/images/cityinn/room1.jpg,database/images/miniRoom/room3b.jpg,database/images/miniRoom/room3c.jpg,database/images/miniRoom/room3d.jpg,database/images/miniRoom/room3e.jpg'),
(12, 2, 'Superior Twin', N'Phòng Twin cao cấp, tầm nhìn đẹp', 2, 210.00, 18, 18, 'WiFi,Minibar,Desk', 'database/images/cityinn/room2.jpg,database/images/miniRoom/room12b.jpg,database/images/miniRoom/room12c.jpg,database/images/miniRoom/room12d.jpg,database/images/miniRoom/room12e.jpg'),
(22, 2, 'Business Class', N'Phòng dành cho khách công tác', 1, 195.00, 12, 12, 'HighSpeedWiFi,LargeDesk', 'database/images/cityinn/room3.jpg,database/images/miniRoom/room22b.jpg,database/images/miniRoom/room22c.jpg,database/images/miniRoom/room22d.jpg,database/images/miniRoom/room22e.jpg'),
(32, 2, 'Executive Double', N'Phòng điều hành 1 giường đôi', 2, 350.00, 6, 6, 'LoungeAccess,PremiumAmenities', 'database/images/cityinn/room4.jpg,database/images/miniRoom/room32b.jpg,database/images/miniRoom/room32c.jpg,database/images/miniRoom/room32d.jpg,database/images/miniRoom/room32e.jpg'),
(42, 2, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 140.00, 15, 15, 'WiFi,TV', 'database/images/cityinn/room5.jpg,database/images/miniRoom/room42b.jpg,database/images/miniRoom/room42c.jpg,database/images/miniRoom/room42d.jpg,database/images/miniRoom/room42e.jpg'),
(52, 2, 'Junior Suite', N'Phòng Suite nhỏ, khu vực sinh hoạt riêng', 2, 380.00, 7, 7, 'WiFi,MiniLounge', 'database/images/cityinn/room6.jpg,database/images/miniRoom/room52b.jpg,database/images/miniRoom/room52c.jpg,database/images/miniRoom/room52d.jpg,database/images/miniRoom/room52e.jpg'),
(62, 2, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 155.00, 20, 18, 'WiFi,TV', 'database/images/cityinn/room7.jpg,database/images/miniRoom/room62b.jpg,database/images/miniRoom/room62c.jpg,database/images/miniRoom/room62d.jpg,database/images/miniRoom/room62e.jpg'),
(72, 2, 'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 290.00, 10, 9, 'WiFi,Balcony', 'database/images/cityinn/room8.jpg,database/images/miniRoom/room72b.jpg,database/images/miniRoom/room72c.jpg,database/images/miniRoom/room72d.jpg,database/images/miniRoom/room72e.jpg'),
(82, 2, 'Superior Twin', N'Phòng Twin cao cấp', 2, 235.00, 15, 15, 'WiFi,Minibar,Desk', 'database/images/cityinn/room9.jpg,database/images/miniRoom/room82b.jpg,database/images/miniRoom/room82c.jpg,database/images/miniRoom/room82d.jpg,database/images/miniRoom/room82e.jpg'),
(92, 2, 'Triple Room', N'Phòng 3 người', 3, 280.00, 10, 10, 'WiFi,ThreeBeds', 'database/images/cityinn/room10.jpg,database/images/miniRoom/room92b.jpg,database/images/miniRoom/room92c.jpg,database/images/miniRoom/room92d.jpg,database/images/miniRoom/room92e.jpg'),

(8, 3, N'Budget Single', N'Phòng đơn giá rẻ, tiện nghi cơ bản', 1, 90.00, 30, 25, 'WiFi,AC', 'database/images/saigon/room1.jpg,database/images/miniRoom/room8b.jpg,database/images/miniRoom/room8c.jpg,database/images/miniRoom/room8d.jpg,database/images/miniRoom/room8e.jpg'),
(18, 3, N'Studio Apartment', N'Căn hộ Studio có bếp nhỏ', 2, 200.00, 6, 6, 'Kitchenette,Laundry,WiFi', 'database/images/saigon/room2.jpg,database/images/miniRoom/room18b.jpg,database/images/miniRoom/room18c.jpg,database/images/miniRoom/room18d.jpg,database/images/miniRoom/room18e.jpg'),
(28, 3, N'Family Suite', N'Phòng Suite cho gia đình', 4, 450.00, 5, 4, 'TwoRooms,Kitchenette', 'database/images/saigon/room3.jpg,database/images/miniRoom/room28b.jpg,database/images/miniRoom/room28c.jpg,database/images/miniRoom/room28d.jpg,database/images/miniRoom/room28e.jpg'),
(38, 3, N'Connecting Twin', N'Hai phòng Twin thông nhau', 4, 380.00, 10, 10, 'WiFi,TwoRooms', 'database/images/saigon/room4.jpg,database/images/miniRoom/room38b.jpg,database/images/miniRoom/room38c.jpg,database/images/miniRoom/room38d.jpg,database/images/miniRoom/room38e.jpg'),
(49, 3, N'Corner Suite', N'Phòng Suite góc với không gian rộng', 3, 500.00, 4, 3, 'DoubleView,LoungeAccess', 'database/images/saigon/room5.jpg,database/images/miniRoom/room49b.jpg,database/images/miniRoom/room49c.jpg,database/images/miniRoom/room49d.jpg,database/images/miniRoom/room49e.jpg'),
(59, 3, N'Connecting Twin', N'Hai phòng Twin có cửa thông', 4, 370.00, 8, 8, 'WiFi,TwoRooms', 'database/images/saigon/room6.jpg,database/images/miniRoom/room59b.jpg,database/images/miniRoom/room59c.jpg,database/images/miniRoom/room59d.jpg,database/images/miniRoom/room59e.jpg'),
(69, 3, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 105.00, 15, 15, 'WiFi,TV', 'database/images/saigon/room7.jpg,database/images/miniRoom/room69b.jpg,database/images/miniRoom/room69c.jpg,database/images/miniRoom/room69d.jpg,database/images/miniRoom/room69e.jpg'),
(79, 3, N'Triple Room', N'Phòng 3 người', 3, 230.00, 10, 9, 'WiFi,ThreeBeds', 'database/images/saigon/room8.jpg,database/images/miniRoom/room79b.jpg,database/images/miniRoom/room79c.jpg,database/images/miniRoom/room79d.jpg,database/images/miniRoom/room79e.jpg'),
(89, 3, N'Junior Suite', N'Phòng Suite nhỏ', 2, 300.00, 5, 5, 'WiFi,MiniLounge', 'database/images/saigon/room9.jpg,database/images/miniRoom/room89b.jpg,database/images/miniRoom/room89c.jpg,database/images/miniRoom/room89d.jpg,database/images/miniRoom/room89e.jpg'),

(11, 4, N'Standard Double', N'Phòng tiêu chuẩn, 1 giường đôi', 2, 150.00, 20, 18, 'WiFi,Desk,AC', 'database/images/hanoi/room1.jpg,database/images/miniRoom/room11b.jpg,database/images/miniRoom/room11c.jpg,database/images/miniRoom/room11d.jpg,database/images/miniRoom/room11e.jpg'),
(21, 4, N'Attic Room', N'Phòng áp mái độc đáo', 2, 160.00, 5, 5, 'SlantedRoof,UniqueDesign', 'database/images/hanoi/room2.jpg,database/images/miniRoom/room21b.jpg,database/images/miniRoom/room21c.jpg,database/images/miniRoom/room21d.jpg,database/images/miniRoom/room21e.jpg'),
(31, 4, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 220.00, 12, 12, 'WiFi,Minibar,Desk', 'database/images/hanoi/room3.jpg,database/images/miniRoom/room31b.jpg,database/images/miniRoom/room31c.jpg,database/images/miniRoom/room31d.jpg,database/images/miniRoom/room31e.jpg'),
(41, 4, N'Superior Double', N'Phòng Double cao cấp', 2, 230.00, 10, 10, 'WiFi,Desk,Minibar', 'database/images/hanoi/room4.jpg,database/images/miniRoom/room41b.jpg,database/images/miniRoom/room41c.jpg,database/images/miniRoom/room41d.jpg,database/images/miniRoom/room41e.jpg'),
(53, 4, N'Presidential Villa', N'Biệt thự Tổng thống, hồ bơi riêng', 6, 3500.00, 1, 1, 'PrivatePool,Butler,Sauna,Bar', 'database/images/hanoi/room5.jpg,database/images/miniRoom/room53b.jpg,database/images/miniRoom/room53c.jpg,database/images/miniRoom/room53d.jpg,database/images/miniRoom/room53e.jpg'),
(63, 4, N'Attic Double', N'Phòng áp mái độc đáo 1 giường đôi', 2, 185.00, 5, 5, 'SlantedRoof,UniqueDesign', 'database/images/hanoi/room6.jpg,database/images/miniRoom/room63b.jpg,database/images/miniRoom/room63c.jpg,database/images/miniRoom/room63d.jpg,database/images/miniRoom/room63e.jpg'),
(73, 4, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 140.00, 20, 20, 'WiFi,TV', 'database/images/hanoi/room7.jpg,database/images/miniRoom/room73b.jpg,database/images/miniRoom/room73c.jpg,database/images/miniRoom/room73d.jpg,database/images/miniRoom/room73e.jpg'),
(83, 4, 'Family Room', N'Phòng gia đình cho 4 người', 4, 350.00, 8, 8, 'WiFi,TwoBeds', 'database/images/hanoi/room8.jpg,database/images/miniRoom/room83b.jpg,database/images/miniRoom/room83c.jpg,database/images/miniRoom/room83d.jpg,database/images/miniRoom/room83e.jpg'),
(93, 4, 'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 160.00, 15, 14, 'WiFi,AC', 'database/images/hanoi/room9.jpg,database/images/miniRoom/room93b.jpg,database/images/miniRoom/room93c.jpg,database/images/miniRoom/room93d.jpg,database/images/miniRoom/room93e.jpg'),

(4, 5, N'Deluxe King', N'Phòng Deluxe sang trọng, giường King size', 2, 350.00, 12, 10, 'WiFi,Minibar,Desk,AC', 'database/images/danang/room1.jpg,database/images/miniRoom/room4b.jpg,database/images/miniRoom/room4c.jpg,database/images/miniRoom/room4d.jpg,database/images/miniRoom/room4e.jpg'),
(14, 5, N'Single Economy', N'Phòng đơn tiết kiệm, không có cửa sổ', 1, 110.00, 10, 10, 'WiFi,AC', 'database/images/danang/room2.jpg,database/images/miniRoom/room14b.jpg,database/images/miniRoom/room14c.jpg,database/images/miniRoom/room14d.jpg,database/images/miniRoom/room14e.jpg'),
(24, 5, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 170.00, 15, 13, 'WiFi,AC', 'database/images/danang/room3.jpg,database/images/miniRoom/room24b.jpg,database/images/miniRoom/room24c.jpg,database/images/miniRoom/room24d.jpg,database/images/miniRoom/room24e.jpg'),
(34, 5, N'Superior Double', N'Phòng Double cao cấp', 2, 250.00, 10, 10, 'WiFi,Balcony', 'database/images/danang/room4.jpg,database/images/miniRoom/room34b.jpg,database/images/miniRoom/room34c.jpg,database/images/miniRoom/room34d.jpg,database/images/miniRoom/room34e.jpg'),
(47, 5, N'Family Suite', N'Phòng Suite cho gia đình 4 người', 4, 600.00, 5, 5, 'TwoRooms,Kitchenette,Balcony', 'database/images/danang/room5.jpg,database/images/miniRoom/room47b.jpg,database/images/miniRoom/room47c.jpg,database/images/miniRoom/room47d.jpg,database/images/miniRoom/room47e.jpg'),
(57, 5, N'Honeymoon Villa', N'Biệt thự trăng mật lãng mạn', 2, 950.00, 2, 2, 'Jacuzzi,PrivateTerrace', 'database/images/danang/room6.jpg,database/images/miniRoom/room57b.jpg,database/images/miniRoom/room57c.jpg,database/images/miniRoom/room57d.jpg,database/images/miniRoom/room57e.jpg'),
(67, 5, N'Premium Suite', N'Phòng Suite cao cấp', 3, 750.00, 4, 4, 'PrivateLoungeAccess,Minibar', 'database/images/danang/room7.jpg,database/images/miniRoom/room67b.jpg,database/images/miniRoom/room67c.jpg,database/images/miniRoom/room67d.jpg,database/images/miniRoom/room67e.jpg'),
(77, 5, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 130.00, 10, 10, 'WiFi,AC', 'database/images/danang/room8.jpg,database/images/miniRoom/room77b.jpg,database/images/miniRoom/room77c.jpg,database/images/miniRoom/room77d.jpg,database/images/miniRoom/room77e.jpg'),
(87, 5, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 310.00, 12, 12, 'WiFi,Minibar,Desk', 'database/images/danang/room9.jpg,database/images/miniRoom/room87b.jpg,database/images/miniRoom/room87c.jpg,database/images/miniRoom/room87d.jpg,database/images/miniRoom/room87e.jpg'),

(9, 6, N'Honeymoon Suite', N'Phòng dành cho tuần trăng mật lãng mạn', 2, 480.00, 2, 2, 'PrivateBalcony,Champagne,SpaAccess', 'database/images/hanoi/room1.jpg,database/images/miniRoom/room9b.jpg,database/images/miniRoom/room9c.jpg,database/images/miniRoom/room9d.jpg,database/images/miniRoom/room9e.jpg'),
(19, 6, N'Corner Deluxe', N'Phòng Deluxe góc, có hai mặt thoáng', 2, 310.00, 4, 4, 'DoubleView,Desk,Minibar', 'database/images/hanoi/room2.jpg,database/images/miniRoom/room19b.jpg,database/images/miniRoom/room19c.jpg,database/images/miniRoom/room19d.jpg,database/images/miniRoom/room19e.jpg'),
(29, 6, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 120.00, 10, 10, 'WiFi,TV', 'database/images/hanoi/room3.jpg,database/images/hanoi/room.jpg,database/images/miniRoom/room29c.jpg,database/images/miniRoom/room29d.jpg,database/images/miniRoom/room29e.jpg'),
(39, 6, N'Premium King', N'Phòng King cao cấp nhất', 2, 450.00, 3, 3, 'LoungeAccess,EspressoMachine', 'database/images/hanoi/room4.jpg,database/images/miniRoom/room39b.jpg,database/images/miniRoom/room39c.jpg,database/images/miniRoom/room39d.jpg,database/images/miniRoom/room39e.jpg'),
(50, 6, N'Standard Double', N'Phòng tiêu chuẩn, 1 giường đôi', 2, 145.00, 20, 19, 'WiFi,Desk,AC', 'database/images/hanoi/room5.jpg,database/images/miniRoom/room50b.jpg,database/images/miniRoom/room50c.jpg,database/images/miniRoom/room50d.jpg,database/images/miniRoom/room50e.jpg'),
(60, 6, N'Superior Single', N'Phòng đơn cao cấp', 1, 170.00, 15, 15, 'WiFi,AC,Minibar', 'database/images/hanoi/room6.jpg,database/images/miniRoom/room60b.jpg,database/images/miniRoom/room60c.jpg,database/images/miniRoom/room60d.jpg,database/images/miniRoom/room60e.jpg'),
(70, 6, N'Quad Room', N'Phòng 4 giường đơn', 4, 330.00, 7, 7, 'FourBeds,Desk', 'database/images/hanoi/room7.jpg,database/images/miniRoom/room70b.jpg,database/images/miniRoom/room70c.jpg,database/images/miniRoom/room70d.jpg,database/images/miniRoom/room70e.jpg'),
(80, 6, N'Deluxe King', N'Phòng King Deluxe', 2, 360.00, 10, 10, 'WiFi,Balcony', 'database/images/hanoi/room8.jpg,database/images/miniRoom/room80b.jpg,database/images/miniRoom/room80c.jpg,database/images/miniRoom/room80d.jpg,database/images/miniRoom/room80e.jpg'),
(90, 6, N'Premium Suite', N'Phòng Suite cao cấp nhất', 3, 680.00, 2, 2, 'EspressoMachine,PrivateBalcony', 'database/images/hanoi/room9.jpg,database/images/miniRoom/room90b.jpg,database/images/miniRoom/room90c.jpg,database/images/miniRoom/room90d.jpg,database/images/miniRoom/room90e.jpg'),

(10, 7, N'Triple Room', N'Phòng 3 người, phù hợp nhóm bạn', 3, 250.00, 15, 15, 'WiFi,TV,Desk', 'database/images/hue/room1.jpg,database/images/miniRoom/room10b.jpg,database/images/miniRoom/room10c.jpg,database/images/miniRoom/room10d.jpg,database/images/miniRoom/room10e.jpg'),
(20, 7, N'Connecting Room', N'Hai phòng tiêu chuẩn có cửa thông nhau', 4, 400.00, 10, 8, 'WiFi,TwoTVs,TwoBaths', 'database/images/hue/room2.jpg,database/images/miniRoom/room20b.jpg,database/images/miniRoom/room20c.jpg,database/images/miniRoom/room20d.jpg,database/images/miniRoom/room20e.jpg'),
(30, 7, N'Quad Room', N'Phòng 4 giường đơn', 4, 300.00, 8, 8, 'FourBeds,Desk', 'database/images/hue/room3.jpg,database/images/miniRoom/room30b.jpg,database/images/miniRoom/room30c.jpg,database/images/miniRoom/room30d.jpg,database/images/miniRoom/room30e.jpg'),
(40, 7, N'Single Economy', N'Phòng đơn tiêu chuẩn, giá thấp', 1, 85.00, 15, 15, 'WiFi,AC', 'database/images/hue/room4.jpg,database/images/miniRoom/room40b.jpg,database/images/miniRoom/room40c.jpg,database/images/miniRoom/room40d.jpg,database/images/miniRoom/room40e.jpg'),
(44, 7, N'Deluxe King', N'Phòng Deluxe sang trọng, giường King size', 2, 330.00, 15, 12, 'WiFi,Minibar,Desk,AC', 'database/images/hue/room5.jpg,database/images/miniRoom/room44b.jpg,database/images/miniRoom/room44c.jpg,database/images/miniRoom/room44d.jpg,database/images/miniRoom/room44e.jpg'),
(54, 7, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 160.00, 20, 17, 'WiFi,AC', 'database/images/hue/room6.jpg,database/images/miniRoom/room54b.jpg,database/images/miniRoom/room54c.jpg,database/images/miniRoom/room54d.jpg,database/images/miniRoom/room54e.jpg'),
(64, 7, N'Family Connected', N'Phòng gia đình có cửa thông nhau', 5, 490.00, 6, 6, 'TwoBaths,TwoTVs', 'database/images/hue/room7.jpg,database/images/miniRoom/room64b.jpg,database/images/miniRoom/room64c.jpg,database/images/miniRoom/room64d.jpg,database/images/miniRoom/room64e.jpg'),
(74, 7, N'Superior Double', N'Phòng Double cao cấp', 2, 270.00, 10, 10, 'WiFi,Minibar,Desk', 'database/images/hue/room8.jpg,database/images/miniRoom/room74b.jpg,database/images/miniRoom/room74c.jpg,database/images/miniRoom/room74d.jpg,database/images/miniRoom/room74e.jpg'),
(84, 7, 'Business Twin', N'Phòng Twin cho khách công tác', 2, 250.00, 10, 10, 'HighSpeedWiFi,Desk', 'database/images/hue/room9.jpg,database/images/miniRoom/room84b.jpg,database/images/miniRoom/room84c.jpg,database/images/miniRoom/room84d.jpg,database/images/miniRoom/room84e.jpg'),

(5, 8, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn, tầm nhìn thành phố', 2, 180.00, 25, 20, 'WiFi,TV,Desk', 'database/images/nhatrang/room1.jpg,database/images/miniRoom/room5b.jpg,database/images/miniRoom/room5c.jpg,database/images/miniRoom/room5d.jpg,database/images/miniRoom/room5e.jpg'),
(15, 8, N'Presidential Suite', N'Phòng tổng thống, tiện nghi cao cấp nhất', 4, 2500.00, 1, 1, 'PrivateChef,Sauna,Gym,Bar', 'database/images/nhatrang/room2.jpg,database/images/miniRoom/room15b.jpg,database/images/miniRoom/room15c.jpg,database/images/miniRoom/room15d.jpg,database/images/miniRoom/room15e.jpg'),
(25, 8, N'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 280.00, 10, 8, 'WiFi,Balcony,Seaview', 'database/images/nhatrang/room3.jpg,database/images/miniRoom/room25b.jpg,database/images/miniRoom/room25c.jpg,database/images/miniRoom/room25d.jpg,database/images/miniRoom/room25e.jpg'),
(35, 8, N'Family Connected', N'Phòng gia đình có cửa thông', 5, 480.00, 5, 5, 'TwoBaths,TwoTVs', 'database/images/nhatrang/room4.jpg,database/images/miniRoom/room35b.jpg,database/images/miniRoom/room35c.jpg,database/images/miniRoom/room35d.jpg,database/images/miniRoom/room35e.jpg'),
(48, 8, N'Single Economy', N'Phòng đơn giá rẻ, tiện nghi cơ bản', 1, 100.00, 30, 28, 'WiFi,AC', 'database/images/nhatrang/room5.jpg,database/images/miniRoom/room48b.jpg,database/images/miniRoom/room48c.jpg,database/images/miniRoom/room48d.jpg,database/images/miniRoom/room48e.jpg'),
(58, 8, N'Business King', N'Phòng King size cho khách công tác', 1, 220.00, 12, 11, 'HighSpeedWiFi,LargeDesk', 'database/images/nhatrang/room6.jpg,database/images/miniRoom/room58b.jpg,database/images/miniRoom/room58c.jpg,database/images/miniRoom/room58d.jpg,database/images/miniRoom/room58e.jpg'),
(68, 8, N'Studio Apartment', N'Căn hộ Studio có bếp nhỏ', 2, 230.00, 5, 4, 'Kitchenette,Laundry,WiFi', 'database/images/nhatrang/room7.jpg,database/images/miniRoom/room68b.jpg,database/images/miniRoom/room68c.jpg,database/images/miniRoom/room68d.jpg,database/images/miniRoom/room68e.jpg'),
(78, 8, N'Executive Suite', N'Phòng Suite điều hành', 3, 620.00, 3, 3, 'LoungeAccess,DiningArea', 'database/images/nhatrang/room8.jpg,database/images/miniRoom/room78b.jpg,database/images/miniRoom/room78c.jpg,database/images/miniRoom/room78d.jpg,database/images/miniRoom/room78e.jpg'),
(88, 8, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 195.00, 20, 20, 'WiFi,TV', 'database/images/nhatrang/room9.jpg,database/images/miniRoom/room88b.jpg,database/images/miniRoom/room88c.jpg,database/images/miniRoom/room88d.jpg,database/images/miniRoom/room88e.jpg'),

(13, 9, N'Beachfront Villa', N'Biệt thự sát biển có hồ bơi riêng', 4, 1200.00, 1, 1, 'PrivatePool,Kitchen,Seaview,Butler', 'database/images/phuquoc/room1.jpg,database/images/miniRoom/room13b.jpg,database/images/miniRoom/room13c.jpg,database/images/miniRoom/room13d.jpg,database/images/miniRoom/room13e.jpg'),
(23, 9, N'Premium Suite', N'Phòng Suite cao cấp', 3, 650.00, 4, 3, 'PrivateLoungeAccess,Minibar', 'database/images/phuquoc/room2.jpg,database/images/miniRoom/room23b.jpg,database/images/miniRoom/room23c.jpg,database/images/miniRoom/room23d.jpg,database/images/miniRoom/room23e.jpg'),
(33, 9, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 190.00, 15, 14, 'WiFi,AC', 'database/images/phuquoc/room3.jpg,database/images/miniRoom/room33b.jpg,database/images/miniRoom/room33c.jpg,database/images/miniRoom/room33d.jpg,database/images/miniRoom/room33e.jpg'),
(43, 9, N'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 270.00, 10, 9, 'WiFi,Balcony', 'database/images/phuquoc/room4.jpg,database/images/miniRoom/room43b.jpg,database/images/miniRoom/room43c.jpg,database/images/miniRoom/room43d.jpg,database/images/miniRoom/room43e.jpg'),
(51, 9, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn, view đẹp', 2, 350.00, 18, 18, 'WiFi,Minibar,Desk', 'database/images/phuquoc/room5.jpg,database/images/miniRoom/room51b.jpg,database/images/miniRoom/room51c.jpg,database/images/miniRoom/room51d.jpg,database/images/miniRoom/room51e.jpg'),
(61, 9, N'Garden View Bungalow', N'Bungalow nhìn ra vườn', 2, 310.00, 10, 9, 'Terrace,Hammock', 'database/images/phuquoc/room6.jpg,database/images/miniRoom/room61b.jpg,database/images/miniRoom/room61c.jpg,database/images/miniRoom/room61d.jpg,database/images/miniRoom/room61e.jpg'),
(71, 9, N'Luxury Villa', N'Biệt thự sang trọng với tầm nhìn biển', 5, 1800.00, 1, 1, 'OceanView,PrivatePool,Butler', 'database/images/phuquoc/room7.jpg,database/images/miniRoom/room71b.jpg,database/images/miniRoom/room71c.jpg,database/images/miniRoom/room71d.jpg,database/images/miniRoom/room71e.jpg'),
(81, 9, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 200.00, 20, 18, 'WiFi,AC', 'database/images/phuquoc/room8.jpg,database/images/miniRoom/room81b.jpg,database/images/miniRoom/room81c.jpg,database/images/miniRoom/room81d.jpg,database/images/miniRoom/room81e.jpg'),
(91, 9, N'Connecting King', N'Hai phòng King thông nhau', 4, 750.00, 3, 3, 'TwoRooms,KingBeds', 'database/images/phuquoc/room9.jpg,database/images/miniRoom/room91b.jpg,database/images/miniRoom/room91c.jpg,database/images/miniRoom/room91d.jpg,database/images/miniRoom/room91e.jpg'),

(7, 10, N'Family Room', N'Phòng lớn cho gia đình có 4 người', 4, 320.00, 7, 7, 'WiFi,TwoBeds,KidsPlay', 'database/images/dalat/room1.jpg,database/images/miniRoom/room7b.jpg,database/images/miniRoom/room7c.jpg,database/images/miniRoom/room7d.jpg,database/images/miniRoom/room7e.jpg'),
(17, 10, N'Bungalow Garden View', N'Bungalow nhìn ra vườn, yên tĩnh', 2, 280.00, 8, 5, 'Terrace,Hammock,AC', 'database/images/dalat/room2.jpg,database/images/miniRoom/room17b.jpg,database/images/miniRoom/room17c.jpg,database/images/miniRoom/room17d.jpg,database/images/miniRoom/room17e.jpg'),
(27, 10, N'Superior King', N'Phòng King cao cấp', 2, 260.00, 15, 15, 'WiFi,Minibar', 'database/images/dalat/room3.jpg,database/images/miniRoom/room27b.jpg,database/images/miniRoom/room27c.jpg,database/images/miniRoom/room27d.jpg,database/images/miniRoom/room27e.jpg'),
(37, 10, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 165.00, 20, 20, 'WiFi,AC', 'database/images/dalat/room4.jpg,database/images/miniRoom/room37b.jpg,database/images/miniRoom/room37c.jpg,database/images/miniRoom/room37d.jpg,database/images/miniRoom/room37e.jpg'),
(45, 10, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 175.00, 25, 25, 'WiFi,TV,Desk', 'database/images/dalat/room5.jpg,database/images/miniRoom/room45b.jpg,database/images/miniRoom/room45c.jpg,database/images/miniRoom/room45d.jpg,database/images/miniRoom/room45e.jpg'),
(55, 10, N'Executive Twin', N'Phòng Twin điều hành, tiện nghi cao cấp', 2, 300.00, 10, 10, 'LoungeAccess,PremiumAmenities', 'database/images/dalat/room6.jpg,database/images/miniRoom/room55b.jpg,database/images/miniRoom/room55c.jpg,database/images/miniRoom/room55d.jpg,database/images/miniRoom/room55e.jpg'),
(65, 10, N'Deluxe King', N'Phòng King Deluxe, view đẹp', 2, 290.00, 15, 15, 'WiFi,Balcony,CityView', 'database/images/dalat/room7.jpg,database/images/miniRoom/room65b.jpg,database/images/miniRoom/room65c.jpg,database/images/miniRoom/room65d.jpg,database/images/miniRoom/room65e.jpg'),
(75, 10, N'Single Economy', N'Phòng đơn tiết kiệm', 1, 95.00, 10, 10, 'WiFi,AC', 'database/images/dalat/room8.jpg,database/images/miniRoom/room75b.jpg,database/images/miniRoom/room75c.jpg,database/images/miniRoom/room75d.jpg,database/images/miniRoom/room75e.jpg'),
(85, 10, N'Connecting Double', N'Hai phòng Double thông nhau', 4, 420.00, 5, 5, 'WiFi,TwoRooms', 'database/images/dalat/room9.jpg,database/images/miniRoom/room85b.jpg,database/images/miniRoom/room85c.jpg,database/images/miniRoom/room85d.jpg,database/images/miniRoom/room85e.jpg'),

(94, 11, N'Standard Double', N'Phòng đôi tiêu chuẩn nhìn ra sông', 2, 115.00, 10, 8, 'WiFi,RiverView', 'database/images/cantho/room1.jpg,database/images/miniRoom/room94b.jpg,database/images/miniRoom/room94c.jpg,database/images/miniRoom/room94d.jpg,database/images/miniRoom/room94e.jpg'),
(95, 11, N'Triple Room', N'Phòng 3 người', 3, 150.00, 5, 4, 'WiFi,ThreeBeds', 'database/images/cantho/room2.jpg,database/images/miniRoom/room95b.jpg,database/images/miniRoom/room95c.jpg,database/images/miniRoom/room95d.jpg,database/images/miniRoom/room95e.jpg'),
(96, 11, N'Suite River View', N'Phòng Suite cao cấp nhìn toàn cảnh sông', 2, 250.00, 2, 2, 'Balcony,Minibar,RiverView', 'database/images/cantho/room3.jpg,database/images/miniRoom/room96b.jpg,database/images/miniRoom/room96c.jpg,database/images/miniRoom/room96d.jpg,database/images/miniRoom/room96e.jpg'),

(97, 12, N'Deluxe King', N'Phòng Deluxe có ban công nhìn ra vịnh', 2, 380.00, 15, 12, 'WiFi,BayView,Balcony', 'database/images/halong/room1.jpg,database/images/miniRoom/room97b.jpg,database/images/miniRoom/room97c.jpg,database/images/miniRoom/room97d.jpg,database/images/miniRoom/room97e.jpg'),
(98, 12, N'Presidential Suite', N'Phòng Tổng thống cao cấp nhất', 4, 1500.00, 1, 1, 'PrivateTerrace,SpaAccess', 'database/images/halong/room2.jpg,database/images/miniRoom/room98b.jpg,database/images/miniRoom/room98c.jpg,database/images/miniRoom/room98d.jpg,database/images/miniRoom/room98e.jpg'),

(99, 13, N'Single Economy', N'Phòng đơn tiết kiệm, không có cửa sổ', 1, 60.00, 20, 18, 'WiFi,AC', 'database/images/kimlong/room1.jpg,database/images/miniRoom/room99b.jpg,database/images/miniRoom/room99c.jpg,database/images/miniRoom/room99d.jpg,database/images/miniRoom/room99e.jpg'),

(100, 14, N'Mountain View Deluxe', N'Phòng Deluxe nhìn ra núi', 2, 220.00, 10, 10, 'Heating,MountainView', 'database/images/saparetreat/room1.jpg,database/images/miniRoom/room100b.jpg,database/images/miniRoom/room100c.jpg,database/images/miniRoom/room100d.jpg,database/images/miniRoom/room100e.jpg'),
(101, 14, N'Family Bungalow', N'Bungalow gia đình', 4, 350.00, 5, 5, 'Fireplace,FourBeds', 'database/images/saparetreat/room2.jpg,database/images/miniRoom/room101b.jpg,database/images/miniRoom/room101c.jpg,database/images/miniRoom/room101d.jpg,database/images/miniRoom/room101e.jpg'),
(102, 14, N'Premium Suite', N'Phòng Suite cao cấp có lò sưởi', 2, 450.00, 3, 2, 'Hammam,LoungeAccess', 'database/images/saparetreat/room3.jpg,database/images/miniRoom/room102b.jpg,database/images/miniRoom/room102c.jpg,database/images/miniRoom/room102d.jpg,database/images/miniRoom/room102e.jpg'),

(103, 15, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 130.00, 15, 15, 'WiFi,BeachAccess', 'database/images/vungtau/room1.jpg,database/images/miniRoom/room103b.jpg,database/images/miniRoom/room103c.jpg,database/images/miniRoom/room103d.jpg,database/images/miniRoom/room103e.jpg'),
(104, 15, N'Family Room', N'Phòng lớn cho gia đình', 4, 200.00, 8, 8, 'KidsClub,TwoBeds', 'database/images/vungtau/room2.jpg,database/images/miniRoom/room104b.jpg,database/images/miniRoom/room104c.jpg,database/images/miniRoom/room104d.jpg,database/images/miniRoom/room104e.jpg'),

(105, 16, N'Deluxe King Seaview', N'Phòng King Deluxe nhìn ra biển', 2, 250.00, 12, 10, 'WiFi,Seaview,Balcony', 'database/images/quynhon/room1.jpg,database/images/miniRoom/room105b.jpg,database/images/miniRoom/room105c.jpg,database/images/miniRoom/room105d.jpg,database/images/miniRoom/room105e.jpg'),
(106, 16, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 170.00, 15, 15, 'WiFi,AC', 'database/images/quynhon/room2.jpg,database/images/miniRoom/room106b.jpg,database/images/miniRoom/room106c.jpg,database/images/miniRoom/room106d.jpg,database/images/miniRoom/room106e.jpg'),
(107, 16, N'Executive Suite', N'Phòng Suite điều hành', 2, 400.00, 3, 3, 'GymAccess,Minibar', 'database/images/quynhon/room3.jpg,database/images/miniRoom/room107b.jpg,database/images/miniRoom/room107c.jpg,database/images/miniRoom/room107d.jpg,database/images/miniRoom/room107e.jpg'),

(108, 17, N'Standard Double', N'Phòng đôi tiêu chuẩn', 2, 85.00, 25, 20, 'WiFi,Breakfast', 'database/images/thanhhoa/room1.jpg,database/images/miniRoom/room108b.jpg,database/images/miniRoom/room108c.jpg,database/images/miniRoom/room108d.jpg,database/images/miniRoom/room108e.jpg'),

(109, 18, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 70.00, 10, 10, 'WiFi,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(110, 18, N'Superior Double', N'Phòng đôi cao cấp', 2, 120.00, 8, 8, 'WiFi,Minibar', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(111, 19, N'Private Pool Villa', N'Biệt thự hồ bơi riêng biệt', 2, 850.00, 5, 5, 'PrivatePool,Massage,Seaview', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(112, 19, N'Deluxe King', N'Phòng King Deluxe nhìn ra biển', 2, 350.00, 10, 9, 'Balcony,Seaview', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(113, 19, N'Ocean Star Suite', N'Phòng Suite cao cấp nhất của resort', 4, 1500.00, 1, 1, 'ButlerService,PrivateBar', 'database/images/all/room3.jpg,database/images/all/room7.jpg,database/images/miniRoom/room110c.jpg'),

(114, 20, N'Mountain View Double', N'Phòng đôi có tầm nhìn ra núi', 2, 100.00, 15, 15, 'Heating,MountainView', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(115, 21, N'Superior Twin', N'Phòng Twin cao cấp', 2, 180.00, 10, 10, 'WiFi,GardenView', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(116, 21, N'Bungalow Garden', N'Bungalow có vườn riêng', 2, 250.00, 5, 5, 'Terrace,BikeRental', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(117, 21, N'Family Connected', N'Phòng gia đình có cửa thông', 4, 380.00, 3, 3, 'TwoRooms,FourBeds', 'database/images/all/room3.jpg,database/images/all/room7.jpg,database/images/miniRoom/room110c.jpg'),

(118, 22, N'Standard Double', N'Phòng đôi tiêu chuẩn', 2, 95.00, 15, 15, 'WiFi,Desk', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(119, 22, N'Business King', N'Phòng King cho khách công tác', 2, 150.00, 8, 8, 'BusinessCenter,Desk', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(120, 23, 'Executive King', 'High floor room with premium amenities', 2, 450.00, 10, 9, 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(121, 23, 'Tokyo Suite', 'Spacious suite with skyline view', 3, 900.00, 3, 3, 'SpaAccess,PrivateBar', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(122, 24, 'Standard Double', 'Double room overlooking the street', 2, 175.00, 15, 15, 'WiFi,Breakfast', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(123, 25, 'Single Economy', 'Small single room, shared bathroom option', 1, 40.00, 20, 20, 'Fan,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(124, 25, 'Standard Twin', 'Twin room with river access', 2, 80.00, 15, 13, 'WiFi,RiverAccess', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(125, 25, 'Family Room', 'Basic room for 4 people', 4, 120.00, 5, 5, 'AC,FourBeds', 'database/images/all/room3.jpg,database/images/all/room5.jpg,database/images/miniRoom/room110c.jpg'),

(126, 26, 'Deluxe Seaview', 'Luxury room with direct sea view', 2, 600.00, 10, 9, 'Seaview,Balcony,SpaAccess', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(127, 26, 'Royal Suite', 'Highest tier suite with personalized service', 4, 2500.00, 1, 1, 'ButlerService,PrivatePool', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(128, 27, 'Studio Apartment', 'Self-catering studio with kitchenette', 2, 230.00, 10, 10, 'Kitchenette,WiFi,SelfCheckIn', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(129, 27, 'One-Bedroom Suite', 'Separate living room and bedroom', 3, 350.00, 5, 4, 'FullKitchen,Laundry', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(130, 27, 'Executive Studio', 'Larger studio with premium furnishings', 2, 280.00, 8, 8, 'Kitchenette,Desk', 'database/images/all/room3.jpg,database/images/all/room7.jpg,database/images/miniRoom/room110c.jpg'),

(131, 28, 'Opera View Deluxe', 'Room with direct view of the Opera House', 2, 350.00, 15, 15, 'HarbourView,Balcony,PoolAccess', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(132, 29, 'Standard Double', 'Double room with city view', 2, 150.00, 20, 18, 'WiFi,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(133, 29, 'Hammam Suite', 'Suite with private access to Hammam area', 2, 300.00, 5, 5, 'HammamAccess,Minibar', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(134, 30, 'Standard Single', 'Single room near the beach', 1, 100.00, 10, 10, 'WiFi,BeachService', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(135, 30, 'Ocean View Double', 'Double room with Copacabana view', 2, 180.00, 15, 14, 'Seaview,Balcony', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(136, 30, 'Family Room', 'Room for 4 people with bunk beds', 4, 250.00, 5, 5, 'FourBeds,AC', 'database/images/all/room4.jpg,database/images/all/room5.jpg,database/images/miniRoom/room110c.jpg'),

(137, 31, 'Business King', 'King room with large working area', 1, 200.00, 15, 15, 'Desk,BusinessCenter', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(138, 31, 'Meeting Suite', 'Suite with small conference table', 3, 400.00, 5, 5, 'ConferenceTable,Minibar', 'database/images/all/room4.jpg,database/images/all/room2.jpg,database/images/miniRoom/room110c.jpg'),

(139, 32, 'Shared Dorm Bed', 'Bed in a 6-person shared dorm', 1, 35.00, 50, 45, 'SharedKitchen,Lockers', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(140, 33, 'Deluxe Mountain View', 'Room overlooking Table Mountain', 2, 300.00, 10, 9, 'MountainView,Balcony,SpaAccess', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(141, 33, 'Ocean King', 'King room with ocean view', 2, 380.00, 8, 8, 'Seaview,Minibar', 'database/images/all/room4.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(142, 33, 'Infinity Pool Suite', 'Suite with access to infinity pool area', 4, 700.00, 3, 3, 'InfinityPoolAccess,WineTours', 'database/images/all/room3.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(143, 34, 'Art Studio King', 'Unique room with local art pieces', 2, 190.00, 10, 10, 'ArtGalleryAccess,WiFi', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(144, 34, 'Gallery Suite', 'Spacious suite near the on-site gallery', 3, 320.00, 5, 5, 'GalleryAccess,Bar', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(145, 35, 'Standard Double', 'Double room in historic center', 2, 160.00, 15, 15, 'WiFi,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(146, 35, 'Rooftop View King', 'King room with view of the Zocalo', 2, 240.00, 10, 8, 'RooftopAccess,CityView', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(147, 35, 'Colonial Suite', 'Suite with traditional furnishings', 3, 400.00, 5, 5, 'SaunaAccess,PoolAccess', 'database/images/all/room4.jpg,database/images/all/room5.jpg,database/images/miniRoom/room110c.jpg'),

(148, 36, 'Deluxe River View', 'Luxury room overlooking the river', 2, 220.00, 15, 15, 'RiverView,CasinoAccess', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(149, 37, 'Standard Double', 'Double room with pet access', 2, 215.00, 10, 10, 'PetFriendly,WiFi', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(150, 37, 'Golden Gate Balcony', 'Room with balcony view of Golden Gate Bridge', 2, 380.00, 5, 5, 'BridgeView,Balcony', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(151, 38, 'Courtyard Single', 'Small room overlooking the courtyard', 1, 80.00, 10, 10, 'GardenView,TeaHouseAccess', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(152, 38, 'Traditional Double', 'Double room with traditional Chinese decor', 2, 120.00, 8, 8, 'BikeRental,AC', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),
(153, 38, 'Hutong Family Room', 'Large room for 4 people', 4, 200.00, 5, 5, 'FourBeds,GardenAccess', 'database/images/all/room4.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(154, 39, 'Canal View Double', 'Double room overlooking the canal', 2, 200.00, 10, 10, 'CanalView,Breakfast', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),

(155, 40, 'Opera View King', 'King room with view of the Opera House', 2, 350.00, 10, 10, 'MusicLoungeAccess,CityView', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(157, 40, 'Standard Double', 'Standard double room', 2, 250.00, 15, 12, 'WiFi,AC', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(158, 41, 'Mughal King', 'King room with Mughal-inspired decor', 2, 160.00, 15, 15, 'PoolAccess,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg'),
(159, 41, 'Events Suite', 'Suite near event and conference areas', 3, 300.00, 5, 4, 'CateringService,Minibar', 'database/images/all/room2.jpg,database/images/all/room6.jpg,database/images/miniRoom/room110c.jpg'),

(160, 42, N'Standard Twin', N'Phòng Twin tiêu chuẩn, tiện nghi cơ bản', 2, 50.00, 10, 10, 'CommonAreaAccess,AC', 'database/images/all/room1.jpg,database/images/all/room5.jpg,database/images/miniRoom/room109c.jpg');
-- Dữ liệu mẫu cho bảng Booking
INSERT INTO Booking (userId, hotelId, roomId, checkInDate, checkOutDate, numberOfRooms, numberOfGuests, guestName, guestEmail, guestPhone, specialRequests, totalAmount, bookingStatus, createdAt, paymentMethod, paymentStatus) VALUES
-- Booking đã hoàn thành
(1, 1, 1, '2024-12-01', '2024-12-05', 1, 2, 'Nguyễn Văn An', 'nguyenvanan@email.com', '0901234567', 'Giường đôi, tầng cao, view biển', 12000000.00, 'Completed', '2024-11-20 10:30:00', 'Credit Card', 'Paid'),
(2, 2, 5, '2024-12-10', '2024-12-12', 1, 1, 'Trần Thị Bình', 'tranbinhthi@email.com', '0912345678', 'Check-in sớm nếu có thể', 3500000.00, 'Completed', '2024-12-01 14:20:00', 'Bank Transfer', 'Paid'),
(3, 3, 9, '2024-12-15', '2024-12-20', 2, 4, 'Lê Hoàng Cường', 'lehoangcuong@email.com', '0923456789', 'Cần 2 phòng kế bên nhau, có nôi em bé', 18000000.00, 'Completed', '2024-12-05 09:15:00', 'Cash', 'Paid'),

-- Booking đã xác nhận (sắp tới)
(4, 1, 2, '2025-01-15', '2025-01-18', 1, 2, 'Phạm Minh Đức', 'phamminhduc@email.com', '0934567890', 'Phòng yên tĩnh, tránh xa thang máy', 9000000.00, 'Confirmed', '2024-12-28 16:45:00', 'Credit Card', 'Paid'),
(5, 4, 13, '2025-01-20', '2025-01-25', 1, 3, 'Hoàng Thị Hoa', 'hoangthihoa@email.com', '0945678901', 'Cần thêm 1 giường phụ cho trẻ em', 7500000.00, 'Confirmed', '2025-01-02 11:30:00', 'E-wallet', 'Paid'),
(1, 5, 17, '2025-02-01', '2025-02-05', 1, 2, 'Nguyễn Văn An', 'nguyenvanan@email.com', '0901234567', 'Kỷ niệm ngày cưới, muốn trang trí lãng mạn', 16000000.00, 'Confirmed', '2025-01-05 10:00:00', 'Credit Card', 'Paid'),
(6, 2, 6, '2025-01-25', '2025-01-28', 1, 2, 'Vũ Đức Anh', 'vuducanh@email.com', '0956789012', 'Không hút thuốc, cần bàn làm việc', 5250000.00, 'Confirmed', '2025-01-08 13:20:00', 'Bank Transfer', 'Paid'),

-- Booking đang chờ xử lý
(7, 3, 10, '2025-01-30', '2025-02-03', 1, 2, 'Đặng Thị Mai', 'dangthimai@email.com', '0967890123', 'Dị ứng lông động vật', 8000000.00, 'Pending', '2025-01-07 15:30:00', 'Credit Card', 'Pending'),
(8, 1, 3, '2025-02-10', '2025-02-15', 2, 5, 'Bùi Văn Hùng', 'buivanhung@email.com', '0978901234', 'Đoàn gia đình, cần 2 phòng liền kề, có bữa sáng', 15000000.00, 'Pending', '2025-01-08 09:45:00', 'Bank Transfer', 'Pending'),

-- Booking đã hủy
(2, 4, 14, '2024-12-20', '2024-12-23', 1, 1, 'Trần Thị Bình', 'tranbinhthi@email.com', '0912345678', 'Có việc đột xuất, cần hủy', 4500000.00, 'Cancelled', '2024-12-10 08:00:00', 'Credit Card', 'Refunded'),
(9, 5, 18, '2025-01-10', '2025-01-12', 1, 2, 'Ngô Quốc Tuấn', 'ngoquoctuan@email.com', '0989012345', 'Thay đổi kế hoạch du lịch', 6400000.00, 'Cancelled', '2024-12-25 14:30:00', 'E-wallet', 'Refunded'),

-- Booking đang Check-in (khách đang ở)
(10, 2, 7, '2025-01-07', '2025-01-10', 1, 2, 'Phan Thị Lan', 'phanthilan@email.com', '0990123456', 'Cần phòng view đẹp', 5250000.00, 'Checked-in', '2025-01-01 10:20:00', 'Cash', 'Paid'),
(3, 1, 4, '2025-01-06', '2025-01-09', 1, 3, 'Lê Hoàng Cường', 'lehoangcuong@email.com', '0923456789', 'Cần giường phụ', 9000000.00, 'Checked-in', '2024-12-30 16:00:00', 'Credit Card', 'Paid'),

-- Booking đã Check-out
(4, 3, 11, '2025-01-01', '2025-01-05', 1, 2, 'Phạm Minh Đức', 'phamminhduc@email.com', '0934567890', 'Đón năm mới', 10000000.00, 'Checked-out', '2024-12-20 11:00:00', 'Bank Transfer', 'Paid'),

-- Booking với yêu cầu đặc biệt
(11, 4, 15, '2025-02-14', '2025-02-16', 1, 2, 'Trương Văn Nam', 'truongvannam@email.com', '0901112233', 'Ngày Valentine, cần hoa tươi và rượu vang trong phòng', 6000000.00, 'Confirmed', '2025-01-08 18:00:00', 'Credit Card', 'Paid'),
(12, 5, 19, '2025-03-01', '2025-03-07', 1, 1, 'Lý Thị Thu', 'lythithu@email.com', '0912223344', 'Công tác, cần hóa đơn VAT', 19200000.00, 'Confirmed', '2025-01-07 09:30:00', 'Bank Transfer', 'Paid'),

-- Booking nhóm lớn
(1, 1, 1, '2025-03-15', '2025-03-20', 3, 6, 'Nguyễn Văn An', 'nguyenvanan@email.com', '0901234567', 'Du lịch gia đình lớn, cần 3 phòng gần nhau', 36000000.00, 'Pending', '2025-01-08 14:00:00', 'Bank Transfer', 'Pending'),

-- Booking đặt trước lâu
(13, 2, 8, '2025-04-25', '2025-04-30', 1, 2, 'Đinh Thị Hương', 'dinhthihuong@email.com', '0923334455', 'Lễ 30/4, đặt trước', 8750000.00, 'Confirmed', '2025-01-05 10:30:00', 'E-wallet', 'Paid'),

-- Booking cuối tuần
(14, 3, 12, '2025-01-17', '2025-01-19', 1, 2, 'Võ Minh Tuấn', 'vominhtuan@email.com', '0934445566', 'Nghỉ cuối tuần', 4800000.00, 'Confirmed', '2025-01-08 08:15:00', 'Credit Card', 'Paid'),

-- Booking với thanh toán tại chỗ
(15, 4, 16, '2025-01-22', '2025-01-24', 1, 1, 'Mai Thị Nga', 'maithinga@email.com', '0945556677', 'Thanh toán khi nhận phòng', 3000000.00, 'Confirmed', '2025-01-08 12:00:00', 'Cash', 'Pending'),

-- Booking dài hạn
(5, 5, 20, '2025-02-01', '2025-02-28', 1, 1, 'Đỗ Văn Phong', 'dovanphong@email.com', '0956667788', 'Thuê dài hạn 1 tháng, công tác', 56000000.00, 'Confirmed', '2025-01-08 16:30:00', 'Bank Transfer', 'Paid'),

-- Booking khẩn cấp (same day)
(16, 1, 2, '2025-01-08', '2025-01-09', 1, 1, 'Lê Thị Tâm', 'lethitam@email.com', '0967778899', 'Đặt phòng khẩn cấp, chuyến bay delay', 3000000.00, 'Confirmed', '2025-01-08 19:00:00', 'Credit Card', 'Paid');
INSERT INTO Payment (paymentId, bookingId, paymentMethod, amount, paymentStatus, transactionId)
VALUES
(4, 4, 'Bank Transfer', 180.00, 'Completed', 'TXN004A'),
(5, 5, 'Credit Card', 1400.00, 'Pending', 'TXN005B'),
(6, 6, 'PayPal', 640.00, 'Completed', 'TXN006C'),
(7, 7, 'Credit Card', 360.00, 'Completed', 'TXN007D'),
(8, 8, 'Bank Transfer', 4800.00, 'Completed', 'TXN008E'),
(9, 9, 'Credit Card', 450.00, 'Pending', 'TXN009F'),
(10, 10, 'PayPal', 960.00, 'Completed', 'TXN010G'),
(11, 11, 'Bank Transfer', 1000.00, 'Completed', 'TXN011H'),
(12, 12, 'Credit Card', 2750.00, 'Completed', 'TXN012I'),
(13, 13, 'Credit Card', 420.00, 'Refunded', 'TXN013J'),      -- Cancelled Booking -> Refunded
(14, 14, 'PayPal', 390.00, 'Completed', 'TXN014K'),
(15, 15, 'Bank Transfer', 900.00, 'Pending', 'TXN015L'),
(16, 16, 'Credit Card', 720.00, 'Completed', 'TXN016M'),
(17, 17, 'PayPal', 380.00, 'Completed', 'TXN017N'),
(18, 18, 'Bank Transfer', 360.00, 'Pending', 'TXN018O'),
(19, 19, 'Credit Card', 3400.00, 'Completed', 'TXN019P'),
(20, 20, 'PayPal', 690.00, 'Completed', 'TXN020Q'),
(21, 21, 'Credit Card', 500.00, 'Pending', 'TXN021R'),
(22, 22, 'Bank Transfer', 2400.00, 'Completed', 'TXN022S'),
(23, 23, 'Credit Card', 760.00, 'Completed', 'TXN023T'),
(24, 24, 'PayPal', 780.00, 'Completed', 'TXN024U'),
(25, 25, 'Bank Transfer', 600.00, 'Pending', 'TXN025V'),
(26, 26, 'Credit Card', 320.00, 'Refunded', 'TXN026W'),      -- Cancelled Booking -> Refunded
(27, 27, 'PayPal', 340.00, 'Completed', 'TXN027X'),
(28, 28, 'Credit Card', 930.00, 'Completed', 'TXN028Y'),
(29, 29, 'Bank Transfer', 1600.00, 'Pending', 'TXN029Z'),
(30, 30, 'Credit Card', 1120.00, 'Completed', 'TXN030AA'),
(31, 31, 'PayPal', 1950.00, 'Completed', 'TXN031AB'),
(32, 32, 'Bank Transfer', 780.00, 'Refunded', 'TXN032AC'),     -- Cancelled Booking -> Refunded
(33, 33, 'Credit Card', 500.00, 'Completed', 'TXN033AD'),
(34, 34, 'PayPal', 1520.00, 'Completed', 'TXN034AE'),
(35, 35, 'Credit Card', 440.00, 'Pending', 'TXN035AF'),
(36, 36, 'Bank Transfer', 1800.00, 'Completed', 'TXN036AG'),
(37, 37, 'PayPal', 140.00, 'Completed', 'TXN037AH'),
(38, 38, 'Credit Card', 440.00, 'Pending', 'TXN038AI'),
(39, 39, 'Bank Transfer', 900.00, 'Completed', 'TXN039AJ'),
(40, 40, 'Credit Card', 1050.00, 'Completed', 'TXN040AK'),
(41, 41, 'PayPal', 100.00, 'Completed', 'TXN041AL'),
(42, 42, 'Bank Transfer', 800.00, 'Pending', 'TXN042AM'),
(43, 43, 'Credit Card', 320.00, 'Completed', 'TXN043AN'),
(44, 44, 'PayPal', 160.00, 'Completed', 'TXN044AO'),
(45, 45, 'Credit Card', 1400.00, 'Pending', 'TXN045AP'),
(46, 46, 'Bank Transfer', 750.00, 'Completed', 'TXN046AQ'),
(47, 47, 'Credit Card', 170.00, 'Completed', 'TXN047AR'),
(48, 48, 'PayPal', 960.00, 'Pending', 'TXN048AS'),
(49, 49, 'Bank Transfer', 200.00, 'Refunded', 'TXN049AT'),    
(50, 50, 'Credit Card', 1200.00, 'Completed', 'TXN050AU'),
(51, 51, 'PayPal', 1000.00, 'Completed', 'TXN051AV'),
(52, 52, 'Credit Card', 435.00, 'Pending', 'TXN052AW'),
(53, 53, 'Bank Transfer', 5400.00, 'Completed', 'TXN053AX');

INSERT INTO Review (reviewId, userId, hotelId, bookingId, rating, comment, userName, userAvatar)
VALUES
(4, 4, 3, 4, 5, N'Khách sạn sạch sẽ, dịch vụ nhanh chóng. Rất hài lòng.', N'Nguyễn Văn A', 'male.png'),
(5, 5, 5, 5, 4, N'Resort đẹp, hồ bơi lớn, nhưng thủ tục check-in hơi lâu.', N'Trần Văn B', 'male.png'),
(6, 6, 10, 6, 5, N'Phòng ấm cúng, view Đà Lạt mộng mơ, rất lãng mạn.', N'Lê Thị C', 'female.png'),
(7, 7, 8, 7, 5, N'Vị trí tuyệt vời, ngay bãi biển Nha Trang. Giá hợp lý.', N'Phạm Văn D', 'male.png'),
(8, 8, 9, 8, 5, N'Biệt thự sát biển Phú Quốc quá đỉnh! Trải nghiệm 5 sao.', N'Hoàng Thị E', 'female.png'),
(9, 9, 4, 9, 4, N'Nằm trong phố cổ, tiện đi lại. Phòng hơi nhỏ nhưng sạch.', N'Bùi Đình F', 'male.png'),
(10, 10, 6, 10, 5, N'Hội An lãng mạn, phòng trăng mật được trang trí rất đẹp.', N'Võ Thị G', 'female.png'),
(11, 11, 7, 11, 4, N'Khách sạn cổ kính, gần Đại Nội. Nhân viên lịch sự.', N'Đoàn Quang H', 'male.png'),
(12, 12, 1, 12, 5, 'Perfect luxury experience. Highly recommend the suites.', N'Nguyễn Thị Hòa', 'female.png'),
(13, 13, 2, 13, 3, 'The location was great, but the booking got cancelled. Disappointed.', N'Trần Minh Khôi', 'male.png'),
(14, 14, 15, 14, 5, N'Phòng gia đình ở Vũng Tàu rộng rãi, gần biển.', N'Lê Thanh Lâm', 'male.png'),
(15, 15, 23, 15, 4, 'Tokyo view was incredible, but the price is steep.', N'Phạm Thị Ngọc', 'female.png'),
(16, 16, 30, 16, 5, 'Right on Copacabana beach. The hotel service was excellent.', N'Hoàng Văn Phú', 'male.png'),
(17, 17, 34, 17, 5, 'Art Hotel in Berlin is super cool and unique!', N'Bùi Duy Quang', 'male.png'),
(18, 18, 38, 18, 4, 'Authentic Beijing experience. Quiet and charming.', N'Võ Thị Xuân', 'female.png'),
(19, 19, 19, 19, 5, N'Biệt thự hồ bơi riêng ở Mũi Né quá tuyệt vời. Nghỉ dưỡng lý tưởng.', N'Đoàn Quốc Thắng', 'male.png'),
(20, 20, 27, 20, 4, 'Great apartment for a long stay in London. Kitchenette was handy.', N'Nguyễn Thanh Trung', 'male.png'),
(21, 21, 16, 21, 4, N'Quy Nhơn đẹp. Khách sạn mới, nhân viên chu đáo.', N'Trần Văn Hiếu', 'male.png'),
(22, 22, 40, 22, 5, 'Vienna Concert Suite was luxurious, perfect for a special occasion.', N'Lê Thùy Dương', 'female.png'),
(23, 23, 1, 23, 5, 'Excellent value for the Deluxe Twin room. Beautiful sea view.', N'Phạm Văn Lực', 'male.png'),
(24, 24, 2, 24, 4, 'Clean, comfortable, and good for business travel in NYC.', N'Hoàng Thị Hồng', 'female.png'),
(25, 25, 3, 25, 4, N'Phòng Studio có bếp nhỏ rất tiện cho gia đình. Vị trí trung tâm Sài Gòn.', N'Bùi Đức Minh', 'male.png'),
(26, 26, 4, 26, 3, N'Phòng áp mái độc đáo, nhưng tiếc là tôi đã phải hủy đặt phòng.', N'Võ Thị Thúy', 'female.png'),
(27, 27, 5, 27, 5, N'Phòng Superior ở Đà Nẵng cao cấp, gần biển. Rất thích.', N'Đoàn Quốc An', 'male.png'),
(28, 28, 6, 28, 5, N'Phòng góc Corner Deluxe có hai mặt thoáng mát, view phố cổ.', N'Nguyễn Văn Tiến', 'male.png'),
(29, 29, 7, 29, 4, N'Phòng thông nhau phù hợp cho cả gia đình. Huế rất yên bình.', N'Trần Thị Nga', 'female.png'),
(30, 30, 8, 30, 5, N'View biển Nha Trang tuyệt đẹp, phòng Deluxe có ban công lớn.', N'Lê Thanh Hiếu', 'male.png'),
(31, 31, 9, 31, 5, N'Premium Suite ở Phú Quốc thực sự sang trọng và riêng tư.', N'Phạm Văn Lợi', 'male.png'),
(32, 32, 10, 32, 3, N'Khách sạn đẹp nhưng phòng hơi ồn. Đáng tiếc vì phải hủy.', N'Hoàng Thị Xinh', 'female.png'),
(33, 33, 11, 33, 5, N'Phòng Suite nhìn ra sông Hậu thơ mộng. Cần Thơ hiếu khách.', N'Bùi Trọng Hiệp', 'male.png'),
(34, 1, 12, 34, 5, N'Tầm nhìn ra Vịnh Hạ Long từ phòng Deluxe vô cùng ngoạn mục.', 'Alice Johnson', 'female.png'),
(35, 2, 14, 35, 4, N'Phòng nhìn ra núi Sapa rất đẹp. Dịch vụ chu đáo.', 'Bob Smith', 'male.png'),
(36, 3, 26, 36, 5, 'The Deluxe Seaview room in Dubai was pure luxury.', 'Charlie Brown', 'male.png'),
(37, 4, 32, 37, 4, 'Good value for a hostel bed downtown Toronto. Clean and safe.', N'Nguyễn Văn A', 'male.png'),
(38, 5, 36, 38, 4, 'Phnom Penh hotel was nice, but the view was just okay.', N'Trần Văn B', 'male.png'),
(39, 6, 33, 39, 5, 'Stunning views of Table Mountain from the Deluxe room.', N'Lê Thị C', 'female.png'),
(40, 7, 28, 40, 5, 'Best hotel view in Sydney! Directly overlooking the Opera House.', N'Phạm Văn D', 'male.png'),
(41, 8, 42, 41, 4, N'Phòng trọ giá rẻ ở Hà Nội rất tiện nghi cơ bản, sạch sẽ.', N'Hoàng Thị E', 'female.png'),
(42, 9, 39, 42, 4, 'Charming canal view in Amsterdam. Cozy and boutique feel.', N'Bùi Đình F', 'male.png'),
(43, 10, 41, 43, 5, 'Great location in New Delhi. Beautiful Mughal-inspired room.', N'Võ Thị G', 'female.png'),
(44, 11, 25, 44, 4, 'Basic twin room, but the proximity to the river in Bangkok was great.', N'Đoàn Quang H', 'male.png'),
(45, 12, 19, 45, 5, N'Biệt thự ở Bình Thuận quá đẹp! Rất lãng mạn.', N'Nguyễn Thị Hòa', 'female.png'),
(46, 13, 22, 46, 4, N'Khách sạn ở Bạc Liêu tốt, phục vụ chuyên nghiệp cho công tác.', N'Trần Minh Khôi', 'male.png'),
(47, 14, 17, 47, 4, N'Phòng đôi tiêu c	huẩn ở Thanh Hóa. Vị trí gần biển Sầm Sơn.', N'Lê Thanh Lâm', 'male.png'),
(48, 15, 35, 48, 4, 'Rooftop View King in Mexico City was a highlight of the trip.', N'Phạm Thị Ngọc', 'female.png'),
(49, 16, 20, 49, 3, N'View núi Hà Giang rất đẹp, nhưng phòng hơi lạnh và tôi phải hủy.', N'Hoàng Văn Phú', 'male.png'),
(50, 17, 1, 50, 5, 'The King Deluxe room at Grand Palace was flawless.', N'Bùi Duy Quang', 'male.png'),
(51, 18, 3, 51, 5, N'Corner Suite ở Sài Gòn rất rộng, đáng tiền.', N'Võ Thị Xuân', 'female.png'),
(52, 19, 6, 52, 4, N'Phòng tiêu chuẩn ở Hội An sạch, nhưng không gian hơi chật.', N'Đoàn Quốc Thắng', 'male.png'),
(53, 20, 9, 53, 5, N'Luxury Villa Phú Quốc là nơi nghỉ dưỡng hoàn hảo nhất.', N'Nguyễn Thanh Trung', 'male.png');

select * from payment ;
Use go_project;