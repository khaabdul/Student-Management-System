package techskill;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;

public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String name = request.getParameter("username");
		long number = Long.parseLong(request.getParameter("number"));
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		try {
			PreparedStatement insert = con
					.prepareStatement("insert into message(name,phone_no,email,message,date) values(?,?,?,?,?)");
			insert.setString(1, name);
			insert.setLong(2, number);
			insert.setString(3, email);
			insert.setString(4, message);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			String date = sdf.format(cal.getTime());
			insert.setString(5, date);
			insert.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
