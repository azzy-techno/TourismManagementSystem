package com.tourist.dao;

import com.tourist.connector.Connections;
import com.tourist.dto.Itinerary;
import java.sql.*;
import java.util.*;

public class ItineraryImplementation implements ItineraryInterface {

	Connection conn = null;

    public void connect() {
        conn = Connections.connector();
    }
    @Override
    public void addItinerary(Itinerary itinerary) {
    	        connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO itinerary (itinerary_day, itinerary_description, destination_id) VALUES (?, ?, ?)");
            ps.setString(1, itinerary.getItinerary_day());
            ps.setString(2, itinerary.getItinerary_description());
            ps.setInt(3, itinerary.getDestination_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateItinerary(Itinerary itinerary) {
    	        connect();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE itinerary SET itinerary_day=?, itinerary_description=?, destination_id=? WHERE itinerary_id=?");
            ps.setString(1, itinerary.getItinerary_day());
            ps.setString(2, itinerary.getItinerary_description());
            ps.setInt(3, itinerary.getDestination_id());
            ps.setInt(4, itinerary.getItinerary_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteItinerary(int itineraryId) {
    	        connect();
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM itinerary WHERE itinerary_id=?");
            ps.setInt(1, itineraryId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Itinerary> getAllItineraries() {
    	        connect();
        List<Itinerary> list = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM itinerary");
            while (rs.next()) {
                Itinerary i = new Itinerary();
                i.setItinerary_id(rs.getInt("itinerary_id"));
                i.setItinerary_day(rs.getString("itinerary_day"));
                i.setItinerary_description(rs.getString("itinerary_description"));
                i.setDestination_id(rs.getInt("destination_id"));
                list.add(i);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Itinerary> getItineraryByDestinationId(int destinationId) {
    		        connect();
        List<Itinerary> list = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM itinerary WHERE destination_id=?");
            ps.setInt(1, destinationId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Itinerary i = new Itinerary();
                i.setItinerary_id(rs.getInt("itinerary_id"));
                i.setItinerary_day(rs.getString("itinerary_day"));
                i.setItinerary_description(rs.getString("itinerary_description"));
                i.setDestination_id(rs.getInt("destination_id"));
                list.add(i);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Itinerary getItineraryById(int itineraryId) {	
    	        connect();
        Itinerary i = null;
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM itinerary WHERE itinerary_id=?");
            ps.setInt(1, itineraryId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                i = new Itinerary();
                i.setItinerary_id(rs.getInt("itinerary_id"));
                i.setItinerary_day(rs.getString("itinerary_day"));
                i.setItinerary_description(rs.getString("itinerary_description"));
                i.setDestination_id(rs.getInt("destination_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
