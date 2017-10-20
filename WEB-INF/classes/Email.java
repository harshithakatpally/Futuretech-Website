 import javax.servlet.*;

import javax.servlet.http.*;

import java.io.*;

import java.sql.*;




public class Email extends HttpServlet
{
	
	static final String DB_URL="jdbc:mysql://localhost/db127";

	static final String USER="root";

	static final String PASS="hasinI@24";


	 public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int flag=0;
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String em=request.getParameter("email");
				
		Connection conn=null;

		PreparedStatement stmt=null;

		ServletContext context=getServletContext();

		context.setAttribute("mail",em);

		try{

		Class.forName("com.mysql.jdbc.Driver");

		conn=DriverManager.getConnection(DB_URL,USER,PASS);

		String sql = "select email from signup2 where email=?";

		stmt=conn.prepareStatement(sql);

		stmt.setString(1,em);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			String emailc=rs.getString("email");
			if(emailc.equals(em))
			{
				
				RequestDispatcher reqd=request.getRequestDispatcher("/changepass.html");
				reqd.forward(request,response);	
				flag=1;
				break;
			}
		}
			if(flag==0)
			{
				out.println("Please enter a valid email address");
				RequestDispatcher reqd=request.getRequestDispatcher("/forgotpass.html");
				reqd.include(request,response);		
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