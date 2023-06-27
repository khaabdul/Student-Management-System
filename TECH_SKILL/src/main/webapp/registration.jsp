<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Page</title>
<style>
/* Add some basic styling */
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	padding: 20px;
}

h1 {
	text-align: center;
}

.register {
	max-width: 400px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="text"], input[type="password"], input[type="email"], select
	{
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-bottom: 15px;
}

input[type="submit"], input[type="reset"] {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

select {
	height: 35px;
}

/* Additional styling for the form layout */
.form-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-gap: 10px;
}

.form-row>div {
	display: flex;
	flex-direction: column;
}

@media ( max-width : 480px) {
	.form-row {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<%@ include file="topheder.jsp"%>
	<h1>Registration Page</h1>
	<form  action="reg" method="post" class="register">
		<div class="form-row">
			<div>
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div>
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" required>
			</div>
		</div>
		<div class="form-row">
			<div>
				<label for="gender">Gender:</label> <select id="gender"
					name="gender" required>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="other">Other</option>
				</select>
			</div>
			<div>
				<label for="phone">Phone Number:</label> <input type="text"
					id="phone" name="phone" required>
			</div>
		</div>
		<div class="form-row">
			<div>
				<label for="email">Email ID:</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div>
				<label for="location">Location:</label> <input type="text"
					id="location" name="location" required>
			</div>
		</div>
		<div class="form-row">
			<div>
				<label for="fees">Fees:</label> <input type="text" id="fees"
					name="fees" required>
			</div>
			<div>
				<label for="courses">Courses:</label> <select id="courses"
					name="courses" required>
					<option value="java">JAVA</option>
					<option value="html">HTML</option>
					<option value="c++">C++</option>
				</select>
			</div>
		</div>
		<input type="submit" value="Register"> <input type="reset"
			value="Reset">
	</form>
</body>
</html>
