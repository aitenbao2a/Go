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

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String keyword = request.getParameter("keyword");
        if (keyword != null) {
            keyword = keyword.trim();
        }

        System.out.println("Keyword nhận được: " + keyword);

        HotelDAO dao = new HotelDAO();
        List<Hotel> hotels;

        if (keyword == null || keyword.isEmpty()) {
            hotels = dao.getAllHotels();
        } else {
            hotels = dao.searchHotels(keyword);
        }

        request.setAttribute("listHotels", hotels);
        request.setAttribute("searchKeyword", keyword);

        request.getRequestDispatcher("view/hotel_search.jsp")
               .forward(request, response);
    }
}
