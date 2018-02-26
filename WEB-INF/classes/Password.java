import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

//Changes password of the user where there is a match of emailid
public class Password extends HttpServlet
{
	static final String DB_URL = "jdbc:mysql://localhost/db127";
	static final String USER = "root";
	static final String PASS = "hasinI@24";
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String p = request.getParameter("pass");
		String cp = request.getParameter("cpass");
		Connection conn = null;
		PreparedStatement stmt = null;
		ServletContext context = getServletContext();
		String x = (String)context.getAttribute("mail");
		try
    {
		    Class.forName("com.mysql.jdbc.Driver");
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);
		    String sql = "UPDATE signup2 SET pass=?,cpass=? WHERE email=?";
		    stmt = conn.prepareStatement(sql);
		    stmt.setString(1, p);
		    stmt.setString(2, cp);
		    stmt.setString(3, x);
		    if(p.equals(cp))
		    {
			       stmt.executeUpdate();
			       RequestDispatcher reqd = request.getRequestDispatcher("/loginagain.html");
			       reqd.forward(request,response);
		    }
		    else
		    {
			       RequestDispatcher reqd = request.getRequestDispatcher("/changepass.html");
			       reqd.forward(request,response);
		    }
		    stmt.close();
		    conn.close();
		}catch(SQLException se){
        se.printStackTrace();
   	}catch(Exception e){
      	e.printStackTrace();
		}
	}
}
