<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<head>
<meta charset="UTF-8">
<title>Data Table</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: lightgray;
}

.container {
	display: flex;
	align-items: center;
	justify-content: center;
}

input[type="text"] {
	padding: 10px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-right: 10px;
	flex-grow: 1;
}

button {
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
	color: #fff;
	cursor: pointer;
}

.delete-button {
	background-color: #f44336;
}

.update-button {
	background-color: #4CAF50;
}
</style>
</head>
<body>
	<%@ include file="TopHedder.jsp"%>
	<%!String match;%>
	<%
	match = request.getParameter("match");
	%>
	<div class="container">
		<form action="updel" method="post">
			<input type="text" id="text-field" placeholder="Enter Email "
				name="data" value="<%=match%>">
			<button class="delete-button" name="action" value="delete">Delete</button>
			<button class="update-button" name="action" value="update">Update</button>
		</form>
	</div>
	<h1>Student Table</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Phone-No</th>
			<th>Gender</th>
			<th>Location</th>
			<th>Course</th>
			<th>Joining-Date</th>
			<th>Total-Fees</th>
			<th>Paid-Fees</th>
			<th>Remaining-Fees</th>
		</tr>
		<%!String course;
Connection con;%>
		<%
		try {
			ServletContext context = getServletContext();
			Class.forName(context.getInitParameter("url"));
			con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
			context.getInitParameter("password"));
			PreparedStatement show = con.prepareStatement("select * from students where email=?");
			show.setString(1, match);
			ResultSet view = show.executeQuery();
			if (view.next()) {
		%>
		<tr>
			<td><%=view.getString(1)%></td>
			<td><%=view.getString(5)%></td>
			<td><%=view.getLong(4)%></td>
			<td><%=view.getString(3)%></td>
			<td><%=view.getString(6)%></td>
			<td><%=view.getString(8)%></td>
			<td><%=view.getString(11)%></td>
			<td><%=view.getInt(10)%></td>
			<td><%=view.getInt(9)%></td>
			<td><%=view.getInt(7)%></td>

		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	<br>
	<h1>Student Details</h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Phone-No</th>
			<th>Email</th>
			<th>CheckIn</th>
			<th>CheckOut</th>
			<th>Total Time</th>
			<th>Date</th>
		</tr>

		<%
		try {
			ServletContext context = getServletContext();
			Class.forName(context.getInitParameter("url"));
			Connection con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
			context.getInitParameter("password"));
			String email = (String) request.getAttribute("email");
			PreparedStatement show = con.prepareStatement("select * from student_detail where email=?");
			show.setString(1, match);
			ResultSet view = show.executeQuery();

			while (view.next()) {
		%>
		<tr>
			<td><%=view.getString(1)%></td>
			<td><%=view.getLong(2)%></td>
			<td><%=view.getString(3)%></td>
			<td><%=view.getString(4)%></td>
			<td><%=view.getString(5)%></td>
			<td><%=view.getString(6)%></td>
			<td><%=view.getString(7)%></td>

		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>
