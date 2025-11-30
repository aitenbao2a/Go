package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.*;


@WebServlet("/home") // Truy cập bằng: http://localhost:8080/AgodaMVC/home
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Giả lập lấy dữ liệu từ Database (Tạo danh sách khách sạn)
        List<Hotel> hotels = new ArrayList<>();
        
        hotels.add(new Hotel("Khách sạn Continental Sài Gòn", "🏨", 5, 9.2, 2847, "Quận 1, Trung tâm Hồ Chí Minh", 2450000, 25));
        hotels.add(new Hotel("Rex Hotel Saigon", "🏢", 5, 9.0, 3421, "Quận 1, Phố đi bộ", 2890000, 20));
        hotels.add(new Hotel("Sheraton Saigon Hotel & Towers", "🌆", 5, 8.9, 1956, "Quận 1, Gần Nhà Thờ Đức Bà", 3250000, 15));
        hotels.add(new Hotel("Caravelle Saigon", "🏙️", 5, 9.1, 2200, "Quận 1, Đối diện Nhà hát Lớn", 2600000, 18));

        // 2. Đẩy dữ liệu sang View (JSP)
        request.setAttribute("hotelList", hotels);
        
        // 3. Chuyển hướng về trang hiển thị
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}