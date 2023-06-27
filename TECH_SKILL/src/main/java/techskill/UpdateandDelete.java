package techskill;

import java.io.IOException;
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

public class UpdateandDelete extends HttpServlet {
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
		String data = request.getParameter("data");
		String btn = request.getParameter("action");
		RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
		try {
			PreparedStatement match = con.prepareStatement("select * from students where email=?");
			match.setString(1, data);
			ResultSet matc = match.executeQuery();
			if (matc.next()) {
				if (btn.equals("delete")) {
					PreparedStatement delete = con.prepareStatement("delete from students where email=?");
					PreparedStatement delete_data = con.prepareStatement("delete from student_detail where email=?");
					delete.setString(1, data);
					delete_data.setString(1, data);
					delete.executeUpdate();
					delete_data.executeUpdate();
					rd.forward(request, response);
				} /*
					 * else if (btn.equals("update")) { PreparedStatement delete =
					 * con.prepareStatement("update students set where email=?");
					 * delete.setString(1, data); delete.executeUpdate(); rd.forward(request,
					 * response); }
					 */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
