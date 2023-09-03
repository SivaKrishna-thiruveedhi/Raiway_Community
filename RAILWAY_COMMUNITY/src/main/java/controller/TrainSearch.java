package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoConnection.DaoConnection;

public class TrainSearch extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String trainName = (String) req.getAttribute("trainName");
		String sql = "select td.* from train_details td, train_region tr where tr.ss_code = td.ss_code and tr.station_name = ?";
		System.out.println("request passed..");
		Connection con = DaoConnection.getConnection();
		PreparedStatement ps = null;
		try {
			if (con != null) {
				ps = con.prepareStatement(sql);
				ps.setString(1, trainName);
				ResultSet rs = ps.executeQuery();
				req.setAttribute("rs_trainSearch", rs);
			} else {
				System.out.println("..........Connection is null..........");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher rd = req.getRequestDispatcher("JSP/trains/trainList.jsp");
		rd.forward(req, resp);
	}
}
