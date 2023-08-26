package daoConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DaoConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/siva_krishna?user=root&password=root");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
