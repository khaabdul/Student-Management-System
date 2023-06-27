<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Courses</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 800px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
	color: #333;
}

.course {
	margin-bottom: 20px;
	padding: 20px;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.course h2 {
	color: #555;
}

.course p {
	color: #888;
}

.course a {
	display: inline-block;
	padding: 8px 16px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}

.course a:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ include file="topheder.jsp"%>
	<div class="container">
		<h1>Courses</h1>
		<div class="course">
			<h2>Java Course</h2>
			<p>This course teaches you the fundamentals of Java programming.</p>
			<p>40000</p>
			<a href="registration.jsp">Enroll now</a>
		</div>
		<div class="course">
			<h2>C++ Course</h2>
			<p>Learn C++ programming and build powerful applications.</p>
			<p>35000</p>
			<a href="registration.jsp">Enroll now</a>
		</div>
		<div class="course">
			<h2>HTML Course</h2>
			<p>Master the essentials of HTML and create stunning web pages.</p>
			<p>30000</p>
			<a href="registration.jsp">Enroll now</a>
		</div>
	</div>
</body>
</html>
