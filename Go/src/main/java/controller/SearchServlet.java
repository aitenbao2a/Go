package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String destination = request.getParameter("destination");
        
        if (destination == null || destination.trim().isEmpty()) {
            destination = "Việt Nam";
        }
        
        request.setAttribute("currentDest", destination);
        request.setAttribute("searchMessage", "Kết quả tìm kiếm cho: " + destination);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}