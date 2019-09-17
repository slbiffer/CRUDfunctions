<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Users</title>
</head>
<body>

<%@page import="allCRUD.DBconnection"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<%
String username = request.getParameter("username");
String driverName = "com.mysql.jdbc.Driver";

//Connection con = null;

try{
	Class.forName(driverName);
}catch(ClassNotFoundException ex){
	System.out.println("Error" + ex);
	ex.printStackTrace();
	
}

Connection con = null;
Statement st = null;
ResultSet rs = null;
%>

<h2 align = "center"><font><strong>All Data</strong></font></h2>
<form action="" method="post">
<table align = "center" cellpadding="0.2" cellspacing="0.2" border = "1" action = "dt" class="tab2">
<tr>
</tr>

<tr bgcolor = "dimgray">

<td><b>Username</b></td>
<td><b>Password</b></td>
<td><b>dob</b></td>
<td><b>NIC</b></td>
<td><b>Email</b></td>

</tr>
<%
try{
	Connection conn=DBconnection.getconn();
	st=conn.createStatement();
	String sql=("SELECT * from all_table");
	
	rs=st.executeQuery(sql);
	while(rs.next()){
	
%>

<tr bgcolor = "blue">


<td><input type="text" name="username" value="<%=rs.getString("Username") %>"></td>
<td><input type="text" name="password" value="<%=rs.getString("Password") %>"></td>
<td><input type="text" name="dob" value="<%=rs.getString("dob") %>"></td>
<td><input type="text" name="nic" value="<%=rs.getString("nic") %>"></td>
<td><input type="text" name="email" value="<%=rs.getString("email") %>"></td>

<%
	}
	
	
}catch (Exception ex){
	System.out.println("Error" + ex);
	ex.printStackTrace();
	
	//<input type="button" value="Delete">
	 //<input type="button" value="Update"/>

}

%>


</table>
</form>
<br><br>
<a class="button" href="index.jsp">Main Menu</a>
</body>
</html>