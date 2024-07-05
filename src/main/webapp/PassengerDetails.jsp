<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Passenger Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
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

        input[type="text"], input[type="email"], input[type="submit"] {
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

        .passenger-info {
            margin-bottom: 20px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
        }

        .passenger-info h2 {
            margin-top: 0;
        }
    </style>
</head>
<body>
    <h1>Passenger Details</h1>
    <form action="ConfirmBookingServlet" method="post">
        <%
            int passengers = Integer.parseInt(request.getParameter("passengers"));
            for (int i = 1; i <= passengers; i++) {
        %>
        <div class="passenger-info">
            <h2>Passenger <%= i %></h2>
            <table>
                <tr>
                    <td>First Name:</td>
                    <td><input type="text" name="first_name_<%= i %>" required></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><input type="text" name="last_name_<%= i %>" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email_<%= i %>" required></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" name="phone_<%= i %>" required></td>
                </tr>
            </table>
        </div>
        <%
            }
        %>
        <input type="hidden" name="passengers" value="<%= passengers %>">
        <input type="submit" value="Confirm Booking">
    </form>
</body>
</html>
