<%@ page import="java.util.List"%>
<%@ page import="com.tourist.dao.DestinationImplementation"%>
<%@ page import="com.tourist.dao.*, com.tourist.dto.*, java.util.*"%>
<%@ page import="com.tourist.dto.Destination"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
body {
	background-color: #121212;
	color: #f0f0f0;
	font-family: Arial, sans-serif;
}

.admin-section {
	max-width: 1000px;
	margin: auto;
	padding: 20px;
}

h2 {
	color: #00d1ff;
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
	background-color: #00d1ff;
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
</style>
</head>
<body>
	<div class="admin-section">
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



	<div class="admin-section">
		<h1>Admin Control Panel</h1>

		<!-- ======== ITINERARY CRUD ======== -->
		<h2>Itineraries</h2>
		<table>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Destination ID</th>
			</tr>
			<%
			ItineraryInterface itineraryDAO = new ItineraryImplementation();
			List<Itinerary> itineraries = itineraryDAO.getAllItineraries();
			for (Itinerary i : itineraries) {
			%>
			<tr>
				<td><%=i.getItinerary_id()%></td>
				<td><%=i.getItinerary_day()%></td>
				<td><%=i.getItinerary_description()%></td>
				<td><%=i.getDestination_id()%></td>
			</tr>
			<%
			}
			%>
		</table>
		<h2>Add Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="add"> <input
				type="text" name="itinerary_day" placeholder="Itinerary Day / Title"
				required>
			<textarea name="itinerary_description" placeholder="Description"
				required></textarea>
			<input type="number" name="destination_id"
				placeholder="Destination ID" required> <input type="submit"
				value="Add Itinerary">
		</form>
		<h2>Delete Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="delete"> <input
				type="number" name="itinerary_id"
				placeholder="Itinerary ID to delete" required> <input
				type="submit" value="Delete Itinerary">
		</form>
		<h2>Update Itinerary</h2>
		<form action="itineraryServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="number" name="itinerary_id"
				placeholder="Itinerary ID to update" required> <input
				type="text" name="itinerary_day"
				placeholder="New Itinerary Day / Title" required>
			<textarea name="itinerary_description" placeholder="New Description"
				required></textarea>
			<input type="number" name="destination_id"
				placeholder="New Destination ID" required> <input
				type="submit" value="Update Itinerary">
		</form>



		<!-- ======== RESORT CRUD ======== -->
		<h2>Resorts</h2>

		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Type</th>
				<th>Rating</th>
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
				required> <input type="number" name="destination_id"
				placeholder="New Destination ID" required> <input
				type="submit" value="Update Resort">
		</form>



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
				type="number" name="destination_id" placeholder="Destination ID"
				required> <input type="submit" value="Add Restaurant">
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
				name="destination_id" placeholder="New Destination ID" required>
			<input type="submit" value="Update Restaurant">
		</form>


	</div>



	<footer style="text-align: center; margin-top: 50px; color: #888;">
		<p>&copy; 2023 Your Company. All rights reserved.</p>
	</footer>
</body>
</html>
