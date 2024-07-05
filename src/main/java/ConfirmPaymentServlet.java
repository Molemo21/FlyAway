import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        String bookingId = request.getParameter("bookingId");
        String totalPrice = request.getParameter("totalPrice");

        // Dummy payment processing
        boolean paymentSuccess = true; // Assume the payment is successful for demonstration purposes

        if (paymentSuccess) {
            response.sendRedirect("BookingConfirmation.jsp");
        } else {
            response.sendRedirect("PaymentMethod.jsp?error=PaymentFailed");
        }
    }
}
