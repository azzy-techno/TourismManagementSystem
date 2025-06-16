package com.tourist.controller;

import java.io.IOException;	
import java.util.List;

import com.tourist.dao.DestinationImplementation;
import com.tourist.dao.DestinationInterface;
import com.tourist.dto.Destination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/destinationServlet")
public class DestinationServlet extends HttpServlet {

	
	DestinationInterface di = new DestinationImplementation();

	 @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        List<Destination> list = di.getAllDestinations();
	        req.setAttribute("destinations", list);

	        String role = (String) req.getSession().getAttribute("role");

	        if ("admin".equals(role)) {
	            RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
	            rd.forward(req, resp);
	        } else {
	            RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
	            rd.forward(req, resp);
	        }
	    }
	 
			private DestinationImplementation dao = new DestinationImplementation();

			@Override
			protected void doPost(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
				String action = request.getParameter("action");

				if ("add".equals(action)) {
					String name = request.getParameter("destination_name");
					String description = request.getParameter("destination_description");
					String paragraph = request.getParameter("destination_paragraph");
					double price = Double.parseDouble(request.getParameter("destination_price"));
					String image = request.getParameter("destination_image");
					String rating = request.getParameter("destination_rating");

					Destination destination = new Destination();
					destination.setDestination_name(name);
					destination.setDestination_description(description);
					destination.setDestination_paragraph(paragraph);
					destination.setDestination_price(price);
					destination.setDestination_image(image);
					destination.setDestination_rating(rating);

					boolean isAdded = dao.insertData(destination);
					if (isAdded) {
						response.sendRedirect("adminDashboard.jsp?msg=added");
					} else {
						response.sendRedirect("adminDashboard.jsp?msg=fail");
					}
				} else if ("delete".equals(action)) {
					int id = Integer.parseInt(request.getParameter("destination_id"));
					boolean isDeleted = dao.deleteData(id);
					if (isDeleted) {
						response.sendRedirect("adminDashboard.jsp?msg=deleted");
					} else {
						response.sendRedirect("adminDashboard.jsp?msg=fail");
					}
				} else if ("update".equals(action)) {
				    int id = Integer.parseInt(request.getParameter("destination_id"));
				    String name = request.getParameter("destination_name");
				    String description = request.getParameter("destination_description");
				    String paragraph = request.getParameter("destination_paragraph");
				    double price = Double.parseDouble(request.getParameter("destination_price"));
				    String image = request.getParameter("destination_image");
				    String rating = request.getParameter("destination_rating");

				    Destination destination = new Destination();
				    destination.setDestination_id(id);
				    destination.setDestination_name(name);
				    destination.setDestination_description(description);
				    destination.setDestination_paragraph(paragraph);
				    destination.setDestination_price(price);
				    destination.setDestination_image(image);
				    destination.setDestination_rating(rating);

				    boolean isUpdated = dao.updateData(destination);
				    if (isUpdated) {
				        response.sendRedirect("adminDashboard.jsp?msg=updated");
				    } else {
				        response.sendRedirect("adminDashboard.jsp?msg=fail");
				    }
				}

			}
		
}
