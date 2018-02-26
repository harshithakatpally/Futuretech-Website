import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

//Add the products into cart when user clicks on add to cart button
public class Cart extends HttpServlet
{
	static final String DB_URL="jdbc:mysql://localhost/db127";
	static final String USER="root";
	static final String PASS="hasinI@24";
	public void doPost (HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		String[] itemsSelected;
		String itemName;
		itemsSelected=req.getParameterValues("item");
		Connection conn=null;
		PreparedStatement stmt=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(DB_URL,USER,PASS);
			if(itemsSelected!=null)
			{
				out.println("hi");
				for(int i=0;i<itemsSelected.length;i++)
				{
					itemName=itemsSelected[i];
					stmt=conn.prepareStatement("insert into scart values(?)");
					stmt.setString(1,itemsSelected[i]);
					stmt.executeUpdate();
				}
			}
			out.println("Products added to shopping cart");
			stmt.close();
			conn.close();
		}catch(SQLException se){
			se.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
