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
	Connection con;
	int tmeOut = 20;%>
		<%
		HttpSession user = request.getSession();
		try {
			String email = (String) user.getAttribute("email");
			ServletContext context = getServletContext();
			Class.forName(context.getInitParameter("url"));
			con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
			context.getInitParameter("password"));
			PreparedStatement show = con.prepareStatement("select * from students where email=?");
			show.setString(1, email);
			ResultSet view = show.executeQuery();
			if (view.next()) {
				course = view.getString(8);
				SimpleDateFormat loginTime = new SimpleDateFormat("HH:mm:ss");
				Date logtime = new Date();
				user.setAttribute("inTime", logtime.getTime());
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
	<br>
	<%
	if (course.equalsIgnoreCase("java")) {
	%>
	<a href="https://www.javatpoint.com/java-tutorial">Start Study</a>
	<%
	}
	%>
	<%
	if (course.equalsIgnoreCase("html")) {
	%>
	<a href="https://www.javatpoint.com/html-tutorial">Start Study</a>
	<%
	}
	%>
	<%
	if (course.equalsIgnoreCase("c++")) {
	%>
	<a href="https://www.javatpoint.com/cpp-tutorial">Start Study</a>
	<%
	}
	%>





</body>
</html>
