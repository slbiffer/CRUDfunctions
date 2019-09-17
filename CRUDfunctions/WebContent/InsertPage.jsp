<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Update Delete</title>




</head>
<body>

			<div class="forms">
				<p align="Left" style="letter-spacing: 4px">Add Form</p>
				<hr>
				<form name="Add" action="Add_data" method="POST">
					<table class="tab" style="border-color: white; color: dimgray"
						align="center">
						<tr>
							<td>Username:</td>
							<td><input id="Text1" type="text" name="username" required /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input id="Text1" type="text" name="password" required /></td>
						</tr>
						<tr>
							<td>Date of Birth:</td>

							<td><input id="Text1" type="date" name="dob" required /></td>
						</tr>
						<tr>
							<td>NIC:</td>
							<td><input id="Text1" type="text" name="nic" placeholder="dont enter v " required /></td>
						</tr>

						<tr>
							<td>e-mail:</td>
							<td><input id="Text1" type="text" name="email" required /></td>
						</tr>

						<tr>
							<td><input type="submit" value="Add" class="button">
							</td>
						</tr>
					</table>
				</form>
			</div>
<br><br>
<a class="button" href="index.jsp">Main Menu</a>
</body>
</html>