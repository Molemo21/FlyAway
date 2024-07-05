
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TakeOFF - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1, h2 {
            text-align: center;
            color: #004080;
        }

        form {
            background-color: #fff;
            padding: 20px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        select, input[type="text"], input[type="datetime-local"], input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #004080;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #003366;
        }

        a {
            text-decoration: none;
            color: #004080;
            font-weight: bold;
            margin: 10px;
            float: right;
        }

        a:hover {
            color: #003366;
        }
    </style>
    <script type="text/javascript">
        function toggleReturnDate() {
            var tripType = document.querySelector('input[name="trip_type"]:checked').value;
            var returnRow = document.getElementById("returnRow");
            if (tripType === "one-way") {
                returnRow.style.display = "none";
            } else {
                returnRow.style.display = "table-row";
            }
        }

        window.onload = function() {
            toggleReturnDate(); // Set the initial state based on the default selected trip type
            var tripTypeRadios = document.getElementsByName("trip_type");
            for (var i = 0; i < tripTypeRadios.length; i++) {
                tripTypeRadios[i].onclick = toggleReturnDate;
            }
        };
    </script>
</head>
<body>
    <a href="clientlogin.jsp">ADMIN LOG IN</a>
    <h1>Welcome to TakeOFF</h1>
    <h2>Book Your Flight</h2>
    <form action="SearchFlightsServlet" method="post">
        <table>
            <tr>
                <td>Trip Type:</td>
                <td>
                    <input type="radio" name="trip_type" value="round-trip" checked> Round-Trip
                    <input type="radio" name="trip_type" value="one-way"> One-Way
                </td>
            </tr>
            <tr>
                <td>Departure Location:</td>
                <td>
                    <select name="departure_location" required>
                        <option value="" disabled selected>Select Departure</option>
                        <option value="CPT">Cape Town Int. Airport (CPT)</option>
                        <option value="PTA">Pretoria Int. Airport (PTA)</option>
                        <option value="DBN">Durban Int. (DBN)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Arrival Location:</td>
                <td>
                    <select name="arrival_location" required>
                        <option value="" disabled selected>Select Arrival</option>
                        <option value="CPT">Cape Town Int. Airport (CPT)</option>
                        <option value="PTA">Pretoria Int. Airport (PTA)</option>
                        <option value="DBN">Durban Int. (DBN)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Departure Date and Time:</td>
                <td><input type="datetime-local" name="departure_datetime" required></td>
            </tr>
            <tr id="returnRow">
                <td>Return Date and Time:</td>
                <td><input type="datetime-local" name="return_datetime"></td>
            </tr>
            <tr>
                <td>Passengers:</td>
                <td><input type="number" name="passengers" required min="1"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Search Flights"></td>
            </tr>
        </table>
    </form>
</body>
</html>
