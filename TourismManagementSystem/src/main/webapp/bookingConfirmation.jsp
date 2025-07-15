<%@page import="com.tourist.dao.*" %>
<%@ page import="com.tourist.dto.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="sessionCheck.jsp" %>

<%
String bookingIdStr = request.getParameter("booking_id");
Booking booking = null;
Destination destination = null;
Resort resort = null;
Restaurant restaurant = null;
Itinerary itinerary = null;

if (bookingIdStr != null) {
	try {
		int bookingId = Integer.parseInt(bookingIdStr);

		BookingInterface bookingDAO = new BookingImplementation();
		booking = bookingDAO.getBooking(bookingId);

		if (booking != null) {
	DestinationInterface destinationDAO = new DestinationImplementation();
	ResortInterface resortDAO = new ResortImplementation();
	RestaurantInterface restaurantDAO = new RestaurantImplementation();
	ItineraryInterface itineraryDAO = new ItineraryImplementation();

	destination = destinationDAO.getDestination(booking.getDestination_id());
	resort = resortDAO.getResort(booking.getResort_id());
	restaurant = restaurantDAO.getRestaurant(booking.getRestaurant_id());
	itinerary = itineraryDAO.getItineraryById(booking.getItinerary_id());
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Booking Confirmation</title>
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

.confirmation-container {
	background-color: rgba(255, 255, 255, 0.05);
	padding: 30px;
	border-radius: 10px;
	max-width: 800px;
	margin: auto;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

h1 {
	color: goldenrod;
	text-align: center;
}

.detail-block {
	margin-bottom: 20px;
}

.detail-block h2 {
	color: sienna;
	border-bottom: 1px solid goldenrod;
	padding-bottom: 5px;
	margin-bottom: 10px;
}

.detail-block p {
	margin: 5px 0;
}

.payment-block {
	margin-top: 30px;
	padding-top: 20px;
	border-top: 1px solid #888;
}

.payment-block h2 {
	color: lightgreen;
}

.payment-block label {
	display: block;
	margin: 10px 0;
}

.confirm-btn {
	background-color: goldenrod;
	color: black;
	padding: 10px 20px;
	font-weight: bold;
	font-size: 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	margin-top: 20px;
}

.confirm-btn:hover {
	background-color: orange;
}
</style>
</head>
<body>

	<%@ include file="navigation.jsp"%>

	<div class="confirmation-container">
		<h1>Booking Confirmation</h1>

		<%
		if (booking != null) {
		%>
		<div class="detail-block">
			<h2>Booking Details</h2>
			<p>
				<strong>Booking ID:</strong>
				<%=booking.getBookingId()%></p>
			<p>
				<strong>Tourist ID:</strong>
				<%=booking.getTourist_id()%></p>
			<p>
				<strong>Booking Date:</strong>
				<%=booking.getBooking_date()%></p>
			<p>
				<strong>Status:</strong>
				<%=booking.getStatus()%></p>
			<p>
				<strong>Total Price:</strong> ₹<%=booking.getPrice()%></p>
		</div>

		<div class="detail-block">
			<h2>Destination</h2>
			<p>
				<strong>Name:</strong>
				<%=destination != null ? destination.getDestination_name() : "N/A"%></p>
			<p>
				<strong>Description:</strong>
				<%=destination != null ? destination.getDestination_description() : "N/A"%></p>
		</div>

		<div class="detail-block">
			<h2>Resort</h2>
			<p>
				<strong>Name:</strong>
				<%=resort != null ? resort.getName() : "N/A"%></p>
			<p>
				<strong>Type:</strong>
				<%=resort != null ? resort.getType() : "N/A"%></p>
			<p>
				<strong>Rating:</strong>
				<%=resort != null ? resort.getRating() : "N/A"%></p>
		</div>

		<div class="detail-block">
			<h2>Restaurant</h2>
			<p>
				<strong>Name:</strong>
				<%=restaurant != null ? restaurant.getName() : "N/A"%></p>
			<p>
				<strong>Cuisine:</strong>
				<%=restaurant != null ? restaurant.getCuisine_type() : "N/A"%></p>
			<p>
				<strong>Rating:</strong>
				<%=restaurant != null ? restaurant.getRating() : "N/A"%></p>
		</div>

		<div class="detail-block">
			<h2>Itinerary</h2>
			<p>
				<strong>Price:</strong> ₹<%=itinerary != null ? itinerary.getItinerary_price() : "N/A"%></p>
			<%
			if (itinerary != null) {
			%>
			<%
			if (itinerary.getItinerary_day1() != null) {
			%>
			<p>
				<strong><%=itinerary.getItinerary_day1()%>:</strong>
				<%=itinerary.getItinerary_day1_description()%></p>
			<%
			}
			%>
			<%
			if (itinerary.getItinerary_day2() != null) {
			%>
			<p>
				<strong><%=itinerary.getItinerary_day2()%>:</strong>
				<%=itinerary.getItinerary_day2_description()%></p>
			<%
			}
			%>
			<%
			if (itinerary.getItinerary_day3() != null) {
			%>
			<p>
				<strong><%=itinerary.getItinerary_day3()%>:</strong>
				<%=itinerary.getItinerary_day3_description()%></p>
			<%
			}
			%>
			<%
			if (itinerary.getItinerary_day4() != null) {
			%>
			<p>
				<strong><%=itinerary.getItinerary_day4()%>:</strong>
				<%=itinerary.getItinerary_day4_description()%></p>
			<%
			}
			%>
			<%
			if (itinerary.getItinerary_day5() != null) {
			%>
			<p>
				<strong><%=itinerary.getItinerary_day5()%>:</strong>
				<%=itinerary.getItinerary_day5_description()%></p>
			<%
			}
			%>
			<%
			}
			%>
		</div>
		
		<form action="paymentServlet" method="post" class="payment-block">
    <h2>Select Payment Method</h2>

    <label><input type="radio" name="payment" value="credit" checked> Credit Card</label>
    <label><input type="radio" name="payment" value="debit"> Debit Card</label>
    <label><input type="radio" name="payment" value="upi"> UPI</label>
    <label><input type="radio" name="payment" value="cod"> Cash on Delivery</label>

    <input type="hidden" name="booking_id" value="<%=booking.getBookingId()%>">
    <input type="hidden" name="amount" value="<%=booking.getPrice()%>">

    <button class="confirm-btn" type="submit">Confirm Payment</button>
</form>
        <%
        } else {
        %>
        <p style="color: red; text-align: center;">Booking not found or invalid booking ID.</p>
        <%
        }
        %>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>
