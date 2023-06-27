<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>About Us - Teckskill Institute</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="styles.css">
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
		<div class="row ">
			<div class="col-md-6">
				<h1>Welcome to Teckskill Institute</h1>
				<p>Teckskill Institute is a leading educational institution
					dedicated to providing high-quality technical training to aspiring
					professionals. With a focus on practical skills and
					industry-relevant knowledge, we empower our students to excel in
					their chosen fields.</p>
				<p>Our team of experienced instructors and industry experts
					ensure that our students receive comprehensive and up-to-date
					education in areas such as software development, data science,
					cybersecurity, and more.</p>
				<p>At Teckskill Institute, we believe in a hands-on approach to
					learning. Our state-of-the-art labs and modern facilities enable
					students to gain practical experience and develop the skills
					necessary to succeed in today's competitive job market.</p>
			</div>
			<div class="col-md-6">
				<img src="Images/teckskill1.jpg" alt="Teckskill Institute Logo"
					class="img-fluid">
			</div>
		</div>
	</div>

	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<p>&copy; 2023 Teckskill Institute. All rights reserved.</p>
				</div>


			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
