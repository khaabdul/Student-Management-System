package techskill;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Home
 */
//@WebServlet("/Home")
public class Login extends HttpServlet {
	ServletContext context;
	Connection con;
	RequestDispatcher studentdata;

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
		String email = request.getParameter("username");
		HttpSession user = request.getSession();
		user.setAttribute("email", email);
		request.setAttribute("email", email);
		request.getRequestDispatcher("StudentData.jsp").include(request, response);

	}

}
