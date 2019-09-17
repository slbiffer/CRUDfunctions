<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="allCRUD.DBconnection"%>

<%
	String username = request.getParameter("username");
	String driverName = "com.mysql.jdbc.Driver";

	//Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception ex) {
		ex.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Database</title>


</head>
<body>

<div class="forms">
				<form class="update" method="POST" name="data">
					<table class="tab" style="border-color: black; color: black"
						align="center">
						<tr>
							<td>Username:</td>
							<td><input id="Text1" type="text" name="username" required /></td>
							<td><input type="submit" value="Search" name="btnAdd"></td>
							<%
								String user = request.getParameter("username");
							%>
						</tr>
					</table>
				</form>
			</div>
			<div class="forms">
				<%
					System.out.println("User: " + user);
					try {
						String sql = ("SELECT * FROM all_table WHERE username = '"+user+"'");
						Connection con=DBconnection.getconn();
						PreparedStatement st = con.prepareStatement(sql);
						ResultSet rs = st.executeQuery(sql);
						while (rs.next()) {
				%>
				<form class="user" action="Update_data" method="POST"
					name="Update_data">
					<table class="tab" style="border-color: black; color: black"
						align="center">
						<tr>
							<td>Username:</td>
							<td><input id="Text1" type="text" name="username"
								value="<%=rs.getString("Username")%>" required /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input id="Text1" type="text" name="password"
								value="<%=rs.getString("Password")%>" required /></td>
						</tr>
						<tr>
							<td>Date of Birth:</td>
							<td><input id="Text1" type="text" name="dob"
								value="<%=rs.getString("dob")%>" required /></td>
						</tr>
						<tr>
							<td>NIC:</td>
							<td><input type="text" name="nic" 
							value="<%=rs.getString("nic")%>" required /></td>

						</tr>
						<tr>
							<td>e-mail:</td>
							<td><input type="text" name="email" 
							value="<%=rs.getString("email")%>" required></td>
						</tr>
						<tr>
					<td><input type="submit" value="Update_data" class="button">
					</td>
				</tr>

					</table>
					<%
						}
						} catch (Exception ex) {
							System.out.println("Error: " + ex);
							ex.printStackTrace();
						}
					%>
				</form>
			</div>

<br><br>
<a class="button" href="index.jsp">Main Menu</a>
</body>
</html>