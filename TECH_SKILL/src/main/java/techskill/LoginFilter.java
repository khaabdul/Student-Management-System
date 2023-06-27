package techskill;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ServletContext context = getServletContext();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("username");
		String pass = request.getParameter("password");
		try {
			Class.forName(context.getInitParameter("url"));
			Connection con = DriverManager.getConnection(context.getInitParameter("dbuser"),
					context.getInitParameter("user"), context.getInitParameter("password"));
			PreparedStatement compair = con.prepareStatement("select * from students where email=? and password=?");
			compair.setString(1, email);
			compair.setString(2, pass);
			ResultSet show = compair.executeQuery();

			PreparedStatement admincompair = con
					.prepareStatement("select * from admin_ts where email=? and password=?");
			admincompair.setString(1, email);
			admincompair.setString(2, pass);
			ResultSet showadmin = admincompair.executeQuery();
			if (show.next()) {
				chain.doFilter(request, response);
			} else if (showadmin.next()) {
				request.getRequestDispatcher("Admin.jsp").include(request, response);
			} else {
				request.getRequestDispatcher("registration.jsp").include(request, response);
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}
}
