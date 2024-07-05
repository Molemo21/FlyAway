<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Flights</title>
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

        #flightsTable, #summaryTable {
            margin: 20px auto;
            border-collapse: collapse;
            width: 90%;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        #flightsTable th, #summaryTable th {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            text-align: left;
        }

        #flightsTable td, #summaryTable td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        #flightsTable tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        #flightsTable tr:hover {
            background-color: #f1f1f1;
        }

        #summaryTable {
            width: 30%;
            float: right;
            margin-right: 5%;
        }

        #flightsTable {
            width: 60%;
            float: left;
        }

        button {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838;
        }

        input[type="number"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
    </style>
    <script>
        function updateSummary(flightDate, departureLocation, arrivalLocation, departureTime, arrivalTime, pricePerPerson) {
            document.getElementById('summaryDate').innerText = flightDate;
            document.getElementById('summaryDepartureLocation').innerText = departureLocation;
            document.getElementById('summaryArrivalLocation').innerText = arrivalLocation;
            document.getElementById('summaryDepartureTime').innerText = departureTime;
            document.getElementById('summaryArrivalTime').innerText = arrivalTime;
            document.getElementById('summaryPricePerPerson').innerText = pricePerPerson;

            updateTotalPrice();
        }

        function updateTotalPrice() {
            var pricePerPerson = parseFloat(document.getElementById('summaryPricePerPerson').innerText);
            var passengers = parseInt(document.getElementById('passengers').value);
            var totalPrice = pricePerPerson * passengers;

            document.getElementById('summaryTotalPrice').innerText = totalPrice.toFixed(2);
        }
    </script>
</head>
<body>
    <h1>Available Flights</h1>
    <table id="flightsTable">
        <tr>
            <th>Date</th>
            <th>Departure Location</th>
            <th>Arrival Location</th>
            <th>Departure Time</th>
            <th>Arrival Time</th>
            <th>Seats Available</th>
            <th>Price per Person</th>
            <th>Select</th>
        </tr>
        <%
            String departureLocation = request.getParameter("departure_location");
            String arrivalLocation = request.getParameter("arrival_location");
            String departureDatetime = request.getParameter("departure_datetime");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/takeoff_db", "root", "Molemo.10");
                String sql = "SELECT * FROM available_flights WHERE departure_location = ? AND arrival_location = ? AND flight_date BETWEEN '2024-07-07' AND '2024-07-14'";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, departureLocation);
                ps.setString(2, arrivalLocation);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String flightDate = rs.getDate("flight_date").toString();
                    String deptLoc = rs.getString("departure_location");
                    String arrLoc = rs.getString("arrival_location");
                    String deptTime = rs.getTime("departure_time").toString();
                    String arrTime = rs.getTime("arrival_time").toString();
                    int seatsAvailable = rs.getInt("seats_available");
                    String pricePerPerson = rs.getBigDecimal("price_per_person").toString();

                    out.println("<tr>");
                    out.println("<td>" + flightDate + "</td>");
                    out.println("<td>" + deptLoc + "</td>");
                    out.println("<td>" + arrLoc + "</td>");
                    out.println("<td>" + deptTime + "</td>");
                    out.println("<td>" + arrTime + "</td>");
                    out.println("<td id='seatsAvailable'>" + seatsAvailable + "</td>");
                    out.println("<td id='pricePerPerson'>" + pricePerPerson + "</td>");
                    out.println("<td><button type='button' onclick=\"updateSummary('" + flightDate + "', '" + deptLoc + "', '" + arrLoc + "', '" + deptTime + "', '" + arrTime + "', " + pricePerPerson + ")\">Select</button></td>");
                    out.println("</tr>");
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    <div>
        <table id="summaryTable">
            <tr>
                <th colspan="2">Flight Summary</th>
            </tr>
            <tr>
                <td>Date</td>
                <td id="summaryDate"></td>
            </tr>
            <tr>
                <td>Departure Location</td>
                <td id="summaryDepartureLocation"></td>
            </tr>
            <tr>
                <td>Arrival Location</td>
                <td id="summaryArrivalLocation"></td>
            </tr>
            <tr>
                <td>Departure Time</td>
                <td id="summaryDepartureTime"></td>
            </tr>
            <tr>
                <td>Arrival Time</td>
                <td id="summaryArrivalTime"></td>
            </tr>
            <tr>
                <td>Price per Person</td>
                <td id="summaryPricePerPerson"></td>
            </tr>
            <tr>
                <td>Passengers</td>
                <td><input type="number" id="passengers" name="passengers" value="1" min="1" oninput="updateTotalPrice()"></td>
            </tr>
            <tr>
                <td>Total Price</td>
                <td id="summaryTotalPrice">0.00</td>
            </tr>
            <tr>
                <td colspan="2"><button onclick="location.href='PassengerDetails.jsp?passengers=' + document.getElementById('passengers').value;">Continue to Passenger Details</button></td>
            </tr>
        </table>
    </div>
</body>
</html>
