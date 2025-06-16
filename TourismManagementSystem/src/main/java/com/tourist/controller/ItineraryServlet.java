package com.tourist.controller;

import com.tourist.dao.ItineraryImplementation;
import com.tourist.dao.ItineraryInterface;
import com.tourist.dto.Itinerary;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/itineraryServlet")
public class ItineraryServlet extends HttpServlet {

    private ItineraryInterface itineraryDAO = new ItineraryImplementation();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addItinerary(request);
                    break;
                case "update":
                    updateItinerary(request);
                    break;
                case "delete":
                    deleteItinerary(request);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminDashboard.jsp");
    }

    private void addItinerary(HttpServletRequest request) {
        try {
            String itinerary_day = request.getParameter("itinerary_day");
            String itinerary_description = request.getParameter("itinerary_description");
            int destination_id = Integer.parseInt(request.getParameter("destination_id"));

            Itinerary itinerary = new Itinerary();
            itinerary.setItinerary_day(itinerary_day);
            itinerary.setItinerary_description(itinerary_description);
            itinerary.setDestination_id(destination_id);

            itineraryDAO.addItinerary(itinerary);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateItinerary(HttpServletRequest request) {
        try {
            int itinerary_id = Integer.parseInt(request.getParameter("itinerary_id"));
            String itinerary_day = request.getParameter("itinerary_day");
            String itinerary_description = request.getParameter("itinerary_description");
            int destination_id = Integer.parseInt(request.getParameter("destination_id"));

            Itinerary itinerary = new Itinerary();
            itinerary.setItinerary_id(itinerary_id);
            itinerary.setItinerary_day(itinerary_day);
            itinerary.setItinerary_description(itinerary_description);
            itinerary.setDestination_id(destination_id);

            itineraryDAO.updateItinerary(itinerary);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteItinerary(HttpServletRequest request) {
        try {
            int itinerary_id = Integer.parseInt(request.getParameter("itinerary_id"));
            itineraryDAO.deleteItinerary(itinerary_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Optional: View all itineraries in admin page
        List<Itinerary> itineraries = itineraryDAO.getAllItineraries();
        request.setAttribute("itineraries", itineraries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_itinerary.jsp");
        dispatcher.forward(request, response);
    }
}
