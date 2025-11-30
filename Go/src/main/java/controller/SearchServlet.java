package controller;

import dao.HotelDAO;
import model.Hotel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search") 
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword"); 
        HotelDAO dao = new HotelDAO();
        List<Hotel> list;
        if (keyword != null && !keyword.isEmpty()) {
            // Nếu có từ khóa -> Tìm kiếm (Bạn cần viết thêm hàm search trong DAO)
             list = dao.searchHotels(keyword); 
        } else {
            // Nếu không nhập gì -> Lấy tất cả
            list = dao.getAllHotels();
        }
        // 3. Đẩy dữ liệu sang JSP để hiển thị
        request.setAttribute("listHotels", list);
        // 4. Chuyển hướng về trang index.jsp
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}