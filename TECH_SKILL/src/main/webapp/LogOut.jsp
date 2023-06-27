<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con;
	long rem;
	long rem2;%>
	<%
	HttpSession user = request.getSession();
	String email = (String) user.getAttribute("email");
	ServletContext context = getServletContext();
	Class.forName(context.getInitParameter("url"));
	con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
			context.getInitParameter("password"));
	PreparedStatement show = con.prepareStatement("select * from students where email=?");
	show.setString(1, email);
	ResultSet view = show.executeQuery();
	if (view.next()) {
		SimpleDateFormat checkOut = new SimpleDateFormat("HH:mm:ss");
		Date OutTime = new Date();
		long intime = (Long) user.getAttribute("inTime");
		long outtime = OutTime.getTime();
		long totaltime = outtime - intime;
		long diffHours = totaltime / (60 * 60 * 1000);
		rem = totaltime % (60 * 60 * 1000);
		long diffMinutes = rem / (60 * 1000);
		rem2 = rem % (60 * 1000);
		long diffSeconds = rem2 / 1000;
		String total = diffHours + ":" + diffMinutes + ":" + diffSeconds;
		SimpleDateFormat logindate = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		SimpleDateFormat checkin = new SimpleDateFormat("HH:mm:ss");
		Date inTime = new Date(intime);
		PreparedStatement insert = con.prepareStatement(
		"insert into student_detail(name,phone,email,checkin,checkout,total,date) values(?,?,?,?,?,?,?)");

		insert.setString(1, view.getString(1));
		insert.setLong(2, view.getLong(4));
		insert.setString(3, email);
		insert.setString(4, checkin.format(inTime));
		insert.setString(5, checkOut.format(OutTime));
		insert.setString(6, total);
		insert.setString(7, logindate.format(date));
		insert.executeUpdate();
	}
	user.invalidate();
	request.getRequestDispatcher("home.jsp").include(request, response);
	%>
</body>
</html>