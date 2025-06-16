package com.tourist.controller;

import com.tourist.dao.ResortImplementation;
import com.tourist.dao.ResortInterface;
import com.tourist.dto.Resort;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/resortServlet")
public class ResortServlet extends HttpServlet {

    private ResortInterface resortDAO = new ResortImplementation();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addResort(request);
                    break;
                case "update":
                    updateResort(request);
                    break;
                case "delete":
                    deleteResort(request);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("adminDashboard.jsp"); // Assuming this is your admin page
    }

    private void addResort(HttpServletRequest request) {
        try {
            int destinationId = Integer.parseInt(request.getParameter("destination_id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            double rating = Double.parseDouble(request.getParameter("rating"));

            Resort resort = new Resort();
            resort.setDestination_id(destinationId);
            resort.setName(name);
            resort.setDescription(description);
            resort.setType(type);
            resort.setRating(rating);

            resortDAO.insertData(resort);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateResort(HttpServletRequest request) {
        try {
            int resortId = Integer.parseInt(request.getParameter("resort_id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            double rating = Double.parseDouble(request.getParameter("rating"));

            Resort resort = new Resort();
            resort.setResort_id(resortId);
            resort.setName(name);
            resort.setDescription(description);
            resort.setType(type);
            resort.setRating(rating);

            resortDAO.updateData(resort);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteResort(HttpServletRequest request) {
        try {
            int resortId = Integer.parseInt(request.getParameter("resort_id"));
            Resort resort = new Resort();
            resort.setResort_id(resortId);
            resortDAO.deleteData(resort);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Resort> resorts = resortDAO.getAllResorts();
        request.setAttribute("resorts", resorts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_resorts.jsp"); // Replace if using a different JSP
        dispatcher.forward(request, response);
    }
}
