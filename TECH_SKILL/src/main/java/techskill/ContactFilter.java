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

public class ContactFilter extends HttpFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ServletContext context = getServletContext();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		try {
			Class.forName(context.getInitParameter("url"));
			Connection con = DriverManager.getConnection(context.getInitParameter("dbuser"),
					context.getInitParameter("user"), context.getInitParameter("password"));
			PreparedStatement compair = con.prepareStatement("select * from students where email=?");
			compair.setString(1, email);
			ResultSet rs = compair.executeQuery();
			if (rs.next()) {
				chain.doFilter(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("registration.jsp");
				rd.include(request, response);
				out.println("<h1>Register As You Are New User</h1>");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
