<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tourist.dao.DestinationImplementation"%>
<%@ page import="com.tourist.dao.*, com.tourist.dto.*, java.util.*"%>
<%@ page import="com.tourist.dto.Destination"%>
<%@ include file="adminSessionCheck.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
}

body {
	background-color: #121212;
	color: #f0f0f0;
}

.admin-section {
	max-width: 1000px;
	margin: auto;
	padding: 20px;
}

h1 {
	color: goldenrod;
	margin-top: 5px;
}

h2 {
	color: sienna;
	margin-top: 40px;
}

form {
	background: #1f1f1f;
	padding: 20px;
	border-radius: 10px;
}

input, textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border-radius: 5px;
	border: none;
	background: #2a2a2a;
	color: white;
}

input[type=submit] {
	background-color: sienna;
	cursor: pointer;
	font-weight: bold;
}

table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
	background: #1a1a1a;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #333;
}

th {
	background-color: #222;
}

.actions form {
	display: inline;
}

.admin-nav {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin: 40px auto;
	flex-wrap: wrap;
}

.admin-card {
	background: #1f1f1f;
	padding: 20px 30px;
	border-radius: 10px;
	cursor: pointer;
	text-align: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	transition: transform 0.2s, background 0.3s;
}

.admin-card:hover {
	background: goldenrod;
	color: black;
	transform: scale(1.05);
}

.admin-card i {
	font-size: 28px;
	margin-bottom: 10px;
}

.admin-card p {
	font-weight: bold;
	font-size: 16px;
	margin: 0;
}

hr {
	width: 80%;
	border: 2px;
	height: 1px;
	background: sienna;
	margin: 40px auto;
}
</style>
</head>
<body>

<%
    String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType"); // Optional: success/error/warning/info
    if (message != null) {
        String bgColor = "#d4edda"; // green for success
        String textColor = "#155724";
        String borderColor = "#c3e6cb";

        if ("error".equals(messageType)) {
            bgColor = "#f8d7da";
            textColor = "#721c24";
            borderColor = "#f5c6cb";
        } else if ("warning".equals(messageType)) {
            bgColor = "#fff3cd";
            textColor = "#856404";
            borderColor = "#ffeeba";
        } else if ("info".equals(messageType)) {
            bgColor = "#d1ecf1";
            textColor = "#0c5460";
            borderColor = "#bee5eb";
        }
%>
    <div style="margin: 10px 0; padding: 12px; background-color: <%= bgColor %>; color: <%= textColor %>; border: 1px solid <%= borderColor %>; border-radius: 5px;">
        <%= message %>
    </div>
<%
        session.removeAttribute("message");
        session.removeAttribute("messageType");
    }
