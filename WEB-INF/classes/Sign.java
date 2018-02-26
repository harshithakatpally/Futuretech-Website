import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

//Signs up a new user and takes to the login page
public class Sign extends HttpServlet
{
	static final String DB_URL = "jdbc:mysql://localhost/db127";
	static final String USER = "root";
	static final String PASS = "hasinI@24";
	static String uname = "";
	static String email = "";
	static String mno = "";
	static String passw = "";
	static String cpassw = "";
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		mno = req.getParameter("mobile");
		uname = req.getParameter("username");
		email = req.getParameter("email");
		passw = req.getParameter("pass");
		cpassw = req.getParameter("cpass");
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
	  Connection conn = null;
		PreparedStatement stmt = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			String sql = "insert into signup2 values(?,?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uname);
			stmt.setString(2, email);
			stmt.setString(3, mno);
			stmt.setString(4, passw);
			stmt.setString(5, cpassw);
			int i = stmt.executeUpdate();
			if(i > 0)
			{
				RequestDispatcher reqd = req.getRequestDispatcher("/loginsign.html");
				reqd.forward(req,res);
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
