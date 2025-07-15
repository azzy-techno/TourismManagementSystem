<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.tourist.dto.Destination, com.tourist.dao.DestinationImplementation "%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Destinations</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
	color: whitesmoke;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	background-color: #1a1a1a;
}

.content-section {
	padding: 60px 40px;
}

.section-title {
	text-align: center;
	font-size: 2.5rem;
	letter-spacing: 5px;
	color: goldenrod;
	margin-bottom: 40px;
	position: relative;
}

.section-title::after {
	content: '';
	position: absolute;
	bottom: -10px;
	left: 50%;
	transform: translateX(-50%);
	width: 100px;
	height: 3px;
	background: goldenrod;
}

/* Responsive Destination Cards */
.trips-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 30px;
	margin-top: 40px;
}

.trip-card {
	background: rgba(90, 52, 23, 0.7);
	border: 1px solid goldenrod;
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.3s ease;
}

.trip-card:hover {
	transform: translateY(-10px);
}

.trip-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.trip-info {
	padding: 20px;
}

.trip-info h3 {
	font-size: 1.5rem;
	margin-bottom: 10px;
	color: goldenrod;
}

.trip-info p {
	margin-bottom: 15px;
	color: burlywood;
}

.trip-meta {
	display: flex;
	justify-content: space-between;
	color: white;
	margin-bottom: 10px;
}

.book-now {
	display: inline-block;
	padding: 8px 20px;
	background: goldenrod;
	color: black;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
	transition: background 0.3s;
}

.book-now:hover {
	background: #e6c200;
}
</style>
</head>
<body>
	<%@ include file="navigation.jsp"%>

	<section class="content-section">
		<h2 class="section-title">Destinations</h2>
		<div class="trips-grid">
			<%
			DestinationImplementation dao = new DestinationImplementation();
			List<Destination> destinations = dao.getAllDestinations();
			%>
			<%
			if (destinations != null && !destinations.isEmpty()) {
				for (Destination d : destinations) {
			%>
			<div class="trip-card">
				<img src="<%=d.getDestination_image()%>"
					alt="<%=d.getDestination_name()%>">
				<div class="trip-info">
					<h3><%=d.getDestination_name()%></h3>
					<p><%=d.getDestination_description()%></p>
					<p><%=d.getDestination_paragraph()%></p>
					<div class="trip-meta">
						<span><%=d.getDestination_price()%>/- per day</span> <span>Rating:
							<%=d.getDestination_rating()%> stars
						</span>
					</div>
					<a href="PackageServlet?destinationId=<%=d.getDestination_id()%>"
						class="book-now">Book Now</a>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<p style="text-align: center;">No destinations available.</p>
			<%
			}
			%>

		</div>
	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>