%>



	<%@ include file="navigation.jsp"%>
	<div class="admin-nav">
		<div class="admin-card" onclick="scrollToSection('tourists')">
			<i class="fas fa-user"></i>
			<p>Tourist</p>
		</div>
	
		<div class="admin-card" onclick="scrollToSection('destinations')">
			<i class="fas fa-map-marker-alt"></i>
			<p>Destinations</p>
		</div>
		<div class="admin-card" onclick="scrollToSection('itineraries')">
			<i class="fas fa-route"></i>
			<p>Itineraries</p>
		</div>
		<div class="admin-card" onclick="scrollToSection('resorts')">
			<i class="fas fa-hotel"></i>
			<p>Resorts</p>
		</div>
		<div class="admin-card" onclick="scrollToSection('restaurants')">
			<i class="fas fa-utensils"></i>
			<p>Restaurants</p>
		</div>
		<div class="admin-card" onclick="scrollToSection('bookings')">
			<i class="fas fa-receipt"></i>
			<p>Bookings</p>
		</div>

	</div>

	<div class="admin-section" id="tourists">
		<h1>Welcome to Admin Dashboard</h1>
		<h2>Manage Tourist</h2>

		<div class="container">
			<h1>Tourist Table</h1>
			<table>
				<tr>
					<th>Tourist Id</th>
					<th>Tourist Name</th>
					<th>Tourist Email</th>
					<th>Tourist Phone</th>
					<th>Tourist Password</th>
					<th>Tourist Confirm Password</th>
				</tr>
				<%
				TouristInterface ti = new TouristImplementation();
				List<Tourist> tourists = ti.getAllTourists();
				for (Tourist tourist : tourists) {
				%>

				<tr>
					<td><%=tourist.getId()%></td>
					<td><%=tourist.getName()%></td>
					<td><%=tourist.getEmail()%></td>
					<td><%=tourist.getPhone()%></td>
					<td><%=tourist.getPassword()%></td>
					<td><%=tourist.getConfirmPassword()%></td>
					
				</tr>
				<%
				}
				%>
			</table>
		</div>
		
		
		
		<div class="container">
			<h2>Add New Tourist</h2>
			<form action="touristServlet" method="post">
				<input type="hidden" name="action" value="add"> <input
					type="text" name="name" placeholder="Tourist Name" required>
				<input type="email" name="email" placeholder="Tourist Email"
					required> <input type="text" name="phone"
					placeholder="Tourist Phone" required> <input
					type="password" name="password"
					placeholder="Tourist Password" required> <input
					type="password" name="confirmPassword"
					placeholder="Confirm Password" required> <input
					type="submit" value="Add Tourist">
			</form>
		</div>
			<div class="container">
            <h2>Update Tourist</h2>
            <form action="touristServlet" method="post">
                <input type="hidden" name="action" value="update"> <input
                    type="number" name="id" placeholder="Tourist ID" required>
                <input type="text" name="name" placeholder="Tourist Name"
                    required> <input type="email" name="email"
                    placeholder="Tourist Email" required> <input type="text"
                    name="phone" placeholder="Tourist Phone" required> <input
                    type="password" name="password"
                    placeholder="Tourist Password" required> <input
                    type="password" name="confirmPassword"
                    placeholder="Confirm Password" required> <input
                    type="submit" value="Update Tourist">
            </form>
	</div>
	    <div class="container">
            <h2>Delete Tourist</h2>
            <form action="touristServlet" method="post">
                <input type="hidden" name="action" value="delete"> <input
                    type="number" name="id" placeholder="Tourist ID" required> <input
                    type="submit" value="Delete Tourist">
            </form>
        </div>
            </div>
            		

	<hr>



	<div class="admin-section" id="destinations">
		<h1>Welcome to Admin Dashboard</h1>
		<h2>Manage Destinations</h2>

		<div class="container">
			<h1>Destinations Table</h1>
			<table>
				<tr>
					<th>Destination Id</th>
					<th>Destination Description</th>
					<th>Destination Paragraph</th>
					<th>Destination Price</th>
					<th>Destination Image</th>
					<th>Destination rating</th>
				</tr>
				<%
				DestinationInterface di = new DestinationImplementation();
				List<Destination> destinations = di.getAllDestinations();
				for (Destination destination : destinations) {
				%>

				<tr>
					<td><%=destination.getDestination_id()%></td>
					<td><%=destination.getDestination_description()%></td>
					<td><%=destination.getDestination_paragraph()%></td>
					<td><%=destination.getDestination_price()%></td>
					<td><img src="<%=destination.getDestination_image()%>"
						width="100"></td>
					<td><%=destination.getDestination_rating()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<div class="container">
			<h2>Add New Destination</h2>
			<form action="destinationServlet" method="post">
				<input type="hidden" name="action" value="add"> <input
					type="text" name="destination_name" placeholder="Destination Name"
					required> <input type="text" name="destination_description"
					placeholder="Short Description" required>
				<textarea name="destination_paragraph"
					placeholder="Paragraph about the destination" rows="4" required></textarea>
				<input type="number" step="0.01" name="destination_price"
					placeholder="Price per day" required> <input type="text"
					name="destination_image"
					placeholder="Image Path (e.g., Images/Munnar_photo.jpg)" required>
				<input type="text" name="destination_rating"
					placeholder="Rating (e.g., 4.5 stars)" required> <input
					type="submit" value="Add Destination">
			</form>
		</div>
		<div class="container">
			<h2>Update Destination</h2>
			<form action="destinationServlet" method="post">
				<input type="hidden" name="action" value="update"> <input
					type="number" name="destination_id" placeholder="Destination ID"
					required> <input type="text" name="destination_name"
					placeholder="Destination Name" required> <input type="text"
					name="destination_description" placeholder="Short Description"
					required>
				<textarea name="destination_paragraph"
					placeholder="Paragraph about the destination" rows="4" required></textarea>
				<input type="number" step="0.01" name="destination_price"
					placeholder="Price per day" required> <input type="text"
					name="destination_image"
					placeholder="Image Path (e.g., Images/Munnar_photo.jpg)" required>
				<input type="text" name="destination_rating"
					placeholder="Rating (e.g., 4.5 stars)" required> <input
					type="submit" value="Update Destination">
			</form>
		</div>
		<div class="container">
			<h2>Delete Destination</h2>
			<form action="destinationServlet" method="post">
				<input type="hidden" name="action" value="delete"> <input
					type="number" name="destination_id" placeholder="Destination ID"
					required> <input type="submit" value="Delete Destination">
			</form>
		</div>
	</div>


	<hr>
	<div class="admin-section" id="itineraries">
		<h1>Itineraries Control Panel</h1>

		<!-- ======== ITINERARY CRUD ======== -->
		<h2>All Itineraries</h2>
		<table border="1" cellpadding="10">
			<tr>
				<th>ID</th>
				<th>Day 1</th>
				<th>Description 1</th>
				<th>Day 2</th>
				<th>Description 2</th>
				<th>Day 3</th>
				<th>Description 3</th>
				<th>Day 4</th>
				<th>Description 4</th>
				<th>Day 5</th>
				<th>Description 5</th>
				<th>Price</th>
				<th>Destination ID</th>
			</tr>
			<%
			ItineraryInterface itineraryDAO = new ItineraryImplementation();
			List<Itinerary> itineraries = itineraryDAO.getAllItineraries();
			for (Itinerary i : itineraries) {
			%>
			<tr>
				<td><%=i.getItinerary_id()%></td>
				<td><%=i.getItinerary_day1()%></td>
				<td><%=i.getItinerary_day1_description()%></td>
				<td><%=i.getItinerary_day2()%></td>
				<td><%=i.getItinerary_day2_description()%></td>
				<td><%=i.getItinerary_day3()%></td>
				<td><%=i.getItinerary_day3_description()%></td>
				<td><%=i.getItinerary_day4()%></td>
				<td><%=i.getItinerary_day4_description()%></td>
				<td><%=i.getItinerary_day5()%></td>
				<td><%=i.getItinerary_day5_description()%></td>
				<td><%=i.getItinerary_price()%></td>
				<td><%=i.getDestination_id()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<!-- ======== ADD ITINERARY ======== -->
		<h2>Add Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="add">

			<!-- Day-wise Input -->
			<input type="text" name="itinerary_day1" placeholder="Day 1 Title"
				required>
			<textarea name="itinerary_day1_description"
				placeholder="Day 1 Description" required></textarea>

			<input type="text" name="itinerary_day2" placeholder="Day 2 Title">
			<textarea name="itinerary_day2_description"
				placeholder="Day 2 Description"></textarea>

			<input type="text" name="itinerary_day3" placeholder="Day 3 Title">
			<textarea name="itinerary_day3_description"
				placeholder="Day 3 Description"></textarea>

			<input type="text" name="itinerary_day4" placeholder="Day 4 Title">
			<textarea name="itinerary_day4_description"
				placeholder="Day 4 Description"></textarea>

			<input type="text" name="itinerary_day5" placeholder="Day 5 Title">
			<textarea name="itinerary_day5_description"
				placeholder="Day 5 Description"></textarea>

			<input type="number" name="itinerary_price"
				placeholder="Itinerary Price" required> <input type="number"
				name="destination_id" placeholder="Destination ID" required>

			<input type="submit" value="Add Itinerary">
		</form>

		<!-- ======== DELETE ITINERARY ======== -->
		<h2>Delete Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="number" name="itinerary_id"
				placeholder="Itinerary ID to delete" required> <input
				type="submit" value="Delete Itinerary">
		</form>

		<!-- ======== UPDATE ITINERARY ======== -->
		<h2>Update Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="number" name="itinerary_id"
				placeholder="Itinerary ID to update" required>

			<!-- Day-wise Input -->
			<input type="text" name="itinerary_day1" placeholder="Day 1 Title"
				required>
			<textarea name="itinerary_day1_description"
				placeholder="Day 1 Description" required></textarea>

			<input type="text" name="itinerary_day2" placeholder="Day 2 Title">
			<textarea name="itinerary_day2_description"
				placeholder="Day 2 Description"></textarea>

			<input type="text" name="itinerary_day3" placeholder="Day 3 Title">
			<textarea name="itinerary_day3_description"
				placeholder="Day 3 Description"></textarea>

			<input type="text" name="itinerary_day4" placeholder="Day 4 Title">
			<textarea name="itinerary_day4_description"
				placeholder="Day 4 Description"></textarea>

			<input type="text" name="itinerary_day5" placeholder="Day 5 Title">
			<textarea name="itinerary_day5_description"
				placeholder="Day 5 Description"></textarea>

			<input type="number" name="itinerary_price"
				placeholder="New Itinerary Price" required> <input
				type="number" name="destination_id" placeholder="New Destination ID"
				required> <input type="submit" value="Update Itinerary">
		</form>
	</div>

	<hr>
	<div class="admin-section" id="resorts">
		<h1>Resorts Control Panel</h1>
		<!-- ======== RESORT CRUD ======== -->
		<h2>Resorts</h2>

		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Type</th>
				<th>Rating</th>
				<th>Price</th>
				<th>Destination ID</th>
			</tr>

			<%
			ResortInterface resortDAO = new ResortImplementation();
			List<Resort> resorts = resortDAO.getAllResorts();
			for (Resort r : resorts) {
			%>
			<tr>
				<td><%=r.getResort_id()%></td>
				<td><%=r.getName()%></td>
				<td><%=r.getDescription()%></td>
				<td><%=r.getType()%></td>
				<td><%=r.getRating()%></td>
				<td><%=r.getResort_price()%></td>
				<td><%=r.getDestination_id()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<h2>Add Resort</h2>
		<form action="resortServlet" method="post">
			<input type="hidden" name="action" value="add"> <input
				type="text" name="name" placeholder="Name" required> <input
				type="text" name="description" placeholder="Description" required>
			<input type="text" name="type" placeholder="Type" required> <input
				type="number" name="rating" step="0.1" placeholder="Rating" required>
			<input type=number name="resort_price" placeholder="Price" required>
			<input type="number" name="destination_id"
				placeholder="Destination ID" required> <input type="submit"
				value="Add Resort">
		</form>
		<h2>Delete Resort</h2>
		<form action="resortServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="number" name="resort_id" placeholder="Resort ID to delete"
				required> <input type="submit" value="Delete Resort">
		</form>
		<h2>Update Resort</h2>
		<form action="resortServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="number" name="resort_id" placeholder="Resort ID to update"
				required> <input type="text" name="name"
				placeholder="New Name" required> <input type="text"
				name="description" placeholder="New Description" required> <input
				type="text" name="type" placeholder="New Type" required> <input
				type="number" name="rating" step="0.1" placeholder="New Rating"
				required> <input type="number" name="resort_price"
				placeholder="New Price" required> <input type="number"
				name="destination_id" placeholder="New Destination ID" required>
			<input type="submit" value="Update Resort">
		</form>
	</div>
	<hr>
	<div class="admin-section" id="restaurants">
		<h1>Restaurants Control Panel</h1>
		<!-- ======== RESTAURANT CRUD ======== -->
		<h2>Restaurants</h2>

		<table border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Destination ID</th>
				<th>Cuisine Type</th>
				<th>Rating</th>
				<th>Price</th>
				<!-- ✅ Added -->
			</tr>
			<%
			RestaurantInterface restaurantDAO = new RestaurantImplementation();
			List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();
			for (Restaurant r : restaurants) {
			%>
			<tr>
				<td><%=r.getRestaurant_id()%></td>
				<td><%=r.getName()%></td>
				<td><%=r.getDescription()%></td>
				<td><%=r.getDestination_id()%></td>
				<td><%=r.getCuisine_type()%></td>
				<td><%=r.getRating()%></td>
				<td><%=r.getRestaurant_price()%></td>
				<!-- ✅ Added -->
			</tr>
			<%
			}
			%>
		</table>

		<h2>Add Restaurant</h2>
		<form action="restaurantServlet" method="post">
			<input type="hidden" name="action" value="add"> <input
				type="text" name="name" placeholder="Name" required> <input
				type="text" name="description" placeholder="Description / Address"
				required> <input type="text" name="cuisine_type"
				placeholder="Cuisine Type" required> <input type="number"
				step="0.1" name="rating" placeholder="Rating" required> <input
				type="number" step="0.01" name="restaurant_price"
				placeholder="Restaurant Price" required>
			<!-- ✅ Added -->
			<input type="number" name="destination_id"
				placeholder="Destination ID" required> <input type="submit"
				value="Add Restaurant">
		</form>

		<h2>Delete Restaurant</h2>
		<form action="restaurantServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="number" name="restaurant_id"
				placeholder="Restaurant ID to delete" required> <input
				type="submit" value="Delete Restaurant">
		</form>

		<h2>Update Restaurant</h2>
		<form action="restaurantServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="number" name="restaurant_id"
				placeholder="Restaurant ID to update" required> <input
				type="text" name="name" placeholder="New Name" required> <input
				type="text" name="description"
				placeholder="New Description / Address" required> <input
				type="text" name="cuisine_type" placeholder="New Cuisine Type"
				required> <input type="number" step="0.1" name="rating"
				placeholder="New Rating" required> <input type="number"
				step="0.01" name="restaurant_price"
				placeholder="New Restaurant Price" required>
			<!-- ✅ Added -->
			<input type="number" name="destination_id"
				placeholder="New Destination ID" required> <input
				type="submit" value="Update Restaurant">
		</form>
	</div>

	<hr>

	<div class="admin-section" id="bookings">
		<h1>Bookings Control Panel</h1>
		<!-- ======== BOOKING CRUD ======== -->
		<h2>Bookings</h2>

		<table border="1">
			<tr>
				<th>ID</th>
				<th>User ID</th>
				<th>Destination ID</th>
				<th>Resort ID</th>
				<th>Restaurant ID</th>
				<th>Itinerary ID</th>
				<th>Booking Date</th>
				<th>Status</th>
				<th>Total Price</th>
			</tr>
			<%
			BookingInterface bookingDAO = new BookingImplementation();
			List<Booking> bookings = bookingDAO.getAllBookings();
			for (Booking b : bookings) {
			%>
			<tr>
				<td><%=b.getBookingId()%></td>
				<td><%=b.getTourist_id()%></td>
				<td><%=b.getDestination_id()%></td>
				<td><%=b.getResort_id()%></td>
				<td><%=b.getRestaurant_id()%></td>
				<td><%=b.getItinerary_id()%></td>
				<td><%=b.getBooking_date()%></td>
				<td><%=b.getStatus()%></td>
				<td><%=b.getPrice()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<h2>Add Booking</h2>
		<form action="bookingServlet" method="post">
			<input type="hidden" name="action" value="add"> <input
				type="number" name="user_id" placeholder="User ID" required>
			<input type="number" name="destination_id"
				placeholder="Destination ID" required> <input type="number"
				name="resort_id" placeholder="Resort ID" required> <input
				type="number" name="restaurant_id" placeholder="Restaurant ID"
				required> <input type="number" name="itinerary_id"
				placeholder="Itinerary ID" required> <input type="date"
				name="booking_date" required> <input type="text"
				name="status" placeholder="Status" required> <input
				type="submit" value="Add Booking">
		</form>

		<h2>Update Booking</h2>
		<form action="bookingServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="number" name="booking_id" placeholder="Booking ID to update"
				required> <input type="number" name="user_id"
				placeholder="New User ID" required> <input type="number"
				name="destination_id" placeholder="New Destination ID" required>
			<input type="number" name="resort_id" placeholder="New Resort ID"
				required> <input type="number" name="restaurant_id"
				placeholder="New Restaurant ID" required> <input
				type="number" name="itinerary_id" placeholder="New Itinerary ID"
				required> <input type="date" name="booking_date" required>
			<input type="text" name="status" placeholder="New Status" required>
			<input type="submit" value="Update Booking">
		</form>

		<h2>Delete Booking</h2>
		<form action="bookingServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="number" name="booking_id" placeholder="Booking ID to delete"
				required> <input type="submit" value="Delete Booking">
		</form>
	</div>







	<script>
		function scrollToSection(id) {
			document.getElementById(id).scrollIntoView({
				behavior : "smooth"
			});
		}
	</script>



	<%@ include file="footer.jsp"%>

</body>
</html>