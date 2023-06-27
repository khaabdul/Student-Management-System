package techskill;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
//@WebServlet("/Register")
public class Register extends HttpServlet {
	ServletContext context;
	Connection con;

	public void init() throws ServletException {
		context = getServletContext();
		try {
			Class.forName(context.getInitParameter("url"));
			con = DriverManager.getConnection(context.getInitParameter("dbuser"), context.getInitParameter("user"),
					context.getInitParameter("password"));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		RequestDispatcher error = request.getRequestDispatcher("ErrorPage.jsp");
		String name = request.getParameter("name");
		String pass = request.getParameter("password");
		String gender = request.getParameter("gender");

		String email = request.getParameter("email");
		String location = request.getParameter("location");
		String course = request.getParameter("courses");
		int fees = Integer.parseInt(request.getParameter("fees"));
		int paid_fees = 0;
		int total_fees = 0;
		int reminder_fees = 0;
		if (course.equalsIgnoreCase("java")) {
			if (fees <= 40000) {
				paid_fees = fees;
				total_fees = 40000;
				reminder_fees = total_fees - paid_fees;
			} else {
				error.include(request, response);
				out.println("<h1>Error Fees Cannot Be More Than 40000</h1>");
			}

		} else if (course.equalsIgnoreCase("c++")) {
			if (fees <= 35000) {
				paid_fees = fees;
				total_fees = 35000;
				reminder_fees = total_fees - paid_fees;
			} else {
				error.include(request, response);
				out.println("<h1>Error Fees Cannot Be More Than 35000</h1>");
			}
		} else if (course.equalsIgnoreCase("html")) {
			if (fees <= 30000) {
				paid_fees = fees;
				total_fees = 30000;
				reminder_fees = total_fees - paid_fees;
			} else {
				error.include(request, response);
				out.println("<h1>Error Fees Cannot Be More Than 30000</h1>");
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		try {
			PreparedStatement insert = con.prepareStatement(
					"insert into students(name,password,gender,phone,email,location,fees,course,remaining_fees,total_fees,date) values(?,?,?,?,?,?,?,?,?,?,?)");
			insert.setString(1, name);
			insert.setString(2, pass);
			insert.setString(3, gender);
			insert.setString(5, email);
			insert.setString(6, location);
			insert.setInt(7, paid_fees);
			insert.setString(8, course);
			insert.setInt(9, reminder_fees);
			insert.setInt(10, total_fees);
			insert.setString(11, date);
			if (request.getParameter("phone").matches("^[0-9]{10}$")) {
				long phone = Long.parseLong(request.getParameter("phone"));
				insert.setLong(4, phone);
			} else {
				error.include(request, response);
				out.println("<h1>Enter Valid Number</h1>");
			}
			insert.executeUpdate();
			RequestDispatcher login = request.getRequestDispatcher("login.jsp");
			login.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
