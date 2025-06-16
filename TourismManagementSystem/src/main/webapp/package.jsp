<%@ page import="java.util.*, com.tourist.dto.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Travel Package Details</title>
    <link rel="stylesheet" href="style.css"> <!-- your CSS file -->
</head>
<style>
/* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
    color: whitesmoke;
}

body {
    background-color: #1a1a1a;
    line-height: 1.6;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Header */
header {
    background-color: sienna;
    padding: 20px;
    text-align: center;
    position: sticky;
    top: 0;
    z-index: 100;
}

header h1 {
    font-size: 2.5rem;
    letter-spacing: 5px;
    color: goldenrod;
}

/* Main Content Section */
.content-section {
    padding: 40px;
}

/* Section Block Styling */
.section-block {
    margin-bottom: 40px;
    background: rgba(90, 52, 23, 0.3);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 3px 6px rgba(0,0,0,0.3);
}

/* Section Headings */
.section-block h2 {
    font-size: 2rem;
    letter-spacing: 3px;
    color: goldenrod;
    margin-bottom: 20px;
    position: relative;
    padding-bottom: 10px;
}

.section-block h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 2px;
    background: goldenrod;
}

/* Destination Card */
.destination-card {
    background: rgba(90, 52, 23, 0.5);
    padding: 20px;
    border: 1px solid goldenrod;
    border-radius: 10px;
    margin-bottom: 20px;
}

.destination-card h3 {
    font-size: 1.8rem;
    color: goldenrod;
    margin-bottom: 10px;
}

.destination-card p {
    margin-bottom: 8px;
}

/* Itinerary List */
.content-section ul {
    list-style: none;
    padding: 0;
}

.content-section ul li {
    background: rgba(90, 52, 23, 0.5);
    margin-bottom: 10px;
    padding: 12px 15px;
    border-left: 4px solid goldenrod;
    border-radius: 5px;
}

/* Restaurants & Resorts Lists */
.section-block ul li {
    background: rgba(90, 52, 23, 0.5);
    margin-bottom: 10px;
    padding: 12px 15px;
    border-radius: 5px;
    border: 1px solid goldenrod;
}

.section-block ul li strong {
    color: goldenrod;
}

/* Book Package Button */
.book-now-button {
    display: inline-block;
    padding: 12px 25px;
    background-color: goldenrod;
    color: black;
    font-weight: bold;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    cursor: pointer;
}

.book-now-button:hover {
    background-color: #e6c200;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    header h1 {
        font-size: 2rem;
    }
    .section-block h2 {
        font-size: 1.6rem;
    }
}

	
</style>
<body>

    <header>
        <h1>Travel Package Details</h1>
    </header>

    <main class="content-section">

        <!-- Destination Details -->
        <section class="section-block">
            <h2>Destination</h2>
            <%
            Destination destination = (Destination) request.getAttribute("destination");
            if (destination != null) {
            %>
                <div class="destination-card">
                    <h3><%= destination.getDestination_name() %></h3>
                    <p><strong>State:</strong> <%= destination.getDestination_paragraph() %></p>
                    <p><strong>Description:</strong> <%= destination.getDestination_description() %></p>
                    <p><strong>Price:</strong> ₹<%= destination.getDestination_price() %> per day</p>
                </div>
            <% } else { %>
                <p>No destination found.</p>
            <% } %>
        </section>

        <!-- Itinerary Section -->
        <section class="section-block">
            <h2>Itinerary</h2>
            <%
                List<Itinerary> itineraries = (List<Itinerary>) request.getAttribute("itineraries");
                if (itineraries != null && !itineraries.isEmpty()) {
            %>
                <ul>
                    <% for (Itinerary it : itineraries) { %>
                        <li><strong>Day <%= it.getItinerary_day() %>:</strong> <%= it.getItinerary_description()
                        %></li>
                    <% } %>
                </ul>
            <% } else { %>
                <p>No itinerary available for this destination.</p>
            <% } %>
        </section>

        <!-- Restaurant Section -->
        <section class="section-block">
            <h2>Restaurants</h2>
            <%
                List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
                if (restaurants != null && !restaurants.isEmpty()) {
            %>
                <ul>
                    <% for (Restaurant r : restaurants) { %>
                        <li>
                            <strong><%= r.getName() %></strong> - <%= r.getCuisine_type() %> | Rating: <%= r.getRating() %>
                            <br>Description: <%= r.getDescription() %>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <p>No restaurants listed for this destination.</p>
            <% } %>
        </section>

        <!-- Resort Section -->
        <section class="section-block">
            <h2>Resorts</h2>
            <%
                List<Resort> resorts = (List<Resort>) request.getAttribute("resorts");
                if (resorts != null && !resorts.isEmpty()) {
            %>
                <ul>
                    <% for (Resort resort : resorts) { %>
                        <li>
                            <strong><%= resort.getName() %></strong> - Description: <%= resort.getDescription() %><br>
                            : <%= resort.getType() %> Rating | Rating: <%= resort.getRating() %>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <p>No resorts listed for this destination.</p>
            <% } %>
        </section>

        <!-- Book Button -->
        <section class="section-block">
            <form action="BookPackageServlet" method="post">
                <input type="hidden" name="destinationId" value="<%= destination.getDestination_id() %>">
                <button type="submit" class="book-now-button">Book This Package</button>
            </form>
        </section>

    </main>

</body>
</html>
