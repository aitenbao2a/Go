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

    	request.setCharacterEncoding("UTF-8");
    	
        String keyword = request.getParameter("keyword"); 
        HotelDAO dao = new HotelDAO();
        List<Hotel> list;
        if (keyword != null && !keyword.isEmpty()) {
            // Nếu có từ khóa -> Tìm kiếm
             list = dao.searchHotels(keyword); 
        } else {
            // Nếu không nhập gì -> Lấy tất cả
            list = dao.getAllHotels();
        }
        // 3. Đẩy dữ liệu sang JSP để hiển thị
        request.setAttribute("listHotels", list);
        request.setAttribute("searchKeyword", keyword);
        // 4. Chuyển hướng về trang index.jsp
        request.getRequestDispatcher("view/hotel_search.jsp").forward(request, response);
    }
}