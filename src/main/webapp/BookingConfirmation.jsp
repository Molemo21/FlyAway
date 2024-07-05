<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
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

        .confirmation-message {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            text-align: center;
        }

        .confirmation-message p {
            font-size: 18px;
            color: #555;
        }

        .confirmation-message a {
            display: inline-block;
            margin-top: 20px;
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .confirmation-message a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Booking Confirmation</h1>
    <div class="confirmation-message">
        <p>Thank you for your payment. Your booking has been successfully processed.</p>
        <a href="index.jsp">Go to Home</a>
    </div>
</body>
</html>
