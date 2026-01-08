package controller;

import dao.RoomDAO;
import dao.HotelDAO;
import dao.BookingDAO;
import model.Room;
import model.Hotel;
import model.User;
import model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    /**
     * HIỂN THỊ TRANG BOOKING
     * Lấy dữ liệu: user + hotel + room + ngày + số đêm + tiền
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Bắt buộc đăng nhập
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String roomIdStr = request.getParameter("roomId");
            String hotelIdStr = request.getParameter("hotelId");
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");
            String numberOfRoomsStr = request.getParameter("numberOfRooms");

            if (roomIdStr == null || hotelIdStr == null) {
                response.sendRedirect(request.getContextPath());
                return;
            }

            int roomId = Integer.parseInt(roomIdStr);
            int hotelId = Integer.parseInt(hotelIdStr);

            RoomDAO roomDAO = new RoomDAO();
            HotelDAO hotelDAO = new HotelDAO();

            Room room = roomDAO.getRoomById(roomId);
            Hotel hotel = hotelDAO.getHotelById(hotelId);

            if (room == null || hotel == null) {
                request.setAttribute("error", "Không tìm thấy phòng hoặc khách sạn");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            // Xử lý ngày
            LocalDate checkIn;
            LocalDate checkOut;

            if (checkInStr != null && !checkInStr.isEmpty()
                    && checkOutStr != null && !checkOutStr.isEmpty()) {
                checkIn = LocalDate.parse(checkInStr);
                checkOut = LocalDate.parse(checkOutStr);
            } else {
                checkIn = LocalDate.now();
                checkOut = checkIn.plusDays(1);
            }

            // Số phòng
            int numberOfRooms = (numberOfRoomsStr != null && !numberOfRoomsStr.isEmpty())
                    ? Integer.parseInt(numberOfRoomsStr)
                    : 1;

            // Số đêm
            long nights = ChronoUnit.DAYS.between(checkIn, checkOut);
            if (nights <= 0) nights = 1;

            // Tính trước tổng tiền để hiển thị
            BigDecimal pricePerNight = room.getPricePerNight();
            BigDecimal subtotal = pricePerNight
                    .multiply(BigDecimal.valueOf(nights))
                    .multiply(BigDecimal.valueOf(numberOfRooms));

            BigDecimal tax = subtotal.multiply(BigDecimal.valueOf(0.10));
            BigDecimal total = subtotal.add(tax);

            // Gửi dữ liệu sang booking.jsp
            request.setAttribute("room", room);
            request.setAttribute("hotel", hotel);
            request.setAttribute("user", user);
            request.setAttribute("checkIn", checkIn.toString());
            request.setAttribute("checkOut", checkOut.toString());
            request.setAttribute("nights", nights);
            request.setAttribute("numberOfRooms", numberOfRooms);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("tax", tax);
            request.setAttribute("total", total);

            request.getRequestDispatcher("/view/booking.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    /**
     * XỬ LÝ SUBMIT BOOKING
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            int hotelId = Integer.parseInt(request.getParameter("hotelId"));
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");
            int numberOfRooms = Integer.parseInt(request.getParameter("numberOfRooms"));
            int numberOfGuests = Integer.parseInt(request.getParameter("numberOfGuests"));

            String guestName = request.getParameter("guestName");
            String guestEmail = request.getParameter("guestEmail");
            String guestPhone = request.getParameter("guestPhone");
            String specialRequests = request.getParameter("specialRequests");

            Date checkIn = Date.valueOf(checkInStr);
            Date checkOut = Date.valueOf(checkOutStr);

            RoomDAO roomDAO = new RoomDAO();
            Room room = roomDAO.getRoomById(roomId);

            if (room == null) {
                throw new Exception("Room not found");
            }

            // Kiểm tra phòng còn không
            boolean available = roomDAO.isRoomAvailable(roomId, checkIn, checkOut, numberOfRooms);

            if (!available) {
                request.setAttribute("error", "Phòng không đủ số lượng trong khoảng thời gian này");
                doGet(request, response);
                return;
            }

            long nights = ChronoUnit.DAYS.between(
                    checkIn.toLocalDate(),
                    checkOut.toLocalDate()
            );

            if (nights <= 0) nights = 1;

            BigDecimal subtotal = room.getPricePerNight()
                    .multiply(BigDecimal.valueOf(nights))
                    .multiply(BigDecimal.valueOf(numberOfRooms));

            BigDecimal tax = subtotal.multiply(BigDecimal.valueOf(0.10));
            BigDecimal totalAmount = subtotal.add(tax);

            Booking booking = new Booking();
            booking.setUserId(user.getUserId());
            booking.setHotelId(hotelId);
            booking.setRoomId(roomId);
            booking.setCheckInDate(checkIn);
            booking.setCheckOutDate(checkOut);
            booking.setNumberOfRooms(numberOfRooms);
            booking.setNumberOfGuests(numberOfGuests);
            booking.setGuestName(guestName);
            booking.setGuestEmail(guestEmail);
            booking.setGuestPhone(guestPhone);
            booking.setSpecialRequests(specialRequests);
            booking.setTotalAmount(totalAmount);
            booking.setBookingStatus("Pending");
            booking.setPaymentStatus("Pending");
            booking.setCreatedAt(new Timestamp(System.currentTimeMillis()));

            // Lưu để qua trang payment
            session.setAttribute("pendingBooking", booking);
            session.setAttribute("bookingRoom", room);

            response.sendRedirect(request.getContextPath() + "/payment");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Không thể xử lý đặt phòng");
            doGet(request, response);
        }
    }
}
