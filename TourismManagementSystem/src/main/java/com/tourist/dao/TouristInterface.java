package com.tourist.dao;

import com.tourist.dto.Tourist;

public interface TouristInterface {

	boolean insertData(Tourist t);

	boolean deleteData(Tourist t);

	boolean updateData(Tourist t);

	Tourist getTourist(int id);
	
	Tourist getTouristInfo(String email, String password);
}
