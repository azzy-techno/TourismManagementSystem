<%@ page import="java.util.*, com.tourist.dto.*" %>
<%@ page import="com.tourist.dao.BookingImplementation, com.tourist.dao.DestinationImplementation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Bookings</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
        }
        body {
            background-color: #1a1a1a;
            color: whitesmoke;
        }
        h1 {
            text-align: center;
            color: goldenrod;
            margin-top: 30px;
        }
        .booking-card {
            background-color: #2e2e2e;
            border: 1px solid goldenrod;
            border-radius: 10px;
            padding: 20px;
            margin: 20px auto;
            max-width: 700px;
            box-shadow: 0 4px 10px rgba(255, 215, 0, 0.2);
        }
        .booking-card img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
        }
        .booking-card h3 {
            color: goldenrod;
            margin-bottom: 10px;
        }
        .booking-card p {
            margin: 6px 0;
        }
    </style>
</head>
<body>

<%@ include file="navigation.jsp" %>

<%
    Integer userId = (Integer) session.getAttribute("user_id");

    if (userId == null) {
%>
        <h2 style='text-align:center; color: red;'>Please log in to view your bookings.</h2>
<%
        return;
    }

    BookingImplementation bookingDAO = new BookingImplementation();
    List<Booking> userBookings = bookingDAO.getBookingsByUserId(userId);

    if (userBookings == null || userBookings.isEmpty()) {
%>
        <h2 style='text-align:center; color: goldenrod;'>No bookings found.</h2>
<%
        return;
    }

    DestinationImplementation destDAO = new DestinationImplementation();
    List<Destination> allDestinations = destDAO.getAllDestinations();
    Map<Integer, Destination> destinationMap = new HashMap<>();
    for(Destination d : allDestinations){
        destinationMap.put(d.getDestination_id(), d);
    }
%>

<h1>Welcome, <%= name %>! Here are your bookings:</h1>

<%
    for (Booking booking : userBookings) {
        Destination dest = destinationMap.get(booking.getDestination_id());
        if (dest != null) {
%>
    <div class="booking-card">
        <img src="<%= dest.getDestination_image() %>" alt="Destination Image" />
        <h3><%= dest.getDestination_name() %></h3>
        <p><strong>Booking Date:</strong> <%= booking.getBooking_date() %></p>
        <p><strong>Status:</strong> <%= booking.getStatus() %></p>
        <p><strong>Price:</strong> ₹<%= booking.getPrice() %></p>
        <p><strong>Remarks:</strong> <%= booking.getRemarks() != null ? booking.getRemarks() : "N/A" %></p>
    </div>
<%
        }
    }
%>

<%@ include file="footer.jsp" %>

</body>
</html>
