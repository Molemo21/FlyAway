import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int passengers = Integer.parseInt(request.getParameter("passengers"));
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/takeoff_db", "root", "Molemo.10");
            
            for (int i = 1; i <= passengers; i++) {
                String firstName = request.getParameter("first_name_" + i);
                String lastName = request.getParameter("last_name_" + i);
                String email = request.getParameter("email_" + i);
                String phone = request.getParameter("phone_" + i);

                String sql = "INSERT INTO passengers (first_name, last_name, email, phone) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, phone);
                ps.executeUpdate();
            }
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("PaymentMethod.jsp");
    }
}
