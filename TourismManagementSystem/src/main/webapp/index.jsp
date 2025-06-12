<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tourism</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<header>
		<nav>
			<div id="logo">
				<img src="Images/Saad-removebg-preview.png" alt="Logo">
			</div>
			<div id="nav-elements">
				<ol>
				 	<li class="nav-list"><a href="index.jsp">Home</a></li>
					<li class="nav-list"><a href="#">Packages</a></li>
					<li class="nav-list"><a href="#">Destinations</a></li>
					<li class="nav-list"><a href="#">Itinerary</a></li>
				</ol>

			</div>
			<div id="login">
				<i class="fa-solid fa-user"></i>
				<div class="user-dropdown">
					<div class="dropdown-header">Member Access</div>
					<div class="dropdown-options">
						<a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a> <a
							href="signup.jsp"><i class="fas fa-user-plus"></i> Sign Up</a> <a
							href="adminLogin.jsp"><i class="fas fa-sign-in-alt"></i>Admin
							Login</a> <a href="#"><i class="fas fa-question-circle"></i> Help</a>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div class="videos">
		<video src="Videos/videoplayback5.mp4" autoplay muted loop></video>
		<div class="video-overlay">
			<h1>SAAD TRAVELS</h1>
			<p>Where Adventure meets Adrenaline</p>
		</div>
	</div>

	<!-- Book Now Section -->
	<div class="book-now-section">
		<div class="book-form">
			<h2>LOGIN TO EXPLORE</h2>
			<form action="loginSubmit" method="post">
				<input type="email" placeholder="Email Address" required> <input
					type="password" placeholder="Password" required>

				<button type="submit">LOGIN</button>
				<div class="register-link">
					<pre style="color: sienna;">
                    Don't have an account?   <a href="signup.jsp">Register here</a>
					</pre>
				</div>
			</form>
		</div>
		<div class="book-image">
			<img src="Images/autorickshaw_photo.jpg" alt="Travel Destination">
		</div>
	</div>

	<!-- Gallery section -->
	<section class="destinations-section">
		<h2 class="section-title">POPULAR DESTINATIONS</h2>
		<div class="destinations-grid">
			<!-- Row 1 -->
			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Munnar_photo.jpg" alt="Mountain Resort">
				</div>
				<div class="destination-info">
					<h3>Alpine Peaks Resort</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 123 Mountain View Rd, Swiss
						Alps
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Ladakh_photo.jpg" alt="Beach Resort">
				</div>
				<div class="destination-info">
					<h3>Golden Sands Paradise</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 456 Coastal Highway,
						Maldives
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Meghalaya_photo.webp" alt="Desert Camp">
				</div>
				<div class="destination-info">
					<h3>Sahara Nights Camp</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 789 Dune Street, Dubai
					</p>
				</div>
			</div>

			<!-- Row 2 -->
			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Kanyakumari_photo.jpg" alt="Forest Retreat">
				</div>
				<div class="destination-info">
					<h3>Emerald Forest Lodge</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 101 Jungle Trail, Amazon
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Gandikota_photo.jpg" alt="City Hotel">
				</div>
				<div class="destination-info">
					<h3>Metropolitan Towers</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 202 Skyline Ave, New York
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Meghalaya1.jpg" alt="Private Island">
				</div>
				<div class="destination-info">
					<h3>Coral Island Retreat</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 303 Lagoon Lane, Fiji
					</p>
				</div>
			</div>

			<!-- Row 3 -->
			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Kerala_backwaters_photo.jpg" alt="Mountain Cabin">
				</div>
				<div class="destination-info">
					<h3>Snowpeak Cabin</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 404 Frostbite Pass, Canada
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Gujarat_photo.jpeg" alt="Vineyard">
				</div>
				<div class="destination-info">
					<h3>Chateau Vineyard</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 505 Grape Valley, France
					</p>
				</div>
			</div>

			<div class="destination-card">
				<div class="destination-image">
					<img src="Images/Alleppy_photo.webp" alt="Safari Camp">
				</div>
				<div class="destination-info">
					<h3>Savanna Safari Lodge</h3>
					<p>
						<i class="fas fa-map-marker-alt"></i> 606 Wild Trail, Kenya
					</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Services Section -->
	<section class="services-section">
		<h2 class="services-title">OUR SERVICES</h2>
		<div class="services-grid">
			<div class="service-card">
				<i class="fas fa-plane-departure"></i>
				<h3>Flight Bookings</h3>
				<p>Seamless flight booking services for all destinations.</p>
			</div>
			<div class="service-card">
				<i class="fas fa-hotel"></i>
				<h3>Hotel Reservations</h3>
				<p>Comfortable and affordable stays tailored to your needs.</p>
			</div>
			<div class="service-card">
				<i class="fas fa-route"></i>
				<h3>Custom Itineraries</h3>
				<p>Unique travel plans crafted just for you.</p>
			</div>
			<div class="service-card">
				<i class="fas fa-bus-alt"></i>
				<h3>Local Transport</h3>
				<p>City tours and safe local travel options at your fingertips.</p>
			</div>
			<div class="service-card">
				<i class="fas fa-passport"></i>
				<h3>Visa Assistance</h3>
				<p>Expert help with visa processing and travel documentation.</p>
			</div>
			<div class="service-card">
				<i class="fas fa-globe-asia"></i>
				<h3>International Packages</h3>
				<p>Explore handpicked international travel experiences tailored
					to your preferences.</p>
			</div>
		</div>
	</section>

	<!-- Reviews Section -->
	<section class="reviews-section">
		<h2>What Our Customers Say</h2>
		<div class="reviews-grid">
			<div class="review-card">
				<img src="Images/Virat_photo.jpeg" alt="Sarah A.">
				<p>"Amazing experience! Everything was perfectly organized. Will
					definitely book again!"</p>
				<h4>Sarah A.</h4>
			</div>
			<div class="review-card">
				<img src="Images/Ronaldo_photo.webp" alt="Ahmed K.">
				<p>"Professional service and friendly staff. Made our trip
					memorable and stress-free!"</p>
				<h4>Ahmed K.</h4>
			</div>
			<div class="review-card">
				<img src="Images/Lewis_photo.jpeg" alt="Priya S.">
				<p>"From ticket booking to hotel stay, everything was smooth.
					Highly recommend them!"</p>
				<h4>Priya S.</h4>
			</div>
		</div>
	</section>

	<!-- ======= FOOTER ======= -->
	<footer class="site-footer">
		<div class="footer-content">
			<!-- Footer Columns -->
			<div class="footer-column">
				<h3>SAAD TRAVELS</h3>
				<p>Where Adventure Meets Adrenaline</p>
				<div class="social-links">
					<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
						class="fab fa-twitter"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-youtube"></i></a>
				</div>
			</div>

			<div class="footer-column">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Destinations</a></li>
					<li><a href="#">Special Offers</a></li>
					<li><a href="#">Gallery</a></li>
				</ul>
			</div>

			<div class="footer-column">
				<h3>Support</h3>
				<ul>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">FAQs</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms & Conditions</a></li>
				</ul>
			</div>

			<div class="footer-column">
				<h3>Newsletter</h3>
				<p>Subscribe for travel tips and offers</p>
				<form class="newsletter-form">
					<input type="email" placeholder="Your Email">
					<button type="submit">
						<i class="fas fa-paper-plane"></i>
					</button>
				</form>
			</div>
		</div>

		<div class="footer-bottom">
			<p>&copy; 2025 Saad Travels. All Rights Reserved.</p>
		</div>
	</footer>
</body>
</html>