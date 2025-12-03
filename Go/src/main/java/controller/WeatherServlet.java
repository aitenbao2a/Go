package controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/weather")
public class WeatherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, java.io.IOException {

        String lat = request.getParameter("lat");
        String lon = request.getParameter("lon");
        if (lat == null || lon == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing lat/lon");
            return;
        }

        String apiUrl = "https://api.open-meteo.com/v1/forecast?latitude="
            + lat + "&longitude=" + lon + "&current_weather=true";

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);

        int status = conn.getResponseCode();
        if (status != 200) {
            response.sendError(HttpServletResponse.SC_BAD_GATEWAY, "Error from weather API");
            return;
        }

        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            sb.append(line);
        }
        in.close();
        conn.disconnect();

        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(sb.toString());
    }
}
