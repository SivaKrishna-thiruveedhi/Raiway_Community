<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="daoConnection.DaoConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RailWay Community</title>
<link href="../../styles/home.css" rel="stylesheet">
</head>
<body>
	<header id="header1">Header</header>
	<nav id="nav1">
		<ul style="list-style-type: none;">
			<li><div><a href="../home.jsp">Home</a></div></li>
			<li><div><a href="trainSearch.jsp">Trains</a></div></li>
			<li><div><a href="../register/register.jsp">Register</a></div></li>
			<li><div><a href="../login/login.jsp">Login</a></div></li>
			<li><div><a href="../contact.jsp">Contact</a></div></li>
		</ul>
	</nav>
	<main id="main1">
		<div>
			<div>Search Your train by Starting Station</div>
			<div id="search">
				<div style="position: relative; left: 170px; top:50px; width: 250px">
					<form action="../../TrainSearch" method="get">
						<select style="font-size: 20px;" name="trainName">
							<option value="">------------Select------------</option>
						<%
							String sql = "select station_name from train_region";
							String train = "";
							Connection con= DaoConnection.getConnection();
							PreparedStatement ps = null;
							try{
								if(con != null){
									ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();
									while(rs.next()){
										%><option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option><%
									}
								}else{
									%><option value="0">--No Stations--</option><%
								}
							}
							catch(Exception e){
								e.printStackTrace();
							} finally {
								try {
									con.close();
									ps.close();
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						%>
							
						</select><br><br><br><br>
						<input type="submit" style="margin-left: 80px; font-size: 20px; border-radius: 10px;" id="btn" id="searchbtn">
					</form>
				</div>
			</div>
		</div>	
	</main>
	<footer id="footer1">
	
	</footer>
</body>
</html>















