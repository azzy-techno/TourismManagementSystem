package com.tourist.dao;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.tourist.connector.Connections;
import com.tourist.dto.Tourist;

public class TouristImplementation implements TouristInterface {
	Tourist t = new Tourist();
	Connection con;

	public void connect() {
		con=Connections.connector();
	}

	@Override
	public boolean insertData(Tourist t) {
		connect();
		String qry = "INSERT INTO tourist(name,email,phone,password,confirmPassword) VALUES(?,?,?,?,?)";
		int res = 0;
		try {
			PreparedStatement ptst = con.prepareStatement(qry);
			ptst.setString(1, t.getName());
			ptst.setString(2, t.getEmail());
			ptst.setLong(3, t.getPhone());
			ptst.setString(4, t.getPassword());
			ptst.setString(5, t.getConfirmPassword());
			if (t.getPassword().equals(t.getConfirmPassword())) {
				res = ptst.executeUpdate();
				System.out.println(res + " rows has been affected");
			} else {
				System.out.println("Password mismatched, enter correct password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteData(Tourist t) {
		connect();
		String qry = "DELETE FROM tourist WHERE id = ?";
		boolean isDeleted = false;
		try {
			PreparedStatement ptst = con.prepareStatement(qry);
			ptst.setInt(1, t.getId());
			int count = ptst.executeUpdate();
			if (count > 0) {
				isDeleted = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isDeleted;
	}

	@Override
	public boolean updateData(Tourist t) {
		connect();
		String qry = "UPDATE tourist SET name= ?, email = ?, phone = ? WHERE id = ?";
		boolean isUpdate = false;
		try {
			PreparedStatement ptst = con.prepareStatement(qry);
			ptst.setString(1, t.getName());
			ptst.setString(2, t.getEmail());
			ptst.setLong(3, t.getPhone());
			ptst.setInt(4, t.getId());
			int count = ptst.executeUpdate();
			if (count > 0) {
				isUpdate = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isUpdate;
	}

	@Override
	public Tourist getTourist(int id) {
		connect();
		String qry = "SELECT * FROM tourist WHERE id=?";
		try {
			PreparedStatement ptst = con.prepareStatement(qry);
			ptst.setInt(1, id);
			ResultSet rs = ptst.executeQuery();
			if (rs.next()) {
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setPhone(rs.getLong(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t;
	}

	@Override
	public Tourist getTouristInfo(String email, String password) {
		connect();
		String qry = "SELECT * FROM tourist WHERE email =? and password =?";
		try {
			PreparedStatement ptst = con.prepareStatement(qry);
			ptst.setString(1, email);
			ptst.setString(2, password);
			ResultSet rs = ptst.executeQuery();
			if (rs.next()) {
				System.out.println("logged in successfully");
				System.out.println("welcome Mr. " + rs.getString(2));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setPhone(rs.getLong(4));
				t.setPassword(rs.getString(5));
				t.setConfirmPassword(rs.getString(6));
				return t;
			} else {
				System.out.println("Login Failed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
