import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class Login extends HttpServlet
{
	static final String DB_URL = "jdbc:mysql://localhost/db127";
	static final String USER = "root";
	static final String PASS = "hasinI@24";
	static String emailid = "";
	static String pass = "";
	int flag = 0;
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	{
		emailid = req.getParameter("email");
		pass = req.getParameter("pass");
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();
		Connection conn = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			String sql = "select email,pass from signup2 where email=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, emailid);
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				String mail = rs.getString("email");
				String passw = rs.getString("pass");
				if((mail.equals(emailid)) && (passw.equals(pass)))
				{
					pw.println("<html>");
					pw.println("<head>");
					pw.println("</head>");
					pw.println("<body>");
					pw.println("<p>Welcome.<p>"+mail);
					pw.println("</body>");
					pw.println("</html>");
					flag = 1;
					break;
				}
			}
			if(flag == 0)
			{
				pw.println("<html>");
				pw.println("<head>");
				pw.println("</head>");
				pw.println("<body>");
				pw.println("<p>Login failed.Please try again<p>");
				pw.println("</body>");
				pw.println("</html>");
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
