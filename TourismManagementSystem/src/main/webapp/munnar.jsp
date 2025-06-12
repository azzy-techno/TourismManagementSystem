<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Munnar Package | Saad Travels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
        
        /* Navigation - Same as Dashboard */
        nav {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            background-color: sienna;
            height: 100px;
            width: 100%;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        ol {
            display: flex;
            align-items: center;
            gap: 30px;
        }
        
        .nav-list {
            list-style: none;
            cursor: pointer;
            letter-spacing: 1px;
            font-size: 1.2rem;
        }
        
        #logo img {
            height: 80px;
            width: 90px;
            object-fit: contain;
        }
        
        #user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }
        
        #user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid goldenrod;
        }
        
        /* Hero Video Section */
        .hero-video {
            width: 100%;
            height: 70vh;
            position: relative;
            overflow: hidden;
        }
        
        .hero-video video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .video-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.4);
        }
        
        .video-overlay h1 {
            font-size: 4rem;
            letter-spacing: 10px;
            color: goldenrod;
            text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.8);
            margin-bottom: 20px;
        }
        
        .video-overlay p {
            font-size: 1.5rem;
            max-width: 800px;
            text-align: center;
            color: burlywood;
        }
        
        /* Package Content Sections */
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
        
        /* Package Highlights */
        .package-highlights {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .highlight-card {
            background: rgba(90, 52, 23, 0.7);
            border: 1px solid goldenrod;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
        }
        
        .highlight-card i {
            font-size: 2.5rem;
            color: goldenrod;
            margin-bottom: 15px;
        }
        
        .highlight-card h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: goldenrod;
        }
        
        /* Itinerary */
        .itinerary {
            background: rgba(90, 52, 23, 0.3);
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 40px;
        }
        
        .day-card {
            background: rgba(0, 0, 0, 0.2);
            border-left: 4px solid goldenrod;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 0 5px 5px 0;
        }
        
        .day-card h3 {
            font-size: 1.5rem;
            color: goldenrod;
            margin-bottom: 10px;
        }
        
        .day-card ul {
            list-style-position: inside;
            margin-left: 10px;
        }
        
        .day-card li {
            margin-bottom: 8px;
            color: burlywood;
        }
        
        /* Resorts & Restaurants */
        .recommendations {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .recommendation-card {
            background: rgba(90, 52, 23, 0.7);
            border: 1px solid goldenrod;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .recommendation-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .recommendation-info {
            padding: 20px;
        }
        
        .recommendation-info h3 {
            font-size: 1.5rem;
            color: goldenrod;
            margin-bottom: 10px;
        }
        
        .recommendation-info p {
            color: burlywood;
            margin-bottom: 15px;
        }
        
        .rating {
            color: goldenrod;
            margin-bottom: 10px;
        }
        
        /* Booking Form */
        .booking-form-container {
            background: rgba(90, 52, 23, 0.7);
            border: 1px solid goldenrod;
            border-radius: 10px;
            padding: 40px;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: goldenrod;
        }
        
        .form-group input, 
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid goldenrod;
            border-radius: 5px;
            color: white;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        .btn-secondary {
            background: transparent;
            border: 2px solid goldenrod;
            color: goldenrod;
            width: 100%;
            margin-bottom: 10px;
        }
        
        .btn-secondary:hover {
            background: rgba(218, 165, 32, 0.1);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        
        .btn-primary {
            background: goldenrod;
            color: black;
            font-weight: bold;
            width: 100%;
        }
        
        .btn-primary:hover {
            background: #e6c200;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        /* Add this to your existing CSS */
        .booking-section-with-bg {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                url('Images/Gujarat_photo.jpeg') no-repeat center center;
            background-size: cover;
            padding: 80px 40px;
            position: relative;
        }
        
        /* Footer (Same as Dashboard) */
        .site-footer {
            background-color: sienna;
            color: white;
            padding: 60px 0 0;
            position: relative;
            margin-top: auto;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 40px;
        }
        
        .footer-column {
            margin-bottom: 30px;
        }
        
        .footer-column h3 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            letter-spacing: 1px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-column h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background: goldenrod;
        }
        
        .footer-column p {
            margin-bottom: 20px;
            line-height: 1.6;
            color: burlywood;
        }
        
        .footer-column ul {
            list-style: none;
        }
        
        .footer-column ul li {
            margin-bottom: 12px;
        }
        
        .footer-column ul li a {
            color: burlywood;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .footer-column ul li a:hover {
            color: goldenrod;
            padding-left: 5px;
        }
        
        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }
        
        .social-links a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            color: white;
            transition: all 0.3s;
        }
        
        .social-links a:hover {
            background: goldenrod;
            transform: translateY(-3px);
        }
        
        .newsletter-form {
            display: flex;
            margin-top: 20px;
        }
        
        .newsletter-form input {
            flex: 1;
            padding: 12px;
            border: none;
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }
        
        .newsletter-form input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        
        .newsletter-form button {
            width: 50px;
            background: goldenrod;
            color: black;
            border: none;
            cursor: pointer;
            transition: background 0.3s;
        }
        
        .newsletter-form button:hover {
            background: #e6c200;
        }
        
        .footer-bottom {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.2);
            margin-top: 40px;
            color: burlywood;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .video-overlay h1 {
                font-size: 2.5rem;
            }
            
            .section-title {
                font-size: 2rem;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <header>
        <nav>
            <div id="logo"><img src="Images/Saad-removebg-preview.png" alt="Saad Travels Logo"></div>
            <div id="nav-elements">
                <ol>
                    <li class="nav-list">Home</li>
                    <li class="nav-list">My Trips</li>
                    <li class="nav-list">Destinations</li>
                    <li class="nav-list">Deals</li>
                </ol>
            </div>
            <div id="user-profile">
                <i class="fa-solid fa-user"></i>
                <% String name= (String)session.getAttribute("name"); %>
                <span><%= name %></span>
            </div>
        </nav>
    </header>
    
    <!-- Hero Video Section -->
    <section class="hero-video">
        <video autoplay muted loop>
            <source src="Videos/videoplayback.mp4" type="video/mp4">
            <!-- Fallback image if video doesn't load -->
        </video>
        <div class="video-overlay">
            <h1>EXPLORE MUNNAR</h1>
            <p>Discover the rolling tea gardens, misty hills, and serene beauty of Kerala's most famous hill station</p>
        </div>
    </section>
    
    <!-- Package Highlights -->
    <section class="content-section">
        <h2 class="section-title">MUNNAR COMPLETE PACKAGE</h2>
        
        <div class="package-highlights">
            <div class="highlight-card">
                <i class="fas fa-map-marked-alt"></i>
                <h3>5 Days / 4 Nights</h3>
                <p>Comprehensive tour covering all major attractions</p>
            </div>
            <div class="highlight-card">
                <i class="fas fa-hotel"></i>
                <h3>Luxury Stay</h3>
                <p>4-star resort with tea garden views</p>
            </div>
            <div class="highlight-card">
                <i class="fas fa-utensils"></i>
                <h3>All Meals</h3>
                <p>Breakfast, lunch & dinner included</p>
            </div>
            <div class="highlight-card">
                <i class="fas fa-car-side"></i>
                <h3>Private Transport</h3>
                <p>AC vehicle with experienced driver</p>
            </div>
        </div>
        
        <div class="itinerary">
            <h2 class="section-title">ITINERARY</h2>
            
            <div class="day-card">
                <h3>Day 1: Arrival in Munnar</h3>
                <ul>
                    <li>Arrival at Cochin Airport (Pickup included)</li>
                    <li>Scenic drive to Munnar (4 hours)</li>
                    <li>Check-in at resort</li>
                    <li>Evening at leisure</li>
                    <li>Dinner at resort</li>
                </ul>
            </div>
            
            <div class="day-card">
                <h3>Day 2: Munnar Sightseeing</h3>
                <ul>
                    <li>Breakfast at resort</li>
                    <li>Visit Echo Point, Mattupetty Dam</li>
                    <li>Tea Museum tour</li>
                    <li>Lunch at local restaurant</li>
                    <li>Visit Top Station for sunset views</li>
                    <li>Dinner at resort</li>
                </ul>
            </div>
            
            <div class="day-card">
                <h3>Day 3: Nature Exploration</h3>
                <ul>
                    <li>Early morning nature walk</li>
                    <li>Breakfast at resort</li>
                    <li>Visit Eravikulam National Park</li>
                    <li>Lunch at jungle resort</li>
                    <li>Visit Chinnar Wildlife Sanctuary</li>
                    <li>Dinner with cultural program</li>
                </ul>
            </div>
            
            <div class="day-card">
                <h3>Day 4: Relax & Leisure</h3>
                <ul>
                    <li>Breakfast at resort</li>
                    <li>Spa & wellness session</li>
                    <li>Optional tea plantation walk</li>
                    <li>Lunch at resort</li>
                    <li>Free time for shopping</li>
                    <li>Farewell dinner</li>
                </ul>
            </div>
            
            <div class="day-card">
                <h3>Day 5: Departure</h3>
                <ul>
                    <li>Breakfast at resort</li>
                    <li>Check-out and drive to Cochin</li>
                    <li>Airport drop-off</li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- Resorts & Restaurants -->
    <section class="content-section" style="background: rgba(0, 0, 0, 0.1);">
        <h2 class="section-title">RECOMMENDED RESORTS & RESTAURANTS</h2>
        
        <div class="recommendations">
            <div class="recommendation-card">
                <img src="Images/Kolukumalai_photo.jpg" alt="Tea Valley Resort">
                <div class="recommendation-info">
                    <h3>Tea Valley Resort</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        4.5 (320 reviews)
                    </div>
                    <p>Luxury cottages with private balconies overlooking tea plantations. Includes spa and infinity pool.</p>
                </div>
            </div>
            
            <div class="recommendation-card">
                <img src="Images/Pondicherry_photo.jpg" alt="Fragrant Nature">
                <div class="recommendation-info">
                    <h3>Fragrant Nature</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        4.0 (280 reviews)
                    </div>
                    <p>Eco-friendly resort with glass-walled rooms offering panoramic mountain views.</p>
                </div>
            </div>
            
            <div class="recommendation-card">
                <img src="Images/kudremukh_photo.webp" alt="Saravana Bhavan">
                <div class="recommendation-info">
                    <h3>Saravana Bhavan</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        4.8 (450 reviews)
                    </div>
                    <p>Famous vegetarian restaurant serving authentic South Indian cuisine.</p>
                </div>
            </div>
            
            <div class="recommendation-card">
                <img src="Images/Meghalaya_photo.webp" alt="Ristorante">
                <div class="recommendation-info">
                    <h3>Ristorante</h3>
                    <div class="rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        4.6 (390 reviews)
                    </div>
                    <p>Multi-cuisine restaurant with stunning valley views and live music evenings.</p>
                </div>
            </div>
        </div>
    </section>
    
   <!-- Booking Form Section with Background Image -->
<section class="content-section booking-section-with-bg">
    <h2 class="section-title">BOOK YOUR MUNNAR PACKAGE</h2>
    
    <div class="booking-form-container">
        <form>
            <div class="form-row">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="people">Number of People</label>
                    <select id="people" name="people" required>
                        <option value="1">1 Person</option>
                        <option value="2">2 People</option>
                        <option value="3">3 People</option>
                        <option value="4">4 People</option>
                        <option value="5+">5+ People</option>
                    </select>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="checkin">Check-in Date</label>
                    <input type="date" id="checkin" name="checkin" required>
                </div>
                <div class="form-group">
                    <label for="checkout">Check-out Date</label>
                    <input type="date" id="checkout" name="checkout" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="accommodation">Accommodation Type</label>
                <select id="accommodation" name="accommodation" required>
                    <option value="deluxe">Deluxe Room - $120/night</option>
                    <option value="suite">Suite - $180/night</option>
                    <option value="villa">Private Villa - $250/night</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="message">Special Requests</label>
                <textarea id="message" name="message" rows="4"></textarea>
            </div>
            <button type="submit" class="btn btn-secondary">Add to Cart</button>
            <button type="submit" class="btn btn-primary">BOOK NOW</button>
        </form>
    </div>
</section>
    
    <!-- Footer -->
    <footer class="site-footer">
        <div class="footer-content">
            <div class="footer-column">
                <h3>SAAD TRAVELS</h3>
                <p>Where Adventure Meets Adrenaline</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Destinations</a></li>
                    <li><a href="#">Special Offers</a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3>Support</h3>
                <ul>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3>Newsletter</h3>
                <p>Subscribe for travel tips and offers</p>
                <form class="newsletter-form">
                    <input type="email" placeholder="Your Email">
                    <button type="submit"><i class="fas fa-paper-plane"></i></button>
                </form>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2023 Saad Travels. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>