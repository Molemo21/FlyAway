

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SearchFlightsServlet")
public class SearchFlightsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/takeoff_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Molemo.10";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tripType = request.getParameter("trip_type");
        String departureLocation = request.getParameter("departure_location");
        String arrivalLocation = request.getParameter("arrival_location");
        String departureDatetime = request.getParameter("departure_datetime");
        String returnDatetime = request.getParameter("return_datetime");
        int passengers = Integer.parseInt(request.getParameter("passengers"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO flight_search (trip_type, departure_location, arrival_location, departure_datetime, return_datetime, passengers) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tripType);
            ps.setString(2, departureLocation);
            ps.setString(3, arrivalLocation);
            ps.setString(4, departureDatetime);
            ps.setString(5, returnDatetime.isEmpty() ? null : returnDatetime);
            ps.setInt(6, passengers);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to the available flights page
        response.sendRedirect("availableFlights.jsp?departure_location=" + departureLocation + "&arrival_location=" + arrivalLocation + "&departure_datetime=" + departureDatetime);
    }
}
