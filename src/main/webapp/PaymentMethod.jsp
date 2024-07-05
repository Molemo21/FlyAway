<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Method</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 800px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        input[type="text"], input[type="submit"], input[type="month"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Payment Method</h1>
    <form action="ConfirmPaymentServlet" method="post">
        <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>">
        <input type="hidden" name="totalPrice" value="<%= request.getParameter("totalPrice") %>">
        <table>
            <tr>
                <td>Card Number:</td>
                <td><input type="text" name="cardNumber" required></td>
            </tr>
            <tr>
                <td>Expiry Date:</td>
                <td><input type="month" name="expiryDate" required></td>
            </tr>
            <tr>
                <td>CVV:</td>
                <td><input type="text" name="cvv" required></td>
            </tr>
            <tr>
                <td>Name on Card:</td>
                <td><input type="text" name="cardName" required></td>
            </tr>
            <tr>
                <td>Billing Address:</td>
                <td><input type="text" name="billingAddress" required></td>
            </tr>
        </table>
        <input type="submit" value="Confirm Payment">
    </form>
</body>
</html>
