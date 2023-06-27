<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TECKSKILL Institute</title>
<style>
/* Add your custom styles here to make the page beautiful */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

/* Navigation bar styles */
.navbar {
	background-color: #333;
	color: #fff;
	display: flex;
	padding: 10px 20px;
}

.navbar a {
	color: #fff;
	text-decoration: none;
	margin: 0 10px;
}

.navbar a:hover {
	text-decoration: underline;
}

.navbar .logo {
	font-size: 24px;
	font-weight: bold;
}

.navbar .login-btn, .navbar .register-btn {
	background-color: #fff;
	color: #333;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	font-weight: bold;
	cursor: pointer;
	text-decoration: none;
	margin-left: 10px;
}

.navbar .login-btn:hover, .navbar .register-btn:hover {
	background-color: #f2f2f2;
}

#outter_div {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
}

#right_div {
	
}

/* Rest of your styles */
/* ... */
</style>
</head>
<body>
	<form action="ghar" method="post">

		<header>
			<nav class="navbar">

				<div id="outter_div">

					<div id="left_div">


						<div id="logo">

							<a href="home.jsp" class="logo">TECKSKILL Institute</a>

						</div>

						<div id="date">


							<%=new Date()%>


						</div>

					</div>

					<div id="right_div">

						<a href="home.jsp">Home</a> <a href="courses.jsp">Courses</a> <a
							href="about.jsp">About</a> <a href="contactus.jsp">Contact</a> <a
							href="login.jsp" class="login-btn">Login</a> <a
							href="registration.jsp" class="register-btn">Register</a>

					</div>

				</div>

			</nav>
		</header>

		<!-- The rest of your webpage content goes here -->
		<!-- ... -->
	</form>
</body>
</html>