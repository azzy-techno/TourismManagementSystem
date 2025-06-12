<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tourist.dao.DestinationImplementation" %>
<%@ page import="com.tourist.dto.Destination" %>
<%@ page import="java.util.List" %>

<%
    DestinationImplementation dao = new DestinationImplementation();
    List<Destination> destinations = dao.getAllDestinations();
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Saad Travels</title>
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
        
        /* Navigation - Same as Login Page */
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
        
        .video-overlay h1 span{
        color: sienna;
        }
        
        .video-overlay p {
            font-size: 1.5rem;
            max-width: 800px;
            text-align: center;
            color: burlywood;
        }
        
        /* Main Content Sections */
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
        
        /* Upcoming Trips */
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
            transition: transform 0.3s;
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
        
        /* Special Offers */
        .offers-container {
            background: rgba(90, 52, 23, 0.3);
            padding: 40px;
            border-radius: 10px;
            margin-top: 30px;
        }
        
                /* Footer Styles */
    .site-footer {
        background-color: sienna;
        color: white;
        padding: 60px 0 0;
        position: relative;
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
    
    @media (max-width: 768px) {
        .footer-content {
            grid-template-columns: 1fr;
            gap: 30px;
        }
        
        .footer-column {
            text-align: center;
        }
        
        .footer-column h3::after {
            left: 50%;
            transform: translateX(-50%);
        }
        
        .social-links {
            justify-content: center;
        }
    }
       
     .stats-bar {
            background: rgba(90, 52, 23, 0.8);
            padding: 30px;
            display: flex;
            justify-content: space-around;
            text-align: center;
            margin: 40px 0;
        }
        
        .stat-item h3 {
            font-size: 2.5rem;
            color: goldenrod;
        }
        
        .testimonials {
            padding: 60px 40px;
            background: rgba(0, 0, 0, 0.1);
        }
        
        .testimonial-card {
            background: rgba(90, 52, 23, 0.6);
            padding: 30px;
            border-radius: 10px;
            margin: 20px;
            border-left: 4px solid goldenrod;
        }
        
        .blog-section {
            padding: 60px 40px;
        }
        
        .blog-card {
            background: rgba(90, 52, 23, 0.4);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
        }
        
        .blog-card:hover {
            transform: translateY(-10px);
        }
        @media (max-width: 768px) {
            .signup-form {
                padding: 30px 20px;
            }
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .video-overlay h1 {
                font-size: 2.5rem;
            }
            
            .section-title {
                font-size: 2rem;
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
                <% String name= (String)session.getAttribute("name"); %>
                <i class="fa-solid fa-user"></i><span><%= name %></span>
            </div>
        </nav>
    </header>
    
    <!-- Hero Video Section -->
    <section class="hero-video">
        <video autoplay muted loop>
            <source src="Videos/videoplayback3.webm" type="video/webm">
        </video>
        <div class="video-overlay">
            <h1>Welcome To Saad Travels <span><%= name %></span></h1>
            <p>Ready for your next adventure? Explore our exclusive member-only deals below.</p>
        </div>
    </section>

    <!-- Top Destinations Section -->
<!-- Top Destinations Section -->
<section class="content-section">
    <h2 class="section-title">Top Destinations</h2>
    <div class="trips-grid">

        <%
            for (Destination d : destinations) {
        %>
        <div class="trip-card">
            <img src="<%= d.getDestination_image() %>" alt="<%= d.getDestination_name() %>">
            <div class="trip-info">
                <h3><%= d.getDestination_name() %></h3>
                <p><%= d.getDestination_description() %></p>
                <p><%= d.getDestination_paragraph() %></p>
                <div class="trip-meta">
                    <span><%= d.getDestination_price() %>/- per day</span>
                    <span>Rating: <%= d.getDestination_rating() %> stars</span>
                    
                    <a href="booking.jsp?id=<%= d.getDestination_id() %>" class="book-now">Book Now</a>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
</section>

    <!-- Upcoming Trips Section -->
    <section class="content-section">
        <h2 class="section-title">YOUR UPCOMING TRIPS</h2>
        <div class="trips-grid">
            <!-- Trip 1 -->
            <div class="trip-card">
                <img src="Images/Kolukumalai_photo.jpg" alt="Swiss Alps">
                <div class="trip-info">
                    <h3>Swiss Alps Expedition</h3>
                    <p>5-day mountain adventure with luxury lodging</p>
                    <div class="trip-meta">
                        <span>June 15-20, 2023</span>
                        <span>$1,299</span>
                    </div>
                    <a href="#" class="book-now">Manage Booking</a>
                </div>
            </div>
            
            <!-- Trip 2 -->
            <div class="trip-card">
                <img src="Images/login4_photo.jpg" alt="Bali Retreat">
                <div class="trip-info">
                    <h3>Bali Wellness Retreat</h3>
                    <p>7-day tropical paradise with spa treatments</p>
                    <div class="trip-meta">
                        <span>August 5-12, 2023</span>
                        <span>$1,899</span>
                    </div>
                    <a href="#" class="book-now">Manage Booking</a>
                </div>
            </div>
            
            <!-- Trip 3 -->
            <div class="trip-card">
                <img src="Images/Gokarna_photo.jpeg" alt="African Safari">
                <div class="trip-info">
                    <h3>African Safari</h3>
                    <p>10-day wildlife adventure with expert guides</p>
                    <div class="trip-meta">
                        <span>October 10-20, 2023</span>
                        <span>$2,499</span>
                    </div>
                    <a href="#" class="book-now">Manage Booking</a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Special Offers Section -->
    <section class="content-section" style="background: rgba(0, 0, 0, 0.2);">
        <h2 class="section-title">MEMBER EXCLUSIVES</h2>
        <div class="offers-container">
            <div class="trips-grid">
                <!-- Offer 1 -->
                <div class="trip-card">
                    <img src="Images/Kanyakumari_photo.jpg" alt="Paris Special">
                    <div class="trip-info">
                        <h3>Paris Spring Special</h3>
                        <p>4 nights in luxury boutique hotels</p>
                        <div class="trip-meta">
                            <span>Save 25%</span>
                            <span style="text-decoration: line-through;">$1,200</span>
                            <span>$899</span>
                        </div>
                        <a href="#" class="book-now">Book Now</a>
                    </div>
                </div>
                
                <!-- Offer 2 -->
                <div class="trip-card">
                    <img src="Images/login2_photo.jpg" alt="Caribbean Cruise">
                    <div class="trip-info">
                        <h3>Caribbean Cruise</h3>
                        <p>7-day all-inclusive island hopping</p>
                        <div class="trip-meta">
                            <span>Early Bird Discount</span>
                            <span style="text-decoration: line-through;">$1,800</span>
                            <span>$1,399</span>
                        </div>
                        <a href="#" class="book-now">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
<section class="content-section">
    <h2 class="section-title">Why Choose Us</h2>
    <div class="trips-grid">
        <div class="trip-card">
            <div class="trip-info">
                <i class="fas fa-plane-departure fa-3x" style="color: goldenrod; margin-bottom: 15px;"></i>
                <h3>Seamless Bookings</h3>
                <p>Quick and hassle-free flight, hotel, and tour bookings with instant confirmation.</p>
            </div>
        </div>
        <div class="trip-card">
            <div class="trip-info">
                <i class="fas fa-wallet fa-3x" style="color: goldenrod; margin-bottom: 15px;"></i>
                <h3>Affordable Pricing</h3>
                <p>We provide the best deals without compromising on quality or comfort.</p>
            </div>
        </div>
        <div class="trip-card">
            <div class="trip-info">
                <i class="fas fa-headset fa-3x" style="color: goldenrod; margin-bottom: 15px;"></i>
                <h3>24/7 Support</h3>
                <p>Dedicated travel experts ready to assist you anytime, anywhere.</p>
            </div>
        </div>
    </div>
</section>



<!-- Customer Support -->
<section class="content-section">
    <h2 class="section-title">Customer Support</h2>
    <div class="offers-container">
        <p>At Saad Travels, your satisfaction is our priority. Whether it's booking assistance, travel tips, or last-minute changes—we’re just a call or message away.</p>
        <br><p><strong>Email:</strong> support@saadtravels.com &nbsp; | &nbsp; <strong>Phone:</strong> +123 456 7890</p>
    </div>
</section>

<!-- FAQ Section -->
<section class="content-section">
    <h2 class="section-title">Frequently Asked Questions</h2>
    <div class="offers-container">
        <h3 style="color: goldenrod;">How can I cancel or reschedule a trip?</h3>
        <p style="color: burlywood;">Simply login to your account, go to "My Trips", and choose the cancel or reschedule option. Policies may apply based on service provider.</p>

        <h3 style="color: goldenrod;">Are your deals refundable?</h3>
        <p style="color: burlywood;">Most deals are refundable within 24 hours of booking. Check the individual offer’s policy for more info.</p>

        <h3 style="color: goldenrod;">Can I travel without a printed ticket?</h3>
        <p style="color: burlywood;">Yes! Mobile e-tickets are accepted for most bookings. Always confirm based on your destination's regulations.</p>
    </div>
</section>

    
     <!-- Footer (Same as Main Page) -->
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