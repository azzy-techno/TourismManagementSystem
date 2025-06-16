package com.tourist.dao;

import com.tourist.dto.Itinerary;
import java.util.List;

public interface ItineraryInterface {
    void addItinerary(Itinerary itinerary);
    void updateItinerary(Itinerary itinerary);
    void deleteItinerary(int itineraryId);
    List<Itinerary> getAllItineraries();
    List<Itinerary> getItineraryByDestinationId(int destinationId);
    Itinerary getItineraryById(int itineraryId);
}
