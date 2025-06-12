<%@ page import="java.util.List" %>
<%@ page import="com.tourist.dao.DestinationImplementation" %>
<%@ page import="com.tourist.dao.*, com.tourist.dto.*, java.util.*"%>
<%@ page import="com.tourist.dto.Destination" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
		<h1>Welcome to Admin Destinations</h1>
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

	<footer style="text-align: center; margin-top: 50px; color: #888;">
		<p>&copy; 2023 Your Company. All rights reserved.</p>
	</footer>
</body>
</html>
