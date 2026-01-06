CREATE DATABASE go_project
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
CREATE TABLE Booking (
    bookingId INT PRIMARY KEY AUTO_INCREMENT,
    userId INT NOT NULL,
    hotelId INT NOT NULL,
    roomId INT NOT NULL,
    checkInDate DATE NOT NULL,
    checkOutDate DATE NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    bookingStatus VARCHAR(50) DEFAULT 'Pending',
    createdAt DATETIME DEFAULT NOW(),
    CONSTRAINT fk_user_booking FOREIGN KEY (userId) REFERENCES User(userId),
    CONSTRAINT fk_hotel_booking FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
    CONSTRAINT fk_room_booking FOREIGN KEY (roomId) REFERENCES Room(roomId)
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
(1,'Grand Palace','Luxury hotel with sea view','123 Beach Road','Miami','USA',5,25.774,-80.19,'Pool,Spa,WiFi','database/images/room/grand1.jpg,database/images/room/grand2.jpg,database/images/room/grand3.jpg',200.00),
(2,'City Inn','Comfortable city hotel','456 Downtown St','New York','USA',4,40.7128,-74.0060,'WiFi,Gym,Restaurant','database/images/room/city1.jpg,database/images/room/city2.jpg,database/images/room/city3.jpg',120.00),
(3,N'Khách sạn Sài Gòn Panorama',N'Khách sạn sang trọng ở trung tâm thành phố',N'79 Đường Nguyễn Huệ',N'Hồ Chí Minh',N'Việt Nam',5,10.7760,106.7019,'Pool,Spa,Gym,Restaurant','database/images/room/saigon1.jpg,database/images/room/saigon2.jpg,database/images/room/saigon3.jpg,database/images/room/saigon4.jpg',185.00),
(4,N'Hà Nội Cổ Kính Inn',N'Nằm trong khu phố cổ, gần Hồ Gươm',N'36 Hàng Bông',N'Hà Nội',N'Việt Nam',4,21.0285,105.8542,'WiFi,Breakfast,TourDesk','database/images/room/hanoi1.jpg,database/images/room/hanoi2.jpg,database/images/room/hanoi3.jpg',95.00),
(5,N'Resort Biển Đà Nẵng',N'Khu nghỉ dưỡng sát biển, tầm nhìn tuyệt đẹp',N'516 Võ Nguyên Giáp',N'Đà Nẵng',N'Việt Nam',5,16.0680,108.2210,'Pool,PrivateBeach,Spa,Bar','database/images/room/danang1.jpg,database/images/room/danang2.jpg,database/images/room/danang3.jpg,database/images/room/danang4.jpg',250.00),
(6,N'Khách sạn Phố Hội',N'Nét kiến trúc truyền thống ở phố cổ',N'12 Lê Lợi',N'Hội An',N'Việt Nam',4,15.8794,108.3364,'Terrace,BikeRental,Restaurant','database/images/room/hoian1.jpg,database/images/room/hoian2.jpg,database/images/room/hoian3.jpg',110.00),
(7,N'Huế Imperial',N'Khách sạn lịch sử gần Đại Nội',N'150 Hùng Vương',N'Huế',N'Việt Nam',4,16.4637,107.5841,'Restaurant,Gym,Sauna','database/images/room/hue1.jpg,database/images/room/hue2.jpg,database/images/room/hue3.jpg',135.00),
(8,N'Nha Trang Ocean View',N'Khách sạn hiện đại nhìn ra biển',N'22 Trần Phú',N'Nha Trang',N'Việt Nam',4,12.2450,109.1917,'Pool,Bar,WiFi','database/images/room/ntrang1.jpg,database/images/room/ntrang2.jpg,database/images/room/ntrang3.jpg,database/images/room/ntrang4.jpg',105.00),
(9,N'Phú Quốc Marina',N'Khu nghỉ dưỡng biệt lập yên tĩnh',N'Ấp 4, Bãi Dài',N'Phú Quốc',N'Việt Nam',5,10.2300,103.9500,'Pool,Spa,WaterSports','database/images/room/pq1.jpg,database/images/room/pq2.jpg,database/images/room/pq3.jpg',220.00),
(10,N'Đà Lạt Mộng Mơ',N'Khách sạn kiểu Pháp lãng mạn',N'10 Triệu Việt Vương',N'Đà Lạt',N'Việt Nam',4,11.9404,108.4586,'Fireplace,Garden,Cafe','database/images/room/dalat1.jpg,database/images/room/dalat2.jpg,database/images/room/dalat3.jpg,database/images/room/dalat4.jpg',80.00),
(11,N'Cần Thơ Mekong Oasis',N'Nằm bên bờ sông Hậu',N'118 Hai Bà Trưng',N'Cần Thơ',N'Việt Nam',3,10.0337,105.7865,'RiverView,BoatTours,Breakfast','database/images/room/ctho1.jpg,database/images/room/ctho2.jpg,database/images/room/ctho3.jpg',65.00),
(12,N'Hạ Long Bay View',N'Khách sạn có ban công nhìn ra vịnh',N'Khu Du lịch Bãi Cháy',N'Hạ Long',N'Việt Nam',5,20.9576,107.0322,'RooftopBar,Pool,Spa','database/images/room/hl1.jpg,database/images/room/hl2.jpg,database/images/room/hl3.jpg',195.00),
(13,N'Khách sạn Kim Long',N'Tiện nghi, gần trung tâm mua sắm',N'234 Trần Hưng Đạo',N'Hồ Chí Minh',N'Việt Nam',3,10.7620,106.6800,'WiFi,Parking,AC','database/images/room/hcm3.jpg,database/images/room/hcm4.jpg,database/images/room/hcm5.jpg',55.00),
(14,N'Sapa Retreat',N'View núi non tuyệt đẹp, không gian ấm cúng',N'Fansipan Legend',N'Sapa',N'Việt Nam',4,22.3667,103.8433,'Hammam,Heating,Hiking','database/images/room/sapa1.jpg,database/images/room/sapa2.jpg,database/images/room/sapa3.jpg,database/images/room/sapa4.jpg',145.00),
(15,N'Vũng Tàu Lighthouse',N'Khách sạn gia đình gần bãi biển',N'120 Hạ Long',N'Vũng Tàu',N'Việt Nam',3,10.3444,107.0862,'KidsClub,BeachAccess','database/images/room/vt1.jpg,database/images/room/vt2.jpg,database/images/room/vt3.jpg',75.00),
(16,N'Quy Nhơn Seafront',N'Khách sạn 4 sao mới, đối diện biển',N'20 Xuân Diệu',N'Quy Nhơn',N'Việt Nam',4,13.7845,109.2270,'Pool,Gym,Seaview','database/images/room/qn1.jpg,database/images/room/qn2.jpg,database/images/room/qn3.jpg,database/images/room/qn4.jpg',115.00),
(17,N'Thanh Hóa Sunset',N'Khách sạn nghỉ dưỡng ven biển Sầm Sơn',N'Bãi B, Sầm Sơn',N'Thanh Hóa',N'Việt Nam',3,19.8000,106.0000,'Breakfast,Terrace','database/images/room/th1.jpg,database/images/room/th2.jpg,database/images/room/th3.jpg',70.00),
(18,N'Tuy Hòa Pearl',N'Khách sạn nhỏ xinh, phục vụ chuyên nghiệp',N'200 Độc Lập',N'Tuy Hòa',N'Việt Nam',3,13.0800,109.3000,'FreeParking,Laundry','database/images/room/th2.jpg,database/images/room/th3.jpg,database/images/room/th4.jpg',60.00),
(19,N'Bình Thuận Ocean Star',N'Resort lãng mạn tại Mũi Né',N'Mũi Né, Phan Thiết',N'Bình Thuận',N'Việt Nam',5,10.9344,108.2830,'PrivatePool,Bar,Massage','database/images/room/bt1.jpg,database/images/room/bt2.jpg,database/images/room/bt3.jpg,database/images/room/bt4.jpg',280.00),
(20,N'Hà Giang Grand View',N'Khách sạn có tầm nhìn ra đồi núi',N'Tổ 1, Phố Cổ Đồng Văn',N'Hà Giang',N'Việt Nam',3,23.2800,105.3500,'MountainView,Heating','database/images/room/hg1.jpg,database/images/room/hg2.jpg,database/images/room/hg3.jpg',90.00),
(21,N'Ninh Bình Lotus',N'Khách sạn gần khu du lịch Tràng An',N'Thôn 4, Hoa Lư',N'Ninh Bình',N'Việt Nam',4,20.2500,105.9000,'BikeRental,Garden,Restaurant','database/images/room/nb1.jpg,database/images/room/nb2.jpg,database/images/room/nb3.jpg,database/images/room/nb4.jpg',118.00),
(22,N'Bạc Liêu Heritage',N'Khách sạn tiêu chuẩn quốc tế',N'12 Phạm Văn Đồng',N'Bạc Liêu',N'Việt Nam',3,9.2800,105.7300,'BusinessCenter,WiFi','database/images/room/bl1.jpg,database/images/room/bl2.jpg,database/images/room/bl3.jpg',68.00),
(23,'Tokyo Sky Tower Hotel','Modern design with panoramic city views','5-1 Marunouchi, Chiyoda','Tokyo','Japan',5,35.6895,139.6917,'Spa,Bar,Pool,Concierge','database/images/room/tokyo1.jpg,database/images/room/tokyo2.jpg,database/images/room/tokyo3.jpg,database/images/room/tokyo4.jpg',320.00),
(24,'Rome Historic Stay','Charming hotel near the Colosseum','Via Cavour 101','Rome','Italy',4,41.9028,12.4964,'Breakfast,Terrace,WiFi','database/images/room/rome1.jpg,database/images/room/rome2.jpg,database/images/room/rome3.jpg',160.00),
(25,'Bangkok Riverside','Budget hotel by Chao Phraya River','Soi 13 Charoen Krung','Bangkok','Thailand',3,13.7563,100.5018,'FerryAccess,Laundry,AC','database/images/room/bkk1.jpg,database/images/room/bkk2.jpg,database/images/room/bkk3.jpg',45.00),
(26,'Dubai Marina Resort','Exclusive stay on the waterfront','Jumeirah Beach Residence','Dubai','UAE',5,25.2048,55.2708,'PrivateBeach,YachtRental,Gym','database/images/room/dubai1.jpg,database/images/room/dubai2.jpg,database/images/room/dubai3.jpg,database/images/room/dubai4.jpg',450.00),
(27,'London Central Suite','Apartment-style accommodations','21 Baker Street','London','UK',4,51.5074,0.1278,'Kitchenette,SelfCheckIn','database/images/room/london1.jpg,database/images/room/london2.jpg,database/images/room/london3.jpg',210.00),
(28,'Sydney Harbour View','Iconic views of the Opera House','Circular Quay','Sydney','Australia',5,-33.8688,151.2093,'RooftopPool,Bar,Theater','database/images/room/sydney1.jpg,database/images/room/sydney2.jpg,database/images/room/sydney3.jpg',290.00),
(29,'Istanbul Grand Bazaar Hotel','Traditional Turkish hospitality','Sultanahmet Square','Istanbul','Turkey',4,41.0082,28.9784,'Hammam,Breakfast,TeaRoom','database/images/room/ist1.jpg,database/images/room/ist2.jpg,database/images/room/ist3.jpg',140.00),
(30,'Rio de Janeiro Copacabana','Right on the famous beach','Av. Atlântica 1000','Rio de Janeiro','Brazil',3,-22.9068,-43.1729,'BeachService,Bar,WiFi','database/images/room/rio1.jpg,database/images/room/rio2.jpg,database/images/room/rio3.jpg,database/images/room/rio4.jpg',110.00),
(31,'Seoul Gangnam Place','Business hotel in the upscale district','Teheran-ro 25','Seoul','South Korea',4,37.5665,126.9780,'BusinessCenter,ConferenceRooms','database/images/room/seoul1.jpg,database/images/room/seoul2.jpg,database/images/room/seoul3.jpg',175.00),
(32,'Toronto Downtown Hostel','Shared rooms and budget travel','20 Queen Street West','Toronto','Canada',2,43.6532,-79.3832,'SharedKitchen,Lockers,Lounge','database/images/room/toronto1.jpg,database/images/room/toronto2.jpg,database/images/room/toronto3.jpg',30.00),
(33,'Cape Town Table View','Stunning views of Table Mountain','V&A Waterfront','Cape Town','South Africa',5,-33.9249,18.4241,'Spa,InfinityPool,WineTours','database/images/room/capetown1.jpg,database/images/room/capetown2.jpg,database/images/room/capetown3.jpg',240.00),
(34,'Berlin Art Hotel','Eclectic design and gallery space','Oranienburger Straße 1','Berlin','Germany',4,52.5200,13.4050,'ArtGallery,Cafe,Bar','database/images/room/berlin1.jpg,database/images/room/berlin2.jpg,database/images/room/berlin3.jpg,database/images/room/berlin4.jpg',155.00),
(35,'Mexico City Palace','Located in the historic centre','Avenida Reforma 10','Mexico City','Mexico',4,19.4326,-99.1332,'RooftopTerrace,Sauna,Pool','database/images/room/mexico1.jpg,database/images/room/mexico2.jpg,database/images/room/mexico3.jpg',180.00),
(36,'Phnom Penh Diamond','Luxury hotel near the Royal Palace','313 Preah Sisowath Quay','Phnom Penh','Cambodia',5,11.5564,104.9282,'Casino,FineDining,Pool','database/images/room/pp1.jpg,database/images/room/pp2.jpg,database/images/room/pp3.jpg,database/images/room/pp4.jpg',190.00),
(37,'San Francisco Bridge View','Overlooking the Golden Gate','1 Pier 39','San Francisco','USA',4,37.7749,-122.4194,'Balcony,PetFriendly','database/images/room/sf1.jpg,database/images/room/sf2.jpg,database/images/room/sf3.jpg',205.00),
(38,'Beijing Hutong Stay','Traditional courtyard experience','Jingshan Houjie','Beijing','China',3,39.9042,116.4074,'TeaHouse,BikeRental,Garden','database/images/room/bj1.jpg,database/images/room/bj2.jpg,database/images/room/bj3.jpg',75.00),
(39,'Amsterdam Canal House','Boutique hotel in a renovated canal house','Keizersgracht 10','Amsterdam','Netherlands',4,52.3702,4.8952,'BoutiqueShop,Breakfast','database/images/room/ams1.jpg,database/images/room/ams2.jpg,database/images/room/ams3.jpg,database/images/room/ams4.jpg',170.00),
(40,'Vienna Concert Hotel','Near the State Opera House','Opernring 2','Vienna','Austria',5,48.2082,16.3738,'MusicLounge,Spa,Valet','database/images/room/vienna1.jpg,database/images/room/vienna2.jpg,database/images/room/vienna3.jpg',260.00),
(41,'New Delhi Royal Residency','Hotel with Mughal architectural inspiration','Connaught Place','New Delhi','India',4,28.6139,77.2090,'Pool,Catering,Events','database/images/room/nd1.jpg,database/images/room/nd2.jpg,database/images/room/nd3.jpg',130.00),
(42,'Hanoi Cozy Corner',N'Phòng trọ giá rẻ, tiện nghi cơ bản',N'15 Ngõ Huyện',N'Hà Nội',N'Việt Nam',2,21.0280,105.8500,'WiFi,CommonArea','database/images/room/hn3.jpg,database/images/room/hn4.jpg,database/images/room/hn5.jpg',25.00);

INSERT INTO Room (roomId, hotelId, roomType, description, capacity, pricePerNight, totalRooms, availableRooms, amenities, images)
VALUES
-- HOTEL ID 1: Grand Palace (USA/Miami)
(1, 1, 'Single', 'Single room with balcony', 1, 220.00, 10, 10, 'WiFi,TV', 'room1a.jpg,room1b.jpg'),
(2, 1, 'Double', 'Double room with sea view', 2, 300.00, 5, 5, 'WiFi,TV,Balcony', 'room2a.jpg,room2b.jpg'),
(6, 1, 'Executive Suite', N'Phòng Suite điều hành, có phòng khách riêng', 3, 550.00, 3, 2, 'WiFi,Jacuzzi,DiningArea,Bar', 'room6a.jpg,room6b.jpg'),
(16, 1, 'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 380.00, 10, 10, 'WiFi,Balcony,Seaview', 'room16a.jpg,room16b.jpg'),
(26, 1, 'Single Economy', N'Phòng đơn tiết kiệm', 1, 130.00, 10, 10, 'WiFi,AC', 'room26a.jpg,room26b.jpg'),
(36, 1, 'Deluxe King', N'Phòng King Deluxe', 2, 400.00, 8, 6, 'WiFi,Balcony,CityView', 'room36a.jpg,room36b.jpg'),
(46, 1, 'Superior Double', N'Phòng Double cao cấp, tầm nhìn ra biển', 2, 420.00, 10, 8, 'WiFi,TV,Balcony,Seaview', 'room46a.jpg,room46b.jpg'),
(56, 1, 'Triple Room', N'Phòng 3 người lớn', 3, 390.00, 10, 10, 'WiFi,ThreeBeds', 'room56a.jpg,room56b.jpg'),
(66, 1, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 250.00, 20, 19, 'WiFi,AC', 'room66a.jpg,room66b.jpg'),
(76, 1, 'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 350.00, 15, 15, 'WiFi,Balcony,CityView', 'room76a.jpg,room76b.jpg'),
(86, 1, 'Executive Double', N'Phòng điều hành 1 giường đôi', 2, 490.00, 5, 4, 'LoungeAccess,PremiumAmenities', 'room86a.jpg,room86b.jpg'),

-- HOTEL ID 2: City Inn (USA/New York)
(3, 2, 'Standard', 'Standard room in city center', 2, 130.00, 8, 8, 'WiFi,TV', 'room3a.jpg,room3b.jpg'),
(12, 2, 'Superior Twin', N'Phòng Twin cao cấp, tầm nhìn đẹp', 2, 210.00, 18, 18, 'WiFi,Minibar,Desk', 'room12a.jpg,room12b.jpg'),
(22, 2, 'Business Class', N'Phòng dành cho khách công tác', 1, 195.00, 12, 12, 'HighSpeedWiFi,LargeDesk', 'room22a.jpg,room22b.jpg'),
(32, 2, 'Executive Double', N'Phòng điều hành 1 giường đôi', 2, 350.00, 6, 6, 'LoungeAccess,PremiumAmenities', 'room32a.jpg,room32b.jpg'),
(42, 2, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 140.00, 15, 15, 'WiFi,TV', 'room42a.jpg,room42b.jpg'),
(52, 2, 'Junior Suite', N'Phòng Suite nhỏ, khu vực sinh hoạt riêng', 2, 380.00, 7, 7, 'WiFi,MiniLounge', 'room52a.jpg,room52b.jpg'),
(62, 2, 'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 155.00, 20, 18, 'WiFi,TV', 'room62a.jpg,room62b.jpg'),
(72, 2, 'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 290.00, 10, 9, 'WiFi,Balcony', 'room72a.jpg,room72b.jpg'),
(82, 2, 'Superior Twin', N'Phòng Twin cao cấp', 2, 235.00, 15, 15, 'WiFi,Minibar,Desk', 'room82a.jpg,room82b.jpg'),
(92, 2, 'Triple Room', N'Phòng 3 người', 3, 280.00, 10, 10, 'WiFi,ThreeBeds', 'room92a.jpg,room92b.jpg'),

-- HOTEL ID 3: Khách sạn Sài Gòn Panorama (Việt Nam/Hồ Chí Minh)
(8, 3, N'Budget Single', N'Phòng đơn giá rẻ, tiện nghi cơ bản', 1, 90.00, 30, 25, 'WiFi,AC', 'room8a.jpg,room8b.jpg'),
(18, 3, N'Studio Apartment', N'Căn hộ Studio có bếp nhỏ', 2, 200.00, 6, 6, 'Kitchenette,Laundry,WiFi', 'room18a.jpg,room18b.jpg'),
(28, 3, N'Family Suite', N'Phòng Suite cho gia đình', 4, 450.00, 5, 4, 'TwoRooms,Kitchenette', 'room28a.jpg,room28b.jpg'),
(38, 3, N'Connecting Twin', N'Hai phòng Twin thông nhau', 4, 380.00, 10, 10, 'WiFi,TwoRooms', 'room38a.jpg,room38b.jpg'),
(49, 3, N'Corner Suite', N'Phòng Suite góc với không gian rộng', 3, 500.00, 4, 3, 'DoubleView,LoungeAccess', 'room49a.jpg,room49b.jpg'),
(59, 3, N'Connecting Twin', N'Hai phòng Twin có cửa thông', 4, 370.00, 8, 8, 'WiFi,TwoRooms', 'room59a.jpg,room59b.jpg'),
(69, 3, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 105.00, 15, 15, 'WiFi,TV', 'room69a.jpg,room69b.jpg'),
(79, 3, N'Triple Room', N'Phòng 3 người', 3, 230.00, 10, 9, 'WiFi,ThreeBeds', 'room79a.jpg,room79b.jpg'),
(89, 3, N'Junior Suite', N'Phòng Suite nhỏ', 2, 300.00, 5, 5, 'WiFi,MiniLounge', 'room89a.jpg,room89b.jpg'),

-- HOTEL ID 4: Hà Nội Cổ Kính Inn (Việt Nam/Hà Nội)
(11, 4, N'Standard Double', N'Phòng tiêu chuẩn, 1 giường đôi', 2, 150.00, 20, 18, 'WiFi,Desk,AC', 'room11a.jpg,room11b.jpg'),
(21, 4, N'Attic Room', N'Phòng áp mái độc đáo', 2, 160.00, 5, 5, 'SlantedRoof,UniqueDesign', 'room21a.jpg,room21b.jpg'),
(31, 4, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 220.00, 12, 12, 'WiFi,Minibar,Desk', 'room31a.jpg,room31b.jpg'),
(41, 4, N'Superior Double', N'Phòng Double cao cấp', 2, 230.00, 10, 10, 'WiFi,Desk,Minibar', 'room41a.jpg,room41b.jpg'),
(53, 4, N'Presidential Villa', N'Biệt thự Tổng thống, hồ bơi riêng', 6, 3500.00, 1, 1, 'PrivatePool,Butler,Sauna,Bar', 'room53a.jpg,room53b.jpg'),
(63, 4, N'Attic Double', N'Phòng áp mái độc đáo 1 giường đôi', 2, 185.00, 5, 5, 'SlantedRoof,UniqueDesign', 'room63a.jpg,room63b.jpg'),
(73, 4, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 140.00, 20, 20, 'WiFi,TV', 'room73a.jpg,room73b.jpg'),
(83, 4, 'Family Room', N'Phòng gia đình cho 4 người', 4, 350.00, 8, 8, 'WiFi,TwoBeds', 'room83a.jpg,room83b.jpg'),
(93, 4, 'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 160.00, 15, 14, 'WiFi,AC', 'room93a.jpg,room93b.jpg'),

-- HOTEL ID 5: Resort Biển Đà Nẵng (Việt Nam/Đà Nẵng)
(4, 5, N'Deluxe King', N'Phòng Deluxe sang trọng, giường King size', 2, 350.00, 12, 10, 'WiFi,Minibar,Desk,AC', 'room4a.jpg,room4b.jpg'),
(14, 5, N'Single Economy', N'Phòng đơn tiết kiệm, không có cửa sổ', 1, 110.00, 10, 10, 'WiFi,AC', 'room14a.jpg,room14b.jpg'),
(24, 5, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 170.00, 15, 13, 'WiFi,AC', 'room24a.jpg,room24b.jpg'),
(34, 5, N'Superior Double', N'Phòng Double cao cấp', 2, 250.00, 10, 10, 'WiFi,Balcony', 'room34a.jpg,room34b.jpg'),
(47, 5, N'Family Suite', N'Phòng Suite cho gia đình 4 người', 4, 600.00, 5, 5, 'TwoRooms,Kitchenette,Balcony', 'room47a.jpg,room47b.jpg'),
(57, 5, N'Honeymoon Villa', N'Biệt thự trăng mật lãng mạn', 2, 950.00, 2, 2, 'Jacuzzi,PrivateTerrace', 'room57a.jpg,room57b.jpg'),
(67, 5, N'Premium Suite', N'Phòng Suite cao cấp', 3, 750.00, 4, 4, 'PrivateLoungeAccess,Minibar', 'room67a.jpg,room67b.jpg'),
(77, 5, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 130.00, 10, 10, 'WiFi,AC', 'room77a.jpg,room77b.jpg'),
(87, 5, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn', 2, 310.00, 12, 12, 'WiFi,Minibar,Desk', 'room87a.jpg,room87b.jpg'),

-- HOTEL ID 6: Khách sạn Phố Hội (Việt Nam/Hội An)
(9, 6, N'Honeymoon Suite', N'Phòng dành cho tuần trăng mật lãng mạn', 2, 480.00, 2, 2, 'PrivateBalcony,Champagne,SpaAccess', 'room9a.jpg,room9b.jpg'),
(19, 6, N'Corner Deluxe', N'Phòng Deluxe góc, có hai mặt thoáng', 2, 310.00, 4, 4, 'DoubleView,Desk,Minibar', 'room19a.jpg,room19b.jpg'),
(29, 6, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 120.00, 10, 10, 'WiFi,TV', 'room29a.jpg,room29b.jpg'),
(39, 6, N'Premium King', N'Phòng King cao cấp nhất', 2, 450.00, 3, 3, 'LoungeAccess,EspressoMachine', 'room39a.jpg,room39b.jpg'),
(50, 6, N'Standard Double', N'Phòng tiêu chuẩn, 1 giường đôi', 2, 145.00, 20, 19, 'WiFi,Desk,AC', 'room50a.jpg,room50b.jpg'),
(60, 6, N'Superior Single', N'Phòng đơn cao cấp', 1, 170.00, 15, 15, 'WiFi,AC,Minibar', 'room60a.jpg,room60b.jpg'),
(70, 6, N'Quad Room', N'Phòng 4 giường đơn', 4, 330.00, 7, 7, 'FourBeds,Desk', 'room70a.jpg,room70b.jpg'),
(80, 6, N'Deluxe King', N'Phòng King Deluxe', 2, 360.00, 10, 10, 'WiFi,Balcony', 'room80a.jpg,room80b.jpg'),
(90, 6, N'Premium Suite', N'Phòng Suite cao cấp nhất', 3, 680.00, 2, 2, 'EspressoMachine,PrivateBalcony', 'room90a.jpg,room90b.jpg'),

-- HOTEL ID 7: Huế Imperial (Việt Nam/Huế)
(10, 7, N'Triple Room', N'Phòng 3 người, phù hợp nhóm bạn', 3, 250.00, 15, 15, 'WiFi,TV,Desk', 'room10a.jpg,room10b.jpg'),
(20, 7, N'Connecting Room', N'Hai phòng tiêu chuẩn có cửa thông nhau', 4, 400.00, 10, 8, 'WiFi,TwoTVs,TwoBaths', 'room20a.jpg,room20b.jpg'),
(30, 7, N'Quad Room', N'Phòng 4 giường đơn', 4, 300.00, 8, 8, 'FourBeds,Desk', 'room30a.jpg,room30b.jpg'),
(40, 7, N'Single Economy', N'Phòng đơn tiêu chuẩn, giá thấp', 1, 85.00, 15, 15, 'WiFi,AC', 'room40a.jpg,room40b.jpg'),
(44, 7, N'Deluxe King', N'Phòng Deluxe sang trọng, giường King size', 2, 330.00, 15, 12, 'WiFi,Minibar,Desk,AC', 'room44a.jpg,room44b.jpg'),
(54, 7, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 160.00, 20, 17, 'WiFi,AC', 'room54a.jpg,room54b.jpg'),
(64, 7, N'Family Connected', N'Phòng gia đình có cửa thông nhau', 5, 490.00, 6, 6, 'TwoBaths,TwoTVs', 'room64a.jpg,room64b.jpg'),
(74, 7, N'Superior Double', N'Phòng Double cao cấp', 2, 270.00, 10, 10, 'WiFi,Minibar,Desk', 'room74a.jpg,room74b.jpg'),
(84, 7, 'Business Twin', N'Phòng Twin cho khách công tác', 2, 250.00, 10, 10, 'HighSpeedWiFi,Desk', 'room84a.jpg,room84b.jpg'),

-- HOTEL ID 8: Nha Trang Ocean View (Việt Nam/Nha Trang)
(5, 8, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn, tầm nhìn thành phố', 2, 180.00, 25, 20, 'WiFi,TV,Desk', 'room5a.jpg,room5b.jpg'),
(15, 8, N'Presidential Suite', N'Phòng tổng thống, tiện nghi cao cấp nhất', 4, 2500.00, 1, 1, 'PrivateChef,Sauna,Gym,Bar', 'room15a.jpg,room15b.jpg'),
(25, 8, N'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 280.00, 10, 8, 'WiFi,Balcony,Seaview', 'room25a.jpg,room25b.jpg'),
(35, 8, N'Family Connected', N'Phòng gia đình có cửa thông', 5, 480.00, 5, 5, 'TwoBaths,TwoTVs', 'room35a.jpg,room35b.jpg'),
(48, 8, N'Single Economy', N'Phòng đơn giá rẻ, tiện nghi cơ bản', 1, 100.00, 30, 28, 'WiFi,AC', 'room48a.jpg,room48b.jpg'),
(58, 8, N'Business King', N'Phòng King size cho khách công tác', 1, 220.00, 12, 11, 'HighSpeedWiFi,LargeDesk', 'room58a.jpg,room58b.jpg'),
(68, 8, N'Studio Apartment', N'Căn hộ Studio có bếp nhỏ', 2, 230.00, 5, 4, 'Kitchenette,Laundry,WiFi', 'room68a.jpg,room68b.jpg'),
(78, 8, N'Executive Suite', N'Phòng Suite điều hành', 3, 620.00, 3, 3, 'LoungeAccess,DiningArea', 'room78a.jpg,room78b.jpg'),
(88, 8, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 195.00, 20, 20, 'WiFi,TV', 'room88a.jpg,room88b.jpg'),

-- HOTEL ID 9: Phú Quốc Marina (Việt Nam/Phú Quốc)
(13, 9, N'Beachfront Villa', N'Biệt thự sát biển có hồ bơi riêng', 4, 1200.00, 1, 1, 'PrivatePool,Kitchen,Seaview,Butler', 'room13a.jpg,room13b.jpg'),
(23, 9, N'Premium Suite', N'Phòng Suite cao cấp', 3, 650.00, 4, 3, 'PrivateLoungeAccess,Minibar', 'room23a.jpg,room23b.jpg'),
(33, 9, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 190.00, 15, 14, 'WiFi,AC', 'room33a.jpg,room33b.jpg'),
(43, 9, N'Deluxe Double', N'Phòng Deluxe 1 giường đôi', 2, 270.00, 10, 9, 'WiFi,Balcony', 'room43a.jpg,room43b.jpg'),
(51, 9, N'Deluxe Twin', N'Phòng Deluxe 2 giường đơn, view đẹp', 2, 350.00, 18, 18, 'WiFi,Minibar,Desk', 'room51a.jpg,room51b.jpg'),
(61, 9, N'Garden View Bungalow', N'Bungalow nhìn ra vườn', 2, 310.00, 10, 9, 'Terrace,Hammock', 'room61a.jpg,room61b.jpg'),
(71, 9, N'Luxury Villa', N'Biệt thự sang trọng với tầm nhìn biển', 5, 1800.00, 1, 1, 'OceanView,PrivatePool,Butler', 'room71a.jpg,room71b.jpg'),
(81, 9, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 200.00, 20, 18, 'WiFi,AC', 'room81a.jpg,room81b.jpg'),
(91, 9, N'Connecting King', N'Hai phòng King thông nhau', 4, 750.00, 3, 3, 'TwoRooms,KingBeds', 'room91a.jpg,room91b.jpg'),

-- HOTEL ID 10: Đà Lạt Mộng Mơ (Việt Nam/Đà Lạt)
(7, 10, N'Family Room', N'Phòng lớn cho gia đình có 4 người', 4, 320.00, 7, 7, 'WiFi,TwoBeds,KidsPlay', 'room7a.jpg,room7b.jpg'),
(17, 10, N'Bungalow Garden View', N'Bungalow nhìn ra vườn, yên tĩnh', 2, 280.00, 8, 5, 'Terrace,Hammock,AC', 'room17a.jpg,room17b.jpg'),
(27, 10, N'Superior King', N'Phòng King cao cấp', 2, 260.00, 15, 15, 'WiFi,Minibar', 'room27a.jpg,room27b.jpg'),
(37, 10, N'Standard Double', N'Phòng tiêu chuẩn 1 giường đôi', 2, 165.00, 20, 20, 'WiFi,AC', 'room37a.jpg,room37b.jpg'),
(45, 10, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 175.00, 25, 25, 'WiFi,TV,Desk', 'room45a.jpg,room45b.jpg'),
(55, 10, N'Executive Twin', N'Phòng Twin điều hành, tiện nghi cao cấp', 2, 300.00, 10, 10, 'LoungeAccess,PremiumAmenities', 'room55a.jpg,room55b.jpg'),
(65, 10, N'Deluxe King', N'Phòng King Deluxe, view đẹp', 2, 290.00, 15, 15, 'WiFi,Balcony,CityView', 'room65a.jpg,room65b.jpg'),
(75, 10, N'Single Economy', N'Phòng đơn tiết kiệm', 1, 95.00, 10, 10, 'WiFi,AC', 'room75a.jpg,room75b.jpg'),
(85, 10, N'Connecting Double', N'Hai phòng Double thông nhau', 4, 420.00, 5, 5, 'WiFi,TwoRooms', 'room85a.jpg,room85b.jpg'), 

-- HOTEL ID 11: Cần Thơ Mekong Oasis (3 bản ghi)
(94, 11, N'Standard Double', N'Phòng đôi tiêu chuẩn nhìn ra sông', 2, 115.00, 10, 8, 'WiFi,RiverView', 'room94a.jpg,room94b.jpg'),
(95, 11, N'Triple Room', N'Phòng 3 người', 3, 150.00, 5, 4, 'WiFi,ThreeBeds', 'room95a.jpg,room95b.jpg'),
(96, 11, N'Suite River View', N'Phòng Suite cao cấp nhìn toàn cảnh sông', 2, 250.00, 2, 2, 'Balcony,Minibar,RiverView', 'room96a.jpg,room96b.jpg'),

-- HOTEL ID 12: Hạ Long Bay View (2 bản ghi)
(97, 12, N'Deluxe King', N'Phòng Deluxe có ban công nhìn ra vịnh', 2, 380.00, 15, 12, 'WiFi,BayView,Balcony', 'room97a.jpg,room97b.jpg'),
(98, 12, N'Presidential Suite', N'Phòng Tổng thống cao cấp nhất', 4, 1500.00, 1, 1, 'PrivateTerrace,SpaAccess', 'room98a.jpg,room98b.jpg'),

-- HOTEL ID 13: Khách sạn Kim Long (1 bản ghi)
(99, 13, N'Single Economy', N'Phòng đơn tiết kiệm, không có cửa sổ', 1, 60.00, 20, 18, 'WiFi,AC', 'room99a.jpg,room99b.jpg'),

-- HOTEL ID 14: Sapa Retreat (3 bản ghi)
(100, 14, N'Mountain View Deluxe', N'Phòng Deluxe nhìn ra núi', 2, 220.00, 10, 10, 'Heating,MountainView', 'room100a.jpg,room100b.jpg'),
(101, 14, N'Family Bungalow', N'Bungalow gia đình', 4, 350.00, 5, 5, 'Fireplace,FourBeds', 'room101a.jpg,room101b.jpg'),
(102, 14, N'Premium Suite', N'Phòng Suite cao cấp có lò sưởi', 2, 450.00, 3, 2, 'Hammam,LoungeAccess', 'room102a.jpg,room102b.jpg'),

-- HOTEL ID 15: Vũng Tàu Lighthouse (2 bản ghi)
(103, 15, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 130.00, 15, 15, 'WiFi,BeachAccess', 'room103a.jpg,room103b.jpg'),
(104, 15, N'Family Room', N'Phòng lớn cho gia đình', 4, 200.00, 8, 8, 'KidsClub,TwoBeds', 'room104a.jpg,room104b.jpg'),

-- HOTEL ID 16: Quy Nhơn Seafront (3 bản ghi)
(105, 16, N'Deluxe King Seaview', N'Phòng King Deluxe nhìn ra biển', 2, 250.00, 12, 10, 'WiFi,Seaview,Balcony', 'room105a.jpg,room105b.jpg'),
(106, 16, N'Standard Twin', N'Phòng tiêu chuẩn 2 giường đơn', 2, 170.00, 15, 15, 'WiFi,AC', 'room106a.jpg,room106b.jpg'),
(107, 16, N'Executive Suite', N'Phòng Suite điều hành', 2, 400.00, 3, 3, 'GymAccess,Minibar', 'room107a.jpg,room107b.jpg'),

-- HOTEL ID 17: Thanh Hóa Sunset (1 bản ghi)
(108, 17, N'Standard Double', N'Phòng đôi tiêu chuẩn', 2, 85.00, 25, 20, 'WiFi,Breakfast', 'room108a.jpg,room108b.jpg'),

-- HOTEL ID 18: Tuy Hòa Pearl (2 bản ghi)
(109, 18, N'Standard Single', N'Phòng đơn tiêu chuẩn', 1, 70.00, 10, 10, 'WiFi,AC', 'room109a.jpg,room109b.jpg'),
(110, 18, N'Superior Double', N'Phòng đôi cao cấp', 2, 120.00, 8, 8, 'WiFi,Minibar', 'room110a.jpg,room110b.jpg'),

-- HOTEL ID 19: Bình Thuận Ocean Star (3 bản ghi)
(111, 19, N'Private Pool Villa', N'Biệt thự hồ bơi riêng biệt', 2, 850.00, 5, 5, 'PrivatePool,Massage,Seaview', 'room111a.jpg,room111b.jpg'),
(112, 19, N'Deluxe King', N'Phòng King Deluxe nhìn ra biển', 2, 350.00, 10, 9, 'Balcony,Seaview', 'room112a.jpg,room112b.jpg'),
(113, 19, N'Ocean Star Suite', N'Phòng Suite cao cấp nhất của resort', 4, 1500.00, 1, 1, 'ButlerService,PrivateBar', 'room113a.jpg,room113b.jpg'),

-- HOTEL ID 20: Hà Giang Grand View (1 bản ghi)
(114, 20, N'Mountain View Double', N'Phòng đôi có tầm nhìn ra núi', 2, 100.00, 15, 15, 'Heating,MountainView', 'room114a.jpg,room114b.jpg'),

-- HOTEL ID 21: Ninh Bình Lotus (3 bản ghi)
(115, 21, N'Superior Twin', N'Phòng Twin cao cấp', 2, 180.00, 10, 10, 'WiFi,GardenView', 'room115a.jpg,room115b.jpg'),
(116, 21, N'Bungalow Garden', N'Bungalow có vườn riêng', 2, 250.00, 5, 5, 'Terrace,BikeRental', 'room116a.jpg,room116b.jpg'),
(117, 21, N'Family Connected', N'Phòng gia đình có cửa thông', 4, 380.00, 3, 3, 'TwoRooms,FourBeds', 'room117a.jpg,room117b.jpg'),

-- HOTEL ID 22: Bạc Liêu Heritage (2 bản ghi)
(118, 22, N'Standard Double', N'Phòng đôi tiêu chuẩn', 2, 95.00, 15, 15, 'WiFi,Desk', 'room118a.jpg,room118b.jpg'),
(119, 22, N'Business King', N'Phòng King cho khách công tác', 2, 150.00, 8, 8, 'BusinessCenter,Desk', 'room119a.jpg,room119b.jpg'),

-- HOTEL ID 23: Tokyo Sky Tower Hotel (2 bản ghi)
(120, 23, 'Executive King', 'High floor room with premium amenities', 2, 450.00, 10, 9, 'Concierge,Minibar,CityView', 'room120a.jpg,room120b.jpg'),
(121, 23, 'Tokyo Suite', 'Spacious suite with skyline view', 3, 900.00, 3, 3, 'SpaAccess,PrivateBar', 'room121a.jpg,room121b.jpg'),

-- HOTEL ID 24: Rome Historic Stay (1 bản ghi)
(122, 24, 'Standard Double', 'Double room overlooking the street', 2, 175.00, 15, 15, 'WiFi,Breakfast', 'room122a.jpg,room122b.jpg'),

-- HOTEL ID 25: Bangkok Riverside (3 bản ghi)
(123, 25, 'Single Economy', 'Small single room, shared bathroom option', 1, 40.00, 20, 20, 'Fan,AC', 'room123a.jpg,room123b.jpg'),
(124, 25, 'Standard Twin', 'Twin room with river access', 2, 80.00, 15, 13, 'WiFi,RiverAccess', 'room124a.jpg,room124b.jpg'),
(125, 25, 'Family Room', 'Basic room for 4 people', 4, 120.00, 5, 5, 'AC,FourBeds', 'room125a.jpg,room125b.jpg'),

-- HOTEL ID 26: Dubai Marina Resort (2 bản ghi)
(126, 26, 'Deluxe Seaview', 'Luxury room with direct sea view', 2, 600.00, 10, 9, 'Seaview,Balcony,SpaAccess', 'room126a.jpg,room126b.jpg'),
(127, 26, 'Royal Suite', 'Highest tier suite with personalized service', 4, 2500.00, 1, 1, 'ButlerService,PrivatePool', 'room127a.jpg,room127b.jpg'),

-- HOTEL ID 27: London Central Suite (3 bản ghi)
(128, 27, 'Studio Apartment', 'Self-catering studio with kitchenette', 2, 230.00, 10, 10, 'Kitchenette,WiFi,SelfCheckIn', 'room128a.jpg,room128b.jpg'),
(129, 27, 'One-Bedroom Suite', 'Separate living room and bedroom', 3, 350.00, 5, 4, 'FullKitchen,Laundry', 'room129a.jpg,room129b.jpg'),
(130, 27, 'Executive Studio', 'Larger studio with premium furnishings', 2, 280.00, 8, 8, 'Kitchenette,Desk', 'room130a.jpg,room130b.jpg'),

-- HOTEL ID 28: Sydney Harbour View (1 bản ghi)
(131, 28, 'Opera View Deluxe', 'Room with direct view of the Opera House', 2, 350.00, 15, 15, 'HarbourView,Balcony,PoolAccess', 'room131a.jpg,room131b.jpg'),

-- HOTEL ID 29: Istanbul Grand Bazaar Hotel (2 bản ghi)
(132, 29, 'Standard Double', 'Double room with city view', 2, 150.00, 20, 18, 'WiFi,AC', 'room132a.jpg,room132b.jpg'),
(133, 29, 'Hammam Suite', 'Suite with private access to Hammam area', 2, 300.00, 5, 5, 'HammamAccess,Minibar', 'room133a.jpg,room133b.jpg'),

-- HOTEL ID 30: Rio de Janeiro Copacabana (3 bản ghi)
(134, 30, 'Standard Single', 'Single room near the beach', 1, 100.00, 10, 10, 'WiFi,BeachService', 'room134a.jpg,room134b.jpg'),
(135, 30, 'Ocean View Double', 'Double room with Copacabana view', 2, 180.00, 15, 14, 'Seaview,Balcony', 'room135a.jpg,room135b.jpg'),
(136, 30, 'Family Room', 'Room for 4 people with bunk beds', 4, 250.00, 5, 5, 'FourBeds,AC', 'room136a.jpg,room136b.jpg'),

-- HOTEL ID 31: Seoul Gangnam Place (2 bản ghi)
(137, 31, 'Business King', 'King room with large working area', 1, 200.00, 15, 15, 'Desk,BusinessCenter', 'room137a.jpg,room137b.jpg'),
(138, 31, 'Meeting Suite', 'Suite with small conference table', 3, 400.00, 5, 5, 'ConferenceTable,Minibar', 'room138a.jpg,room138b.jpg'),

-- HOTEL ID 32: Toronto Downtown Hostel (1 bản ghi)
(139, 32, 'Shared Dorm Bed', 'Bed in a 6-person shared dorm', 1, 35.00, 50, 45, 'SharedKitchen,Lockers', 'room139a.jpg,room139b.jpg'),

-- HOTEL ID 33: Cape Town Table View (3 bản ghi)
(140, 33, 'Deluxe Mountain View', 'Room overlooking Table Mountain', 2, 300.00, 10, 9, 'MountainView,Balcony,SpaAccess', 'room140a.jpg,room140b.jpg'),
(141, 33, 'Ocean King', 'King room with ocean view', 2, 380.00, 8, 8, 'Seaview,Minibar', 'room141a.jpg,room141b.jpg'),
(142, 33, 'Infinity Pool Suite', 'Suite with access to infinity pool area', 4, 700.00, 3, 3, 'InfinityPoolAccess,WineTours', 'room142a.jpg,room142b.jpg'),

-- HOTEL ID 34: Berlin Art Hotel (2 bản ghi)
(143, 34, 'Art Studio King', 'Unique room with local art pieces', 2, 190.00, 10, 10, 'ArtGalleryAccess,WiFi', 'room143a.jpg,room143b.jpg'),
(144, 34, 'Gallery Suite', 'Spacious suite near the on-site gallery', 3, 320.00, 5, 5, 'GalleryAccess,Bar', 'room144a.jpg,room144b.jpg'),

-- HOTEL ID 35: Mexico City Palace (3 bản ghi)
(145, 35, 'Standard Double', 'Double room in historic center', 2, 160.00, 15, 15, 'WiFi,AC', 'room145a.jpg,room145b.jpg'),
(146, 35, 'Rooftop View King', 'King room with view of the Zocalo', 2, 240.00, 10, 8, 'RooftopAccess,CityView', 'room146a.jpg,room146b.jpg'),
(147, 35, 'Colonial Suite', 'Suite with traditional furnishings', 3, 400.00, 5, 5, 'SaunaAccess,PoolAccess', 'room147a.jpg,room147b.jpg'),

-- HOTEL ID 36: Phnom Penh Diamond (1 bản ghi)
(148, 36, 'Deluxe River View', 'Luxury room overlooking the river', 2, 220.00, 15, 15, 'RiverView,CasinoAccess', 'room148a.jpg,room148b.jpg'),

-- HOTEL ID 37: San Francisco Bridge View (2 bản ghi)
(149, 37, 'Standard Double', 'Double room with pet access', 2, 215.00, 10, 10, 'PetFriendly,WiFi', 'room149a.jpg,room149b.jpg'),
(150, 37, 'Golden Gate Balcony', 'Room with balcony view of Golden Gate Bridge', 2, 380.00, 5, 5, 'BridgeView,Balcony', 'room150a.jpg,room150b.jpg'),

-- HOTEL ID 38: Beijing Hutong Stay (3 bản ghi)
(151, 38, 'Courtyard Single', 'Small room overlooking the courtyard', 1, 80.00, 10, 10, 'GardenView,TeaHouseAccess', 'room151a.jpg,room151b.jpg'),
(152, 38, 'Traditional Double', 'Double room with traditional Chinese decor', 2, 120.00, 8, 8, 'BikeRental,AC', 'room152a.jpg,room152b.jpg'),
(153, 38, 'Hutong Family Room', 'Large room for 4 people', 4, 200.00, 5, 5, 'FourBeds,GardenAccess', 'room153a.jpg,room153b.jpg'),

-- HOTEL ID 39: Amsterdam Canal House (1 bản ghi)
(154, 39, 'Canal View Double', 'Double room overlooking the canal', 2, 200.00, 10, 10, 'CanalView,Breakfast', 'room154a.jpg,room154b.jpg'),

-- HOTEL ID 40: Vienna Concert Hotel (3 bản ghi)
(155, 40, 'Opera View King', 'King room with view of the Opera House', 2, 350.00, 10, 10, 'MusicLoungeAccess,CityView', 'room155a.jpg,room155b.jpg'),
(156, 40, 'Concert Suite', 'Luxury suite dedicated to music', 2, 600.00, 5, 5, 'SpaAccess,ValetService', 'room156a.jpg,room156b.jpg'),
(157, 40, 'Standard Double', 'Standard double room', 2, 250.00, 15, 12, 'WiFi,AC', 'room157a.jpg,room157b.jpg'),

-- HOTEL ID 41: New Delhi Royal Residency (2 bản ghi)
(158, 41, 'Mughal King', 'King room with Mughal-inspired decor', 2, 160.00, 15, 15, 'PoolAccess,AC', 'room158a.jpg,room158b.jpg'),
(159, 41, 'Events Suite', 'Suite near event and conference areas', 3, 300.00, 5, 4, 'CateringService,Minibar', 'room159a.jpg,room159b.jpg'),

-- HOTEL ID 42: Hanoi Cozy Corner (1 bản ghi)
(160, 42, N'Standard Twin', N'Phòng Twin tiêu chuẩn, tiện nghi cơ bản', 2, 50.00, 10, 10, 'CommonAreaAccess,AC', 'room160a.jpg,room160b.jpg');

INSERT INTO Booking (bookingId, userId, hotelId, roomId, checkInDate, checkOutDate, totalAmount, bookingStatus)
VALUES
-- Bookings in December 2025
(4, 4, 3, 8, '2025-12-08', '2025-12-10', 180.00, 'Confirmed'),       -- 2 nights @ 90.00
(5, 5, 5, 4, '2025-12-19', '2025-12-23', 1400.00, 'Pending'),      -- 4 nights @ 350.00
(6, 6, 10, 7, '2025-12-01', '2025-12-03', 640.00, 'Confirmed'),      -- 2 nights @ 320.00
(7, 7, 8, 5, '2025-12-24', '2025-12-26', 360.00, 'Confirmed'),      -- 2 nights @ 180.00
(8, 8, 9, 13, '2025-12-28', '2026-01-01', 4800.00, 'Confirmed'),    -- 4 nights @ 1200.00
(9, 9, 4, 11, '2025-12-11', '2025-12-14', 450.00, 'Pending'),      -- 3 nights @ 150.00
(10, 10, 6, 9, '2025-12-04', '2025-12-06', 960.00, 'Confirmed'),     -- 2 nights @ 480.00
(11, 11, 7, 10, '2025-12-17', '2025-12-21', 1000.00, 'Confirmed'),   -- 4 nights @ 250.00
(12, 12, 1, 6, '2025-12-03', '2025-12-08', 2750.00, 'Confirmed'),    -- 5 nights @ 550.00
(13, 13, 2, 12, '2025-12-26', '2025-12-28', 420.00, 'Cancelled'),    -- 2 nights @ 210.00
(14, 14, 15, 103, '2025-12-06', '2025-12-09', 390.00, 'Confirmed'),    -- 3 nights @ 130.00
(15, 15, 23, 120, '2025-12-20', '2025-12-22', 900.00, 'Pending'),     -- 2 nights @ 450.00
(16, 16, 30, 135, '2025-12-14', '2025-12-18', 720.00, 'Confirmed'),   -- 4 nights @ 180.00
(17, 17, 34, 143, '2025-12-10', '2025-12-12', 380.00, 'Confirmed'),   -- 2 nights @ 190.00
(18, 18, 38, 152, '2025-12-07', '2025-12-10', 360.00, 'Pending'),     -- 3 nights @ 120.00
(19, 19, 19, 111, '2025-12-23', '2025-12-27', 3400.00, 'Confirmed'),   -- 4 nights @ 850.00
(20, 20, 27, 128, '2025-12-02', '2025-12-05', 690.00, 'Confirmed'),   -- 3 nights @ 230.00
(21, 21, 16, 105, '2025-12-13', '2025-12-15', 500.00, 'Pending'),     -- 2 nights @ 250.00
(22, 22, 40, 156, '2025-12-29', '2026-01-02', 2400.00, 'Confirmed'),   -- 4 nights @ 600.00
(23, 23, 1, 16, '2025-12-05', '2025-12-07', 760.00, 'Confirmed'),     -- 2 nights @ 380.00
(24, 24, 2, 22, '2025-12-18', '2025-12-22', 780.00, 'Confirmed'),     -- 4 nights @ 195.00
(25, 25, 3, 18, '2025-12-16', '2025-12-19', 600.00, 'Pending'),      -- 3 nights @ 200.00
(26, 26, 4, 21, '2025-12-25', '2025-12-27', 320.00, 'Cancelled'),    -- 2 nights @ 160.00
(27, 27, 5, 24, '2025-12-09', '2025-12-11', 340.00, 'Confirmed'),     -- 2 nights @ 170.00
(28, 28, 6, 19, '2025-12-12', '2025-12-15', 930.00, 'Confirmed'),     -- 3 nights @ 310.00
(29, 29, 7, 20, '2025-12-20', '2025-12-24', 1600.00, 'Pending'),     -- 4 nights @ 400.00
(30, 30, 8, 25, '2025-12-01', '2025-12-05', 1120.00, 'Confirmed'),   -- 4 nights @ 280.00
(31, 31, 9, 23, '2025-12-15', '2025-12-18', 1950.00, 'Confirmed'),   -- 3 nights @ 650.00
(32, 32, 10, 27, '2025-12-27', '2025-12-30', 780.00, 'Cancelled'),    -- 3 nights @ 260.00
(33, 33, 11, 96, '2025-12-04', '2025-12-06', 500.00, 'Confirmed'),    -- 2 nights @ 250.00
(34, 1, 12, 97, '2025-12-10', '2025-12-14', 1520.00, 'Confirmed'),   -- 4 nights @ 380.00
(35, 2, 14, 100, '2025-12-16', '2025-12-18', 440.00, 'Pending'),     -- 2 nights @ 220.00
(36, 3, 26, 126, '2025-12-21', '2025-12-24', 1800.00, 'Confirmed'),   -- 3 nights @ 600.00
(37, 4, 32, 139, '2025-12-07', '2025-12-11', 140.00, 'Confirmed'),   -- 4 nights @ 35.00
(38, 5, 36, 148, '2025-12-19', '2025-12-21', 440.00, 'Pending'),     -- 2 nights @ 220.00

-- Bookings in January 2026 and mixed dates
(39, 6, 33, 140, '2026-01-03', '2026-01-06', 900.00, 'Confirmed'),    -- 3 nights @ 300.00
(40, 7, 28, 131, '2026-01-10', '2026-01-13', 1050.00, 'Confirmed'),   -- 3 nights @ 350.00
(41, 8, 42, 160, '2026-01-01', '2026-01-03', 100.00, 'Confirmed'),    -- 2 nights @ 50.00
(42, 9, 39, 154, '2026-01-15', '2026-01-19', 800.00, 'Pending'),      -- 4 nights @ 200.00
(43, 10, 41, 158, '2026-01-22', '2026-01-24', 320.00, 'Confirmed'),   -- 2 nights @ 160.00
(44, 11, 25, 124, '2026-01-05', '2026-01-07', 160.00, 'Confirmed'),   -- 2 nights @ 80.00
(45, 12, 19, 112, '2026-01-12', '2026-01-16', 1400.00, 'Pending'),    -- 4 nights @ 350.00
(46, 13, 22, 119, '2026-01-08', '2026-01-13', 750.00, 'Confirmed'),   -- 5 nights @ 150.00
(47, 14, 17, 108, '2026-01-14', '2026-01-16', 170.00, 'Confirmed'),   -- 2 nights @ 85.00
(48, 15, 35, 146, '2026-01-20', '2026-01-24', 960.00, 'Pending'),     -- 4 nights @ 240.00
(49, 16, 20, 114, '2026-01-03', '2026-01-05', 200.00, 'Cancelled'),    -- 2 nights @ 100.00
(50, 17, 1, 36, '2026-01-25', '2026-01-28', 1200.00, 'Confirmed'),   -- 3 nights @ 400.00
(51, 18, 3, 49, '2026-01-11', '2026-01-13', 1000.00, 'Confirmed'),   -- 2 nights @ 500.00
(52, 19, 6, 50, '2026-01-17', '2026-01-20', 435.00, 'Pending'),      -- 3 nights @ 145.00
(53, 20, 9, 71, '2026-01-29', '2026-02-01', 5400.00, 'Confirmed');   -- 3 nights @ 1800.00

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

select * from User ;
Use go_project;

