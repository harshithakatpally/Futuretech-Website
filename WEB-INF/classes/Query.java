import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

//Takes the values input in the query page and store them in the database
public class Query extends HttpServlet
{
	static final String DB_URL = "jdbc:mysql://localhost/db127";
	static final String USER = "root";
	static final String PASS = "hasinI@24";
	static String uname = "";
	static String emailid = "";
	static String mno = "";
	static String query = "";
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		mno = req.getParameter("mobile");
		uname = req.getParameter("uname");
		emailid = req.getParameter("email");
		query = req.getParameter("query");
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		pw.println("<html>");
		pw.println("<head>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>Your data has been inserted in the database.<p>");
		pw.println("</body>");
		pw.println("</html>");
		Connection conn = null;
		PreparedStatement stmt = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			String sql = "insert into query values(?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uname);
			stmt.setString(2, emailid);
			stmt.setString(3, mno);
			stmt.setString(4, query);
			int i = stmt.executeUpdate();
			if(i > 0)
			{
				RequestDispatcher reqd = req.getRequestDispatcher("/queryack.html");
				reqd.forward(req, res);
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
