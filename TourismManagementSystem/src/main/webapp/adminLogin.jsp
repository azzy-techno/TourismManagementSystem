<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | Saad Travels</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
        }
        
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: whitesmoke;
        }
        
        /* Navigation - Same as Main Page */
        nav {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            background-color: sienna;
            height: 100px;
            width: 100%;
            position: relative;
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
            color: white;
        }
        
        #logo img {
            height: 80px;
            width: 90px;
            object-fit: contain;
        }
        
        #login {
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        /* Background Video Section */
        .login-hero {
            position: relative;
            flex: 1;
            overflow: hidden;
        }
        .video-container {
            position: relative;
            width: 100%;
            height: calc(100vh - 100px); /* Full viewport minus nav height */
            overflow: hidden;
        }
        
        .bg-video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1;
        }
        
        /* Transparent Login Form */
        .login-form-container {
            position: relative;
            z-index: 2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            padding: 40px;
        }
        
        .login-form {
            background: rgba(90, 52, 23, 0.85); /* Semi-transparent sienna */
            backdrop-filter: blur(10px);
            border: 2px solid goldenrod;
            border-radius: 10px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            animation: fadeIn 0.5s ease-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .login-form h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 30px;
            letter-spacing: 3px;
            color: goldenrod;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            letter-spacing: 1px;
        }
        
        .form-group input {
            width: 100%;
            padding: 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid goldenrod;
            border-radius: 5px;
            color: white;
            font-size: 1rem;
        }
        
        .form-group input:focus {
            outline: 2px solid goldenrod;
            background: rgba(255, 255, 255, 0.15);
        }
        
        .login-btn {
            width: 100%;
            padding: 15px;
            background-color: goldenrod;
            color: black;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }
        
        .login-btn:hover {
            background-color: #e6c200;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: burlywood;
        }
        
        .register-link a {
            color: goldenrod;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }
        
        .register-link a:hover {
            color: #e6c200;
            text-decoration: underline;
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
    </style>
</head>
<body>
    <!-- Navigation -->
    <header>
        <nav>
            <div id="logo"><img src="Images/Saad-removebg-preview.png" alt="Saad Travels Logo"></div>
            <div id="nav-elements">
                <ol>
                    <li class="nav-list">Packages</li>
                    <li class="nav-list">Destinations</li>
                    <li class="nav-list">Itinerary</li>
                </ol>
            </div>
            <div id="login"><i class="fa-solid fa-user"></i></div>
        </nav>
    </header>
    
    <div class="video-container">
        <video class="bg-video" autoplay muted loop>
            <source src="Videos/videoplayback2.webm" type="video/webm">
        </video>
        
        <!-- Admin Login Form Overlay -->
        <div class="login-form-container">
            <form action="adminLogin" method="post" class="login-form">
                <h2>ADMIN LOGIN</h2>
                
                <div class="form-group">
                    <label for="email">ADMIN EMAIL</label>
                    <input type="email" name="email" id="email" placeholder="Enter admin email" required>
                </div>
                
                <div class="form-group">
                    <label for="password">PASSWORD</label>
                    <input type="password" name="password" id="password" placeholder="Enter password" required>
                </div>
                
                <button type="submit" class="login-btn">LOGIN</button>
                
                <div class="register-link">
                    Are you a user? <a href="login.jsp">Go to User Login</a>
                </div>
            </form>
        </div>
    </div>
    
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
