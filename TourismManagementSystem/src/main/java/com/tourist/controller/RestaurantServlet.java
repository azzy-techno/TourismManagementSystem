package com.tourist.controller;

import com.tourist.dao.RestaurantImplementation;
import com.tourist.dao.RestaurantInterface;
import com.tourist.dto.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/restaurantServlet")
public class RestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantInterface restaurantDAO = new RestaurantImplementation();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        try {
            if ("add".equalsIgnoreCase(action)) {
                addRestaurant(request, response);
            } else if ("update".equalsIgnoreCase(action)) {
                updateRestaurant(request, response);
            } else if ("delete".equalsIgnoreCase(action)) {
                deleteRestaurant(request, response);
            } else {
                response.sendRedirect("adminDashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void addRestaurant(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Restaurant restaurant = new Restaurant();
        restaurant.setName(request.getParameter("name").trim());
        restaurant.setDescription(request.getParameter("description").trim());
        restaurant.setCuisine_type(request.getParameter("cuisine_type").trim());
        restaurant.setRating(Double.parseDouble(request.getParameter("rating")));
        restaurant.setDestination_id(Integer.parseInt(request.getParameter("destination_id")));

        boolean inserted = restaurantDAO.insertData(restaurant);
        if (inserted) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void updateRestaurant(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurant_id(Integer.parseInt(request.getParameter("restaurant_id")));
        restaurant.setName(request.getParameter("name").trim());
        restaurant.setDescription(request.getParameter("description").trim());
        restaurant.setCuisine_type(request.getParameter("cuisine_type").trim());
        restaurant.setRating(Double.parseDouble(request.getParameter("rating")));
        restaurant.setDestination_id(Integer.parseInt(request.getParameter("destination_id")));

        boolean updated = restaurantDAO.updateData(restaurant);
        if (updated) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private void deleteRestaurant(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int restaurantId = Integer.parseInt(request.getParameter("restaurant_id"));

        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurant_id(restaurantId);

        boolean deleted = restaurantDAO.deleteData(restaurant);
        if (deleted) {
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
