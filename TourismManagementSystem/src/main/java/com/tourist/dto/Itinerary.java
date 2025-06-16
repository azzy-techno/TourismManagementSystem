package com.tourist.dto;

public class Itinerary {
    private int itinerary_id;
    private String itinerary_day;
    private String itinerary_description;
    private int destination_id;

    // Getters and Setters
    public int getItinerary_id() {
        return itinerary_id;
    }

    public void setItinerary_id(int itinerary_id) {
        this.itinerary_id = itinerary_id;
    }

    public String getItinerary_day() {
        return itinerary_day;
    }

    public void setItinerary_day(String itinerary_day) {
        this.itinerary_day = itinerary_day;
    }

    public String getItinerary_description() {
        return itinerary_description;
    }

    public void setItinerary_description(String itinerary_description) {
        this.itinerary_description = itinerary_description;
    }

    public int getDestination_id() {
        return destination_id;
    }

    public void setDestination_id(int destination_id) {
        this.destination_id = destination_id;
    }
}
