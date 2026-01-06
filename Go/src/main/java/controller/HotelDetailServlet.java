package controller;

import dao.HotelDAO;
import dao.RoomDAO;
import model.Hotel;
import model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/hotel-detail")
public class HotelDetailServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int hotelId = Integer.parseInt(request.getParameter("id"));
            
            HotelDAO hotelDAO = new HotelDAO();
            RoomDAO roomDAO = new RoomDAO();
            
            // 1. Lấy thông tin khách sạn
            Hotel hotel = hotelDAO.getHotelById(hotelId);
            
            // 2. Lấy danh sách phòng của khách sạn đó
            List<Room> rooms = roomDAO.getRoomsByHotelId(hotelId);
            
            if (hotel != null) {
                request.setAttribute("hotel", hotel);
                request.setAttribute("listRooms", rooms);
                request.getRequestDispatcher("view/hotel_detail.jsp").forward(request, response);
            } else {
                response.sendRedirect("index.jsp"); 
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp");
        }
    }
}