<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial;
}

* {
	box-sizing: border-box;
}

form.example input[type=text] {
	padding: 10px;
	font-size: 17px;
	border: 1px solid grey;
	float: left;
	width: 80%;
	background: #f1f1f1;
}

form.example button {
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;
}

form.example button:hover {
	background: #0b7dda;
}

form.example::after {
	content: "";
	clear: both;
	display: table;
}
</style>
</head>
<html>
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
</style>
</head>
<body>
	<%@ include file="TopHedder.jsp"%>
	<br>
	<form action="BothData.jsp" class="example"
		style="margin: auto; max-width: 300px">
		<input type="text" placeholder="Search.." name="match">
		<button type="submit">
			<i class="fa fa-search"></i>
		</button>
	</form>
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

		<%
		try {
			ServletContext context = getServletContext();
			Class.forName(context.getInitParameter("url"));
			Connection con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
			context.getInitParameter("password"));
			String email = (String) request.getAttribute("email");
			PreparedStatement show = con.prepareStatement("select * from students");
			ResultSet view = show.executeQuery();

			while (view.next()) {
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
			<td><%=view.getInt(7)%></td>
			<td><%=view.getInt(9)%></td>

		</tr>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
	<br>
	<div align="center">
		<form action="Admin.jsp">
			<input type="submit" value="INFO" name="details"> <input
				type="submit" value="COMPLAIN" name="contact"> <input
				type="submit" value="BACK" name="back">
		</form>
	</div>
	<%
	String btn = request.getParameter("details");
	String comp = request.getParameter("contact");
	if (btn != null) {
	%>
	<%@include file="StudentDetails.jsp"%>
	<%
	}
	if (comp != null) {
	%>
	<%@include file="Complain.jsp"%>
	<%
	}
	%>
</body>
</html>
