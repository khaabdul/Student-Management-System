<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
}

.container {
	max-width: 400px;
	margin: 0 auto;
	padding: 40px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 4px;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}

form input, form textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

form textarea {
	height: 120px;
}

button {
	display: block;
	width: 100%;
	padding: 10px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
<title>Contact Page</title>


</head>
<body>
	<%
	HttpSession user = request.getSession();
	String email = (String) user.getAttribute("email");
	if (email != null) {
	%>
	<%@ include file="TopHedder.jsp"%>
	<%
	} else if (email == null) {
	%>
	<%@ include file="topheder.jsp"%>
	<%
	}
	%>
	<div class="container">
		<h1>Contact Us</h1>
		<form action="mes" method="post">
			<input type="text" name="username" placeholder="Username" required>
			<input type="tel" name="number" placeholder="Phone Number" required>
			<input type="email" name="email" placeholder="Email Address"
				value="<%=email%>" required>
			<textarea name="message" placeholder="Your Message" required></textarea>
			<button type="submit">Send Message</button>
		</form>
	</div>
</body>
</html>

