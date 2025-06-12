package com.tourist.dto;

import java.util.Date;

public class Booking {
    private int booking_id;
    private int destination_id;
    private String user_name;
    private String user_email;
    private Date booking_date;
    private Date travel_date;
    private int no_of_days;
    private double total_price;

	public int getBooking_id() {
		return booking_id;
	}

	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}

	public int getDestination_id() {
		return destination_id;
	}
	
	public void setDestination_id(int destination_id) {
		this.destination_id = destination_id;
	}
	
	public String getUser_name() {
		return user_name;
	}
	
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_email() {
		return user_email;
	}
	
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public Date getBooking_date() {
		return booking_date;
	}
	
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	
	public Date getTravel_date() {
		return travel_date;
	}
	
	public void setTravel_date(Date travel_date) {
		this.travel_date = travel_date;
	}
	
	public int getNo_of_days() {
		return no_of_days;
	}
	
	public void setNo_of_days(int no_of_days) {
		this.no_of_days = no_of_days;
	}
	
	public double getTotal_price() {
		return total_price;
	}
	
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	
	@Override
	public String toString() {
		return "Booking [booking_id=" + booking_id + ", destination_id=" + destination_id + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", booking_date=" + booking_date + ", travel_date=" + travel_date
				+ ", no_of_days=" + no_of_days + ", total_price=" + total_price + "]";
	}
	
	public Booking(int booking_id, int destination_id, String user_name, String user_email, Date booking_date,
			Date travel_date, int no_of_days, double total_price) {
		this.booking_id = booking_id;
		this.destination_id = destination_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.booking_date = booking_date;
		this.travel_date = travel_date;
		this.no_of_days = no_of_days;
		this.total_price = total_price;
	}
	
	public Booking() {
		// Default constructor
	}
}
