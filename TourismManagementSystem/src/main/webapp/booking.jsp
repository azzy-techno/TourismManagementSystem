<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.tourist.dao.PaymentImplementation"%>
<%@ page import="com.tourist.dto.Payment"%>
<%@ include file="sessionCheck.jsp"%>

<%
String bookingId = request.getParameter("booking_id");
String paymentMethod = request.getParameter("payment");
%>

<%
String paymentIdStr = request.getParameter("payment_id");
String paymentStatus = "N/A";
double amount = 0;

if (paymentIdStr != null) {
	try {
		int paymentId = Integer.parseInt(paymentIdStr);
		PaymentImplementation paymentDAO = new PaymentImplementation();
		Payment payment = paymentDAO.getPayment(paymentId);

		if (payment != null) {
	bookingId = String.valueOf(payment.getBookingId());
	paymentMethod = payment.getPaymentMethod();
	paymentStatus = payment.getPaymentStatus();
	amount = payment.getAmount();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Booking Confirmed</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
}

body {
	background-color: #121212;
	color: #ffffff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.confirmation-box {
	background-color: #1e1e1e;
	border: 2px solid goldenrod;
	padding: 40px;
	border-radius: 12px;
	text-align: center;
	box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
}

.confirmation-box h1 {
	color: goldenrod;
	margin-bottom: 20px;
}

.confirmation-box p {
	font-size: 18px;
	margin: 10px 0;
}

.back-btn {
	margin-top: 25px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: goldenrod;
	color: #000;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.back-btn:hover {
	background-color: orange;
}

.status-success {
	color: lightgreen;
	font-weight: bold;
}

.status-pending {
	color: orange;
	font-weight: bold;
}
</style>
</head>
<body>


	<div class="confirmation-box">
		<h1>Booking Confirmed ✅</h1>
		<p>
			<strong>Booking ID:</strong>
			<%=bookingId%></p>
		<p>
			<strong>Payment Method:</strong>
			<%=paymentMethod.toUpperCase()%></p>
		<p>
			<strong>Payment Status:</strong> <span
				class="<%="Success".equalsIgnoreCase(paymentStatus) ? "status-success" : "status-pending"%>">
				<%=paymentStatus%>
			</span>
		</p>
		<p>
			<strong>Amount Paid:</strong> ₹<%=amount%></p>
		<p>Thank you for booking with us!</p>

		<form action="downloadReceipt" method="get" style="margin-top: 15px;">
			<input type="hidden" name="booking_id" value="<%=bookingId%>">
			<button class="back-btn" type="submit">Download Receipt
				(PDF)</button>
		</form>


		<form action="home.jsp" method="get">
			<button class="back-btn" type="submit">Back to Home</button>
		</form>
	</div>

</body>
</html>
