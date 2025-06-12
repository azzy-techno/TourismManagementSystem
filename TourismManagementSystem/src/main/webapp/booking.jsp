<%@ page import="com.tourist.dto.Destination" %>
<%@ page import="com.tourist.dao.DestinationImplementation" %>
<%@ page import="jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DestinationImplementation dao = new DestinationImplementation();
    Destination d = dao.getDestination(id);
    if (d == null) {
%>
        <h2>Destination not found</h2>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book <%= d.getDestination_name() %></title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .booking-container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
        }
        img {
            max-width: 100%;
            border-radius: 10px;
        }
        h2 {
            color: #2a9d8f;
        }
        .price {
            color: #e76f51;
            font-size: 20px;
            font-weight: bold;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #2a9d8f;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="booking-container">
    <h2>Book Your Trip to <%= d.getDestination_name() %></h2>
    <img src="<%= d.getDestination_image() %>" alt="<%= d.getDestination_name() %>">
    <p><%= d.getDestination_paragraph() %></p>
    <p class="price">Only ₹<%= d.getDestination_price() %>/day</p>

    <!-- Booking Form -->
    <form action="confirmBooking.jsp" method="post">
        <input type="hidden" name="destination_id" value="<%= d.getDestination_id() %>">
        <input type="hidden" name="destination_name" value="<%= d.getDestination_name() %>">
        <label>Your Full Name</label>
        <input type="text" name="full_name" required>

        <label>Email Address</label>
        <input type="email" name="email" required>

        <label>Travel Date</label>
        <input type="date" name="travel_date" required>

        <label>Number of Days</label>
        <input type="text" name="no_of_days" required>

        <button type="submit">Confirm Booking</button>
    </form>
</div>

</body>
</html>
