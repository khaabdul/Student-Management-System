<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<style>
body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
}

.container {
	width: 300px;
	margin: 0 auto;
	margin-top: 100px;
	background-color: #fff;
	border-radius: 5px;
	padding: 20px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}

h2 {
	text-align: center;
	color: #555;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
	color: #555;
}

.form-group input[type="text"], .form-group input[type="password"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-bottom: 2px solid #ccc;
	border-radius: 0;
	transition: border-bottom-color 0.3s ease;
}

.form-group input[type="text"]:focus, .form-group input[type="password"]:focus
	{
	border-bottom-color: #4CAF50;
	outline: none;
}

.form-group input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-group input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<%@ include file="topheder.jsp"%>
	<form action="log" method="post">
		<div class="container">
			<h2>Login</h2>
			<div class="form-group">
				<label for="username">Email_Id:</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="form-group">
				<input type="submit" value="Login">
			</div>
		</div>
	</form>
</body>
</html>
