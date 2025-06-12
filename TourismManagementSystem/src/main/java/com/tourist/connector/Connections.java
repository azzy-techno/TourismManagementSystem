package com.tourist.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connections {
 static Connection con;
	public static Connection connector() {
		String url = "jdbc:mysql://localhost/tourism_db";
		String user = "root";
		String pass = "Abrar@1219";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
