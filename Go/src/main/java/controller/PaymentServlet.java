package controller;

import dao.BookingDAO;
import dao.HotelDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Booking;
import model.Hotel;
import model.Room;
import model.User;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        User user = (User) session.getAttribute("user");
        Booking booking = (Booking) session.getAttribute("pendingBooking");
        Room room = (Room) session.getAttribute("bookingRoom");

        // BẮT BUỘC có booking
        if (user == null || booking == null || room == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        try {
            HotelDAO hotelDAO = new HotelDAO();
            Hotel hotel = hotelDAO.getHotelById(booking.getHotelId());

            if (hotel == null) {
                request.setAttribute("error", "Không tìm thấy khách sạn.");
                request.getRequestDispatcher("/error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("user", user);
            request.setAttribute("booking", booking);
            request.setAttribute("room", room);
            request.setAttribute("hotel", hotel);

            request.getRequestDispatcher("/view/payment.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi tải trang thanh toán");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        User user = (User) session.getAttribute("user");
        Booking booking = (Booking) session.getAttribute("pendingBooking");

        if (user == null || booking == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");

        if (paymentMethod == null || paymentMethod.isEmpty()) {
            request.setAttribute("error", "Vui lòng chọn phương thức thanh toán");
            doGet(request, response);
            return;
        }

        try {
            booking.setPaymentMethod(paymentMethod);
            booking.setPaymentStatus("PAID");
            booking.setBookingStatus("CONFIRMED");

            Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
            BookingDAO bookingDAO = new BookingDAO(conn);

            int bookingId = bookingDAO.createBooking(booking);

            if (bookingId > 0) {
                session.removeAttribute("pendingBooking");
                session.removeAttribute("bookingRoom");

                session.setAttribute("completedBookingId", bookingId);
                response.sendRedirect(request.getContextPath() + "/booking-success");
            } else {
                request.setAttribute("error", "Thanh toán thất bại");
                doGet(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi xử lý thanh toán");
            doGet(request, response);
        }
    }
}
